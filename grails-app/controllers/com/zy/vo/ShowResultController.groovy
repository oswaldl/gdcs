package com.zy.vo

import org.codehaus.groovy.grails.commons.GrailsApplication

import us.codecraft.webmagic.Spider

import com.zy.auth.User
import com.zy.gdcs.webmagic.SnpediaPipeline
import com.zy.gdcs.webmagic.SnpediaRepoPageProcessor

class ShowResultController {

	GrailsApplication grailsApplication
	def springSecurityService
	
    def index() {
		User user
		if(params.username){
			user=User.findByUsername(params.username)
		}else{
			user=springSecurityService.getCurrentUser()
			if(user.isAdmin){
				redirect(controller:"console")
				return
			}
		}
		
		def currenUser=springSecurityService.getCurrentUser()
		
		//疾病风险
		def illnesses=SNPRelation.findAllByUser(user).collect {
			it.illness
		}.grep(){
			it.isShow
		}.toSet().sort{it.id}
		
		//非公用-用药指导
		//修改后没有了私有个人配置，对应个人的的配置全部移到公有里面，结果不变所以要在这里生成个人的UserDrugRelation
		DrugResponse.findAll().each{
			new UserDrugRelation(drugResponse:it,username:user.username).save(failOnError: true)
		}
		def drugResponses=UserDrugRelation.findAllByUsername(user.username).collect{
			it.drugResponse
		}.toSet().sort{it.id}
		
		//先天性遗传
//		def inheritedConditionses=InheritedConditions.findAllByUsername(user.username)
		Inherited.findAll().each{
			new UserInherited(inherited:it,username:user.username).save(failOnError: true)
		}
		def inheriteds=UserInherited.findAllByUsername(user.username).collect{
			it.inherited
		}.toSet().sort{it.id}
		
		//个性谱
		Triats.findAll().each{
			new UserTriats(triats:it,username:user.username).save(failOnError: true)
		}
		def userTriats=UserTriats.findAllByUsername(user.username).collect{
			it.triats
		}.toSet().sort{it.id}
		
		//未知参数,生成pdf时使用,将首页全部展开
		def inPDF=false
		if(params.inPDF){
			inPDF=true
		}
		
		
		[inPDF:inPDF,
			currenUser:currenUser,
			illnesses:illnesses,
			username:user.username,
			drugResponses:drugResponses,
			inheriteds:inheriteds,
			userTriats:userTriats]
	}

	def show(){
		def username=params.username
		User user=User.findByUsername(username)
		def illnesses=SNPRelation.findAllByUser(user).collect {
			it.illness
		}.toSet().sort{it.id}
		Map map=new HashMap<Illness, List>()
		illnesses.each {illness->
			def genes=SNPRelation.findAllByUserAndIllness(user,illness).collect {
				it.gene
			}
			map.put(illness, genes);
		}
		[user:user,illnesses:illnesses,map:map]
	}

	def showIllnessByGene(){
		Gene gene=Gene.get(params.id)
		def illnesses=SNPRelation.findAllByGene(gene).collect {
			it.illness
		}.toSet()
		[gene:gene,illnesses:illnesses]
	}

	def editDesc(){
		Illness illness=Illness.get(params.illnessId)
		String type=params.type
		def description
		if(type=="description"){
			description=illness.description
		}else if(type=="canDo"){
			description=illness.canDo
		}else if(type=="geneticEnvironment"){
			description=illness.geneticEnvironment
		}else{
			println "no type"
		}
		[illness:illness,type:type,description:description]
	}

	def saveDesc(){
		Illness illness=Illness.get(params.illnessId)
		String type=params.type
		if(type=="description"){
			illness.description=params.description
		}else if(type=="canDo"){
			illness.canDo=params.description
		}else if(type=="geneticEnvironment"){
			illness.geneticEnvironment=params.description
		}else{
			println "no type"
		}
		illness.save(failOnError:true)
		redirect(controller:"illness",action:"edit",params:[id:illness.id])
	}

	def getDataByURL(){
		SnpediaRepoPageProcessor processer=new SnpediaRepoPageProcessor();
		SnpediaPipeline pline=new SnpediaPipeline();
		grailsApplication.mainContext.autowireCapableBeanFactory.autowireBean(processer)
		grailsApplication.mainContext.autowireCapableBeanFactory.autowireBean(pline)
		String url=params.url
		Spider.create(processer)
				//从"https://github.com/code4craft"开始抓
				.addUrl(url)
				.addPipeline(pline)
				//开启5个线程抓取
				.thread(5)
				//启动爬虫
				.run();
		render "success"
	}

	def getUserData(){
	}
	
	def searchData(){
		def searchString=params.searchString
		def user=User.findByUsername(params.username)
		def illnesses=Illness.findAllByNameLike("%"+searchString+"%")
		if(illnesses.size()>0){
			Illness illness=illnesses.get(0)
			redirect(controller:"illness",action:"showIllness",params:[illnessId:illness.id,username:user.username])
			return
		}else{
			redirect(controller:"showResult",action:"index")
			return
		}
		
	}
	
	def allInOne(){
		def user
		if(params.username){
			user=User.findByUsername(params.username)
		}else{
			user=springSecurityService.getCurrentUser()
			if(user.isAdmin){
				redirect(controller:"console")
				return
			}
		}
		
		def currenUser=springSecurityService.getCurrentUser()
		def illnesses=SNPRelation.findAllByUser(user).collect {
			it.illness
		}.toSet().sort{it.id}
		
		def drugResponses=UserDrugRelation.findAllByUsername(user.username).collect{
			it.drugResponse
		}.toSet().sort{it.id}
		
		def inheritedConditionses=InheritedConditions.findAllByUsername(user.username)
		
		def inPDF=false
		if(params.inPDF){
			inPDF=true
		}
		
		[inPDF:inPDF,currenUser:currenUser,illnesses:illnesses,username:user.username,drugResponses:drugResponses,inheritedConditionses:inheritedConditionses]
	}

}

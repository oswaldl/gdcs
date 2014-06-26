package com.zy.vo

import org.codehaus.groovy.grails.commons.GrailsApplication;

import us.codecraft.webmagic.Spider;

import com.zy.gdcs.webmagic.SnpediaPipeline;
import com.zy.gdcs.webmagic.SnpediaRepoPageProcessor;

class ShowResultController {

	GrailsApplication grailsApplication
	
    def index() {
		User user=User.findByUsername(params.username)
		def illnesses=SNPRelation.findAllByUser(user).collect {
			it.illness
		}.toSet().sort{it.id}
		[illnesses:illnesses,username:user.username]
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
		[illness:illness,type:params.type]
	}
	
	def saveDesc(){
		Illness illness=Illness.get(params.illnessId)
		def type=params.type
		if(type.equals("description")){
			illness.description=params.description
		}else if(type.equals("canDo")){
			illness.canDo=params.description
		}else if(type.equals("geneticEnvironment")){
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
		
		Spider.create(processer)
				//从"https://github.com/code4craft"开始抓
				.addUrl("http://files.snpedia.com/reports/genome_Mike_Spear_pooled.html")
				.addPipeline(pline)
				//开启5个线程抓取
				.thread(5)
				//启动爬虫
				.run();
		render "success"
	}
	
}

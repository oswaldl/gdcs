package com.zy.vo

import org.codehaus.groovy.grails.commons.GrailsApplication;

import us.codecraft.webmagic.Spider;

import com.zy.gdcs.webmagic.SnpediaPipeline;
import com.zy.gdcs.webmagic.SnpediaRepoPageProcessor;

class ShowResultController {

	GrailsApplication grailsApplication
	
    def index() { 
		redirect(action: "show", params: [username:'mike'])
	}
	
	def show(){
		def username=params.username
		User user=User.findByUsername(username)
		def illnesses=SNPRelation.findAllByUser(user,[sort:'id',order:'asc']).collect {
			it.illness
		}.toSet()
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
		[illness:illness,username:params.username]
	}
	
	def saveDesc(){
		Illness illness=Illness.get(params.illnessId)
		illness.description=params.description
		illness.save(failOnError:true)
		redirect(action: "show", params: [username:params.username])
	}

	def test(){
		
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

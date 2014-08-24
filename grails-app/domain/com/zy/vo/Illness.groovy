package com.zy.vo

import com.zy.auth.User

/**
 * 记录病例和相关的公有信息
 * @author ACER
 *
 */

class Illness {
	//英文病例名称
	String name
	//中文名
	String chineseName
	//病例介绍说明
	String description
	//你可以做什么
	String canDo
	//遗产和环境
	String geneticEnvironment
	//参考文献
	String reference
	//平均人群风险值
	String averageRisk
	//是否显示
	boolean isShow = true
	
	double getRisk(){
		if(!this.averageRisk){
			this.averageRisk="0"
		}
		return Double.valueOf(this.averageRisk)
	}
	
	int getMagnitude(){
		def lists=SNPRelation.findAllByIllness(this).collect {
						it.gene.magnitude
					}.toSet().sort{it}
		int magnitude=0
		def magnitudeString=lists.get(lists.size()-1)
		if(magnitudeString){
			Double mag=Double.valueOf(magnitudeString)
			magnitude=(int)Math.ceil(mag)
		}
		return magnitude
	}
	
	int getGoodGenesCount(User user){
		def snps=SNPRelation.findAllByIllnessAndUser(this, user)
		def genes=snps.collect{it.gene}.sort{it.getMagnitude()}.reverse()
		if(genes.size()>10){
			genes=Gene.getGenes(snps)
		}
		int goodNum=0
		genes.each {
			if(it.repute=="good"){
				goodNum=goodNum+1
			}
		}
		return goodNum
	}
	
	int getGoodGenesCount(String username){
		def snps=SNPRelation.findAllByIllnessAndUser(this, User.findByUsername(username))
		def genes=snps.collect{it.gene}.sort{it.getMagnitude()}.reverse()
		if(genes.size()>10){
			genes=Gene.getGenes(snps)
		}
		int goodNum=0
		genes.each {
			if(it.repute=="good"){
				goodNum=goodNum+1
			}
		}
		return goodNum
	}
	
	int getBadGenesCount(User user){
		def snps=SNPRelation.findAllByIllnessAndUser(this, user)
		def genes=snps.collect{it.gene}.sort{it.getMagnitude()}.reverse()
		if(genes.size()>10){
			genes=Gene.getGenes(snps)
		}
		int badNum=0
		genes.each {
			if(it.repute=="bad"){
				badNum=badNum+1
			}
		}
		return badNum
	}
	
	int getBadGenesCount(String username){
		def snps=SNPRelation.findAllByIllnessAndUser(this, User.findByUsername(username))
		def genes=snps.collect{it.gene}.sort{it.getMagnitude()}.reverse()
		if(genes.size()>10){
			genes=Gene.getGenes(snps)
		}
		int badNum=0
		genes.each {
			if(it.repute=="bad"){
				badNum=badNum+1
			}
		}
		return badNum
	}
	
	static belongsTo = [illnessCat: IllnessCat]

    static constraints = {
		name blank: false, unique: true
		chineseName nullable:true
		description nullable:true,maxSize: 3000
		canDo nullable:true,maxSize: 3000
		geneticEnvironment nullable:true,maxSize: 3000
		reference nullable:true,maxSize: 3000
		averageRisk nullable:true
    }
}

package com.zy.vo

/**
 * 个性谱公有
 * @author oswaldl
 *
 */
class Triats {
	
	String name
	String chineseName
	
	//研究数量
	int magnitude
	//前言
	String introduction
	
	//结果
	String result
	//遗传和环境因素
	String genetics
	//生物学作用
	String biology
	//主要发现
	String findings
	
	//基因摘要
	static hasMany = [geneAbstract: GeneAbstract]
	
    static constraints = {
		introduction nullable:true,maxSize: 3000
		genetics nullable:true,maxSize: 3000
		biology nullable:true,maxSize: 3000
		findings nullable:true,maxSize: 3000
		chineseName nullable:true
		name nullable:true
		result nullable:true
		
    }
	
	public int getAllStudySize(){ 
		int rtn = 0;
		geneAbstract?.each{
			rtn += it.studySize
		}
		return rtn;
	}
}

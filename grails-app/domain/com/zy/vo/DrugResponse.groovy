package com.zy.vo

/**
 * 药品谱的共有信息
 * @author ACER
 *
 */

class DrugResponse {
	
	String name
	String chineseName
	
	//研究数量
	int magnitude
	
	//遗传学研究
	String genetics
	//参考文献
	String reference
	
	//引言
	String introduction
	//基因摘要
	static hasMany = [geneAbstract: GeneAbstract]

    static constraints = {
		name nullable:true
		chineseName nullable:true
		genetics nullable:true,maxSize: 3000
		reference nullable:true,maxSize: 3000
		introduction nullable:true,maxSize: 3000
		geneAbstract nullable:true
    }
}

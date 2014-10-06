package com.zy.vo

class Inherited {
	
	String name
	String chineseName
	
	//你的基因数据
	String geneData
	//技术报告
	String oddRatio
	
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
		geneData nullable:true
		oddRatio nullable:true
		genetics nullable:true,maxSize: 3000
		reference nullable:true,maxSize: 3000
		introduction nullable:true,maxSize: 3000
    }
}

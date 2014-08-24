package com.zy.vo

class GeneAbstract {
	String name
	//杂志
	String journal
	//研究规模
	int studySize=0
	//标记
	String marker
	//描述
	String description
	//基因类型及影响
	String types
	
	//参考文献，对于个性谱才存在
	String reference
	
    static constraints = {
		name nullable:true
		journal nullable:true
		marker nullable:true
		description nullable:true,maxSize: 3000
		types nullable:true,maxSize: 3000
		reference nullable:true,maxSize: 3000
    }
}

package com.zy.vo

/**
 * 人员的药品谱非公有数据
 * @author ACER
 *
 */

class UserDrugRelation {
	//对应的用户名
	String username
	//对应的病症公有信息
	DrugResponse drugResponse
	
	//检测状态
	String state
	
	//你的基因数据
	String geneData
	//技术报告
	String oddRatio
	
    static constraints = {
		state nullable:true
		geneData nullable:true,maxSize: 3000
		oddRatio nullable:true,maxSize: 3000
		
    }
}

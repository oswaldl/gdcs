package com.zy.vo

import com.zy.auth.User;

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
	
//	//检测状态
//	String state
	
	//你的基因数据
	String geneData
	//技术报告
	String oddRatio
	
	String getState(){
		String description=this.drugResponse?.geneAbstract?.types
		String state
		SNPRelation.findAllByUser(User.findByUsername(this.username)).collect{it.gene}.each {
			if(it.getName(it.name)==this.drugResponse?.geneAbstract?.marker){
				description.split(",").each {type->
					if(type.split(":")[0]==it.getType(it.name).replaceAll(';', '')){
						state = type.split(":")[2]
					}
				}
			}
		}
		return state
	}
	
    static constraints = {
		geneData nullable:true,maxSize: 3000
		oddRatio nullable:true,maxSize: 3000
		
    }
}

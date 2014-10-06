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
	
	
	String getState(){
		String description=this.drugResponse?.geneAbstract?.types
		String state
		SNPRelation.findAllByUser(User.findByUsername(this.username)).collect{it.gene}.each {
			if(it.getName(it.name)==this.drugResponse?.geneAbstract?.marker){
				description.split(",").each {type->
					try{
						if(type.split(":")[0]==it.getType(it.name).replaceAll(';', '')){
							state = type.split(":")[2]
						}
					}catch(e){
						println "invalid type :"+type+",  the length should be 3."
					}
				}
			}
		}
		return state
	}
	
	//基因数据
	String getGeneData(){
		User user=User.findByUsername(this.username)
		String geneData=this.drugResponse.geneData
	}
	
	//技术报告
	String getOddRatio(){
		User user=User.findByUsername(this.username)
		String oddRatio=this.drugResponse.oddRatio
		
	}
	
    static constraints = {
    }
}

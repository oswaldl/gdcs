package com.zy.vo

import com.zy.auth.User;

class UserInherited {
	
	//对应的用户名
	String username
	//对应的健康谱公有信息
	Inherited inherited
	
	String getState(){
		String state="见报告"
		if(this.inherited?.geneAbstract.size()==1){
			def geneAbstract=this.inherited?.geneAbstract.toList().get(0)
			String description=geneAbstract?.types
			SNPRelation.findAllByUser(User.findByUsername(this.username)).collect{it.gene}.each {
				if(it.getName(it.name)==geneAbstract?.marker){
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
		}
		return state
	}

    static constraints = {
    }
}

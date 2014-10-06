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
		
		//获取技术报告的最高值
		String str="-"
		Map map=getOddRatio()
		for (Map.Entry<Gene, String> entry : map.entrySet()) {
			if(entry.getValue()!="-"){
				if(entry.getValue()=="+"){
					str="+"
				}else{
					str="--"
				}
			}
		}
		//根据最高值获取结果
		String result=""
		geneData.split(";").each {
			if(it.split(":")[0]==str){
				result=it.split(":")[1]
			}
		}
		
		return result
	}
	
	//技术报告
	Map getOddRatio(){
		User user=User.findByUsername(this.username)
		String oddRatioStr=this.drugResponse.oddRatio
		Map map=new HashMap<Gene, String>()
		oddRatioStr.split(";").each {
			int index1=it.indexOf("(")
			String geneName=it.substring(0, index1)
			Gene gene=Gene.findByNameLike(geneName+"(%")
			String types=it.substring(index1+1, it.indexOf(")"))
			String type=""
			types.split(",").each {typeCon->
				if(typeCon.split(":")[0]==gene.getType(gene.name).replace(";", "")){
					type=typeCon.split(":")[1]
				}
			}
			map.put(gene, type)
		}
		return map
	}
	
    static constraints = {
    }
}

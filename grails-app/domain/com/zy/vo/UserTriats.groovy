package com.zy.vo

class UserTriats {
	//用户名
	String username
	//个性谱
	Triats triats
	//检测结果
	String result="见报告"
	
	String getResult(){
		String re
		if(this.triats.geneAbstract.size()>1){
			re="见报告"
		}else{
			String resultStr=this.triats.result
			String geneName=resultStr.substring(0,resultStr.indexOf("("))
			Gene gene=Gene.findByNameLike(geneName+"(%")
			resultStr.substring(resultStr.indexOf("(")+1,resultStr.indexOf(")")).split(",").each {
				if(it.split(":")[0]==gene.getType(gene.name).replace(";", "")){
					re=it
				}
			}
		}
		return re
	}

    static constraints = {
		result nullable:true 
    }
}

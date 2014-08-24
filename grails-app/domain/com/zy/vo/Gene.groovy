package com.zy.vo
/**
 * 记录基因信息
 * @author ACER
 *
 */

class Gene {
	//snp名称
	String name
	//snp对病例的影响说明
	String description1
	//基因本身的描述
	String description2
	//snp的好坏,good,bad,normal
	String repute
	//研究的人数多少，越高说明相关信息越准确
	String magnitude
	
	String frequency
	String references
	
	String getName(String string){
		int index=string.indexOf("(")
		if(index==-1)
			return string
		return string.substring(0, index)
	}
	
	double Magnitude(){
		double mag=0
		if(this.magnitude){
			mag=Double.valueOf(this.magnitude)
		}
		return mag
	}
	
	String getType(String string){
		int index1=string.indexOf("(")
		int index2=string.indexOf(")")
		return string.substring(index1+1, index2)
	}
	
    static constraints = {
		name blank: false, unique: true
		magnitude nullable:true
		frequency nullable:true
		references nullable:true
		description1 nullable:true,maxSize: 3000
		description2 nullable:true,maxSize: 3000
    }
	
	//获取References大于10的集合,研究数量要够大才有意义
	def static getGenes(def snps){
		def lists=new ArrayList<Gene>()
		snps.collect{it.gene}.each {
			if(it.references){
				if(Integer.parseInt(it.references)>9){
					lists.add(it)
				}
			}
		}
		return lists.sort{it.getMagnitude()}.reverse()
	}
}

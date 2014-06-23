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

    static constraints = {
		name blank: false, unique: true
		magnitude nullable:true
		description1 nullable:true,maxSize: 3000
		description2 nullable:true,maxSize: 3000
    }
}

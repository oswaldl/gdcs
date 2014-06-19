package com.zy.vo

class Gene {
	//snp名称
	String name
	//snp说明
	String description1
	String description2
	//snp的好坏
	boolean isReputeGood

    static constraints = {
		name blank: false
		description1 nullable:true
		description2 nullable:true
    }
}

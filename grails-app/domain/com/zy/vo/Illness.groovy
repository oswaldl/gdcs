package com.zy.vo

class Illness {
	//病例名称
	String name
	//说明
	String description

    static constraints = {
		name blank: false, unique: true
		description nullable:true,maxSize: 3000
    }
}

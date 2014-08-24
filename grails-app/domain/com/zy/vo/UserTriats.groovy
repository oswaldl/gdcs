package com.zy.vo

class UserTriats {
	//用户名
	String username
	//个性谱
	Triats triats
	//检测结果
	String result="见报告"

    static constraints = {
		result nullable:true 
    }
}

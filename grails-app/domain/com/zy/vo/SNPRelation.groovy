package com.zy.vo

import com.zy.auth.User

/**
 * 记录病例基因和人的对应关系，单位为基因（一个基因对应一条信息）
 * @author ACER
 *
 */

class SNPRelation {
	//对应人员
	User user
	//对应基因
	Gene gene
	//对应基因所影响的病例
	Illness illness
	//技术报告
	String oddRatio
	
    static constraints = {
		oddRatio nullable:true
    }
}

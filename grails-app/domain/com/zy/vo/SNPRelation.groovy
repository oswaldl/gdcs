package com.zy.vo
/**
 * 记录病例基因和人的对应关系，单位为基因（一个基因对应一条信息）
 * @author ACER
 *
 */

class SNPRelation {
	
	User user
	
	Gene gene
	
	Illness illness
	
    static constraints = {
    }
}

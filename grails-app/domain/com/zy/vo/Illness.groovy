package com.zy.vo
/**
 * 记录病例和相关的公有信息
 * @author ACER
 *
 */

class Illness {
	//英文病例名称
	String name
	//中文名
	String chineseName
	//病例介绍说明
	String description
	//你可以做什么
	String canDo
	//遗产和环境
	String geneticEnvironment
	//参考文献
	String reference
	//平均人群风险值
	String averageRisk
	
	double getRisk(){
		if(!this.averageRisk){
			this.averageRisk="0"
		}
		return Double.valueOf(this.averageRisk)
	}
	
	static belongsTo = [illnessCat: IllnessCat]

    static constraints = {
		name blank: false, unique: true
		chineseName nullable:true
		description nullable:true,maxSize: 3000
		canDo nullable:true,maxSize: 3000
		geneticEnvironment nullable:true,maxSize: 3000
		reference nullable:true,maxSize: 3000
		averageRisk nullable:true
    }
}

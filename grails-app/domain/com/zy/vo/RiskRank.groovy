package com.zy.vo
/**
 * 风险分级，里面只会存在一条记录
 * @author ACER
 *
 */
class RiskRank {
	//高于此数值为高风险
	Double high
	//低于此值为低风险
	Double low
	
	//处于高低之间的为正常状态
	
	//判断是不是高风险
	static boolean getHighRisk(Double num){
		def riskRank=RiskRank.findAll().get(0)
		boolean status=false
		if(num>=riskRank.high){
			status=true
		}
		return status
	}
	
	//是否为低风险
	static boolean getLowRisk(Double num){
		def riskRank=RiskRank.findAll().get(0)
		boolean status=false
		if(num<=riskRank.low){
			status=true
		}
		return status
	}
	
	//是否处于正常风险
	static boolean getNormalRisk(Double num){
		def riskRank=RiskRank.findAll().get(0)
		boolean status=false
		if(num>riskRank.low&&num<riskRank.high){
			status=true
		}
		return status
	}
	
    static constraints = {
    }
}

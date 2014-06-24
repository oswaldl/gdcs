package com.zy.vo
/**
 * 风险分级
 * @author ACER
 *
 */
class RiskRank {
	
	Double high
	
	Double low
	
	static String getRiskRank(Double num){
		def riskRank=RiskRank.findAll().get(0)
		String index
		if(num>=riskRank.high){
			index="high"
		}else if(num<riskRank.high&&num>riskRank.low){
			index="normal"
		}else{
			index="low"
		}
		return index
	}
	
    static constraints = {
    }
}

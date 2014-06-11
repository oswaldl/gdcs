package com.zy.vo


class CrawlRecord {
	//对应的用户名称
	String username
	//起始爬的页面
	String url1
	//主要数据的页面，病例基因关系详细页面
	String url2
	
    static constraints = {
    }
	
	static CrawlRecord create(String username,String url1,String url2){
		if(!CrawlRecord.findByUsernameAndUrl1AndUrl2(username, url1, url2)){
			new CrawlRecord(
				username:username,
				url1:url1,
				url2:url2
				).save(failOnError:true)
		}
	}
}

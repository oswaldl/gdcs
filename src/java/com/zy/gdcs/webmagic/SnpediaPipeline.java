package com.zy.gdcs.webmagic;


import com.zy.vo.CrawlRecord;

import us.codecraft.webmagic.ResultItems;
import us.codecraft.webmagic.Task;
import us.codecraft.webmagic.pipeline.Pipeline;

public class SnpediaPipeline implements Pipeline {



	@Override
	public void process(ResultItems resultItems, Task task) {
		if(resultItems.get("MedicalConditionsUrl")!=null){
			System.out.println("url1:"+resultItems.get("currentUrl"));
			System.out.println("url2:"+resultItems.get("MedicalConditionsUrl"));
			String url1=resultItems.get("currentUrl");
			String url2=resultItems.get("MedicalConditionsUrl");
			//好像这种方法还有点问题，虽然可以调用到方法中去，但是创建的时候还是会出错
			CrawlRecord.create("username", url1, url2);
		}else{
			//获取数据进行持久化处理
			System.out.println("获取数据进行持久化处理。。。");
		}
		
	}

}

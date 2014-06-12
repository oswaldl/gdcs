package com.zy.gdcs.webmagic;


import java.util.HashMap;
import java.util.Map;

import org.codehaus.groovy.runtime.InvokerHelper;


import com.zy.vo.CrawlRecord;

import us.codecraft.webmagic.ResultItems;
import us.codecraft.webmagic.Task;
import us.codecraft.webmagic.pipeline.Pipeline;

public class SnpediaPipeline implements Pipeline {



	@Override
	public void process(ResultItems resultItems, Task task){
		if(resultItems.get("MedicalConditionsUrl")!=null){
			System.out.println("url1:"+resultItems.get("currentUrl"));
			System.out.println("url2:"+resultItems.get("MedicalConditionsUrl"));
			String url1=resultItems.get("currentUrl");
			String url2=resultItems.get("MedicalConditionsUrl");
//			//好像这种方法还有点问题，虽然可以调用到方法中去，但是创建的时候还是会出错
//			CrawlRecord.create("username", url1, url2);
			
		    Map<String, String> map=new HashMap<String, String>();
		    map.put("url1", url1);
		    map.put("url2", url2);
		    map.put("username", "username");
		    InvokerHelper.invokeMethod("CrawlRecord","save",map);
		}else{
			//获取数据进行持久化处理
			System.out.println("获取数据进行持久化处理。。。");
		}
		
	}
	
	 public static void main(String[] args) {
		 Map<String, String> map=new HashMap<String, String>();
		 map.put("url1", "url1");
		 map.put("url2", "url2");
		 map.put("username", "username");
		 InvokerHelper.invokeMethod(CrawlRecord.class,"create",map);
	    }
	
}

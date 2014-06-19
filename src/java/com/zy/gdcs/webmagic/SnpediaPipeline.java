package com.zy.gdcs.webmagic;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;
import java.util.Map;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

import us.codecraft.webmagic.ResultItems;
import us.codecraft.webmagic.Task;
import us.codecraft.webmagic.pipeline.Pipeline;

import com.zy.vo.Gene;

public class SnpediaPipeline implements Pipeline {

	@Override
	public void process(ResultItems resultItems, Task task) {
		if (resultItems.get("MedicalConditionsUrl") != null) {
			System.out.println("url1:" + resultItems.get("currentUrl"));
			System.out.println("url2:"
					+ resultItems.get("MedicalConditionsUrl"));
			// String url1=resultItems.get("currentUrl");
			// String url2=resultItems.get("MedicalConditionsUrl");
			// //好像这种方法还有点问题，虽然可以调用到方法中去，但是创建的时候还是会出错
			// CrawlRecord.create("username", url1, url2);
			
			

		} else {
			// 获取数据进行持久化处理
			System.out.println("获取数据进行持久化处理。。。");
			// map中的数据，键值为病例名称，值为相关基因的集合
			Map<String, List<Gene>> map = resultItems.get("map");
			for (Map.Entry<String, List<Gene>> entry : map.entrySet()) {
//				System.out.println("key = " + entry.getKey() + " and value = "
//						+ entry.getValue());
			}
		}
		
		activeUrl("http://localhost:8080/gdcs/crawlRecord/createCrawlRecord?username=abc11&url1=1213&url2=3121");

	}

	private void activeUrl(String spec) {
		try {
			CloseableHttpClient httpclient = HttpClients.createDefault();
		    HttpGet httpget = new HttpGet(spec);
		    CloseableHttpResponse response = httpclient.execute(httpget);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {

		}
	}
	
}

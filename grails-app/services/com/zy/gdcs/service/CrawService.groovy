package com.zy.gdcs.service

import us.codecraft.webmagic.Page
import us.codecraft.webmagic.ResultItems
import us.codecraft.webmagic.Task
import us.codecraft.webmagic.selector.Selectable

import com.zy.vo.CrawlRecord
import com.zy.vo.Gene

class CrawService {

    def serviceMethod() {

    }

	public void process(Page page) {
		// 部分二：定义如何抽取页面信息，并保存下来
		String medicalConditionsUrl=page.getHtml().xpath("//div[9]/a/@href").toString();
		if(medicalConditionsUrl!=null&&!"".equals(medicalConditionsUrl)){
			page.putField("MedicalConditionsUrl", medicalConditionsUrl);
			page.putField("currentUrl", page.getUrl());
			if (page.getResultItems().get("MedicalConditionsUrl") == null) {
				//skip this page
				page.setSkip(true);
			}
			// 部分三：从页面发现后续的url地址来抓取
			page.addTargetRequests(page.getHtml().links().regex(page.getHtml().xpath("//div[9]/a/@href").toString()).all());
		}else{
			//获取所有符合条件class='adiseasebox'的div集合，病例集合
			List<Selectable> divs1 = page.getHtml().xpath("//div[@class='adiseasebox']").nodes();
			Map<String, List<Gene>> map=new HashMap<String, List<Gene>>();
			for (Selectable div1 : divs1) {
				
				String caseName=div1.xpath("//a[@class='diseaselink']/text()").toString();
				
				List<Gene> list=new ArrayList<Gene>();
				
				//进行有用的数据抓取
				//好的基因
				List<Selectable> divs2 = div1.xpath("//div[@class='boxgoodresult']").nodes();
				for (Selectable div2 : divs2) {
					String name=div2.xpath("//div[@class='boxlink']/a[1]/text()").toString()+div2.xpath("//div[@class='boxlink']/a[2]/text()").toString();
					String boxeffect=div2.xpath("//div[@class='boxeffect']/text()").toString();
					String rstext=div2.xpath("//div[@class='rstext']/text()").toString();
					Gene gene=new Gene();
					gene.setName(name);
					gene.setDescription1(boxeffect);
					gene.setDescription2(rstext);
					gene.setIsReputeGood(true);
					list.add(gene);
				}
				//一般基因
				List<Selectable> divs3 = div1.xpath("//div[@class='boxresult']").nodes();
				for (Selectable div3 : divs3) {
					String name=div3.xpath("//div[@class='boxlink']/a[1]/text()").toString()+div3.xpath("//div[@class='boxlink']/a[2]/text()").toString();
					String boxeffect=div3.xpath("//div[@class='boxeffect']/text()").toString();
					String rstext=div3.xpath("//div[@class='rstext']/text()").toString();
					Gene gene=new Gene();
					gene.setName(name);
					gene.setDescription1(boxeffect);
					gene.setDescription2(rstext);
					gene.setIsReputeGood(false);
					list.add(gene);
				}
				map.put(caseName, list);
			}
			page.putField("map", map);
		}
	}

	public void process(ResultItems resultItems, Task task) {
		if (resultItems.get("MedicalConditionsUrl") != null) {
			System.out.println("url1:" + resultItems.get("currentUrl"));
			System.out.println("url2:"
					+ resultItems.get("MedicalConditionsUrl"));
			// String url1=resultItems.get("currentUrl");
			// String url2=resultItems.get("MedicalConditionsUrl");
			// //好像这种方法还有点问题，虽然可以调用到方法中去，但是创建的时候还是会出错
			// CrawlRecord.create("username", url1, url2);
			CrawlRecord crawlRecord = new CrawlRecord();
			crawlRecord.setUsername(resultItems.get("MedicalConditionsUrl"));
			crawlRecord.setUrl1(resultItems.get("currentUrl").toString());
			crawlRecord.setUrl2(resultItems.get("MedicalConditionsUrl").toString());
			crawlRecord.save(failOnError:true);

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
		
		//activeUrl("http://localhost:8080/gdcs/crawlRecord/createCrawlRecord?username=abc11&url1=1213&url2=3121");
		
	}
}
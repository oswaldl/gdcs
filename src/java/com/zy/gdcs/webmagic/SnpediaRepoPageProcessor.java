package com.zy.gdcs.webmagic;


import java.util.List;

import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.Spider;
import us.codecraft.webmagic.processor.PageProcessor;
import us.codecraft.webmagic.selector.Selectable;

public class SnpediaRepoPageProcessor implements PageProcessor {
	// 部分一：抓取网站的相关配置，包括编码、抓取间隔、重试次数等
    private Site site = Site.me().setRetryTimes(3).setSleepTime(1000);

    @Override
    // process是定制爬虫逻辑的核心接口，在这里编写抽取逻辑
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
    		//获取所有符合条件class='adiseasebox'的div集合
    		List<Selectable> divs1 = page.getHtml().xpath("//div[@class='adiseasebox']").nodes();
//    		System.out.println(divs1.size());
    		for (Selectable div1 : divs1) {
    			List<Selectable> divs2 = div1.xpath("//div[@class='boxgoodresult']").nodes();
    			for (Selectable div2 : divs2) {
    				//进行有用的数据抓取
    				//div1为病例的大div
    				//div2为class='boxgoodresult'的小div（还有一些其他div中也有数据按需求再添加
    				
    			}
    		}
    	}
    	

        
    }

    @Override
    public Site getSite() {
        return site;
    }

    public static void main(String[] args) {

        Spider.create(new SnpediaRepoPageProcessor())
                //从"https://github.com/code4craft"开始抓
                .addUrl("http://files.snpedia.com/reports/genome_Mike_Spear_pooled.html")
                .addPipeline(new SnpediaPipeline())
                //开启5个线程抓取
                .thread(5)
                //启动爬虫
                .run();
    }

}

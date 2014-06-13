package com.zy.gdcs.webmagic;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.zy.vo.Gene;

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

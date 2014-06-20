package com.zy.gdcs.webmagic;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.Spider;
import us.codecraft.webmagic.processor.PageProcessor;
import us.codecraft.webmagic.selector.Selectable;

import com.zy.gdcs.service.CrawService;
import com.zy.vo.Gene;

public class SnpediaRepoPageProcessor implements PageProcessor {
	@Autowired
    private CrawService crawService;
	
	// 部分一：抓取网站的相关配置，包括编码、抓取间隔、重试次数等
    private Site site = Site.me().setRetryTimes(3).setSleepTime(1000);

    @Override
    // process是定制爬虫逻辑的核心接口，在这里编写抽取逻辑
    public void process(Page page) {
    	crawService.process(page);
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
package com.zy.gdcs.webmagic;

import java.util.List;

import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.model.ConsolePageModelPipeline;
import us.codecraft.webmagic.model.OOSpider;
import us.codecraft.webmagic.model.annotation.ExtractBy;
import us.codecraft.webmagic.model.annotation.ExtractByUrl;
import us.codecraft.webmagic.model.annotation.HelpUrl;
import us.codecraft.webmagic.model.annotation.TargetUrl;
import us.codecraft.webmagic.pipeline.JsonFilePageModelPipeline;

@TargetUrl("http://files.snpedia.com/reports/promethease_data/genome_Mike_Spear_pooled_is-a-medical-condition.html")
@HelpUrl("http://files.snpedia.com/reports/genome_Mike_Spear_pooled.html")

public class GithubRepo {

//    @ExtractBy(value = "//h1[@class='entry-title public']/strong/a/text()", notNull = true)
//    private String name;

//    @ExtractByUrl("https://github\\.com/(\\w+)/.*")
//    private String author;

    @ExtractBy("//div[@class=\"boxeffect\"]")
    private List<String> content;

    public static void main(String[] args) {
        OOSpider.create(Site.me().setSleepTime(1000)
                , new JsonFilePageModelPipeline("D:\\webmagic\\"), GithubRepo.class)
                .addUrl("http://files.snpedia.com/reports/genome_Mike_Spear_pooled.html").thread(5).run();
    }
}

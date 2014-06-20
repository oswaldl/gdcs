package com.zy.gdcs.webmagic;

import org.springframework.beans.factory.annotation.Autowired;

import us.codecraft.webmagic.ResultItems;
import us.codecraft.webmagic.Task;
import us.codecraft.webmagic.pipeline.Pipeline;


import com.zy.gdcs.service.CrawService;

public class SnpediaPipeline implements Pipeline {
	@Autowired
    private CrawService crawService;

	@Override
	public void process(ResultItems resultItems, Task task) {
		crawService.process(resultItems,task);
	}

	
}
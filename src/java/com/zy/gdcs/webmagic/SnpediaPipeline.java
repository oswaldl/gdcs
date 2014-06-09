package com.zy.gdcs.webmagic;

import java.util.HashMap;
import java.util.Map;

import us.codecraft.webmagic.ResultItems;
import us.codecraft.webmagic.Task;
import us.codecraft.webmagic.pipeline.Pipeline;

public class SnpediaPipeline implements Pipeline {

	private Map<String, Object> fields = new HashMap<String, Object>();
	@Override
	public void process(ResultItems resultItems, Task task) {
		fields = resultItems.getAll();
		System.out.println("fields");
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}

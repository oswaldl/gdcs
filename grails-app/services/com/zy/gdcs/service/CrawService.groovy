package com.zy.gdcs.service

import java.util.regex.Matcher
import java.util.regex.Pattern

import us.codecraft.webmagic.Page
import us.codecraft.webmagic.ResultItems
import us.codecraft.webmagic.Task
import us.codecraft.webmagic.selector.Selectable

import com.zy.auth.User
import com.zy.vo.CrawlRecord
import com.zy.vo.Gene
import com.zy.vo.Illness
import com.zy.vo.IllnessCat
import com.zy.vo.SNPRelation

class CrawService {

    def serviceMethod() {

    }

	public void process(Page page) {
		// 部分二：定义如何抽取页面信息，并保存下来
		String medicalConditionsUrl
		List<Selectable> adivs = page.getHtml().xpath("//div[@class='majorsection']").nodes();
		for (Selectable divv : adivs) {
			String content=divv.xpath("//a/text()").toString();
			if(content.contains("Medical Conditions")){
				medicalConditionsUrl=divv.xpath("//a/@href").toString();
			}
		}
		//获取正在爬取的用户
		String url=page.getUrl()
		int eindex=url.indexOf("/", 22)
		String username=url.substring(22, eindex)
		page.putField("username", username);
		if(medicalConditionsUrl!=null&&medicalConditionsUrl!=""){
			page.putField("MedicalConditionsUrl", medicalConditionsUrl.replace("\\", "/"));
			page.putField("currentUrl", page.getUrl());
			if (page.getResultItems().get("MedicalConditionsUrl") == null) {
				//skip this page
				page.setSkip(true);
			}
			// 部分三：从页面发现后续的url地址来抓取
//			page.addTargetRequests(page.getHtml().links().regex(medicalConditionsUrl).all());
			List <String> lst = new ArrayList();
			lst.add(medicalConditionsUrl.replace("\\", "/"))
			page.addTargetRequests(lst);
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
					String magnitudeDiv=div2.xpath("//div[@class='boxmag']/tidyText()").toString();
					int index1=magnitudeDiv.indexOf("Magnitude: ")
					String magnitude=null
					if(index1!=-1){
						int index2=magnitudeDiv.indexOf("\n")
						if(index2==-1){
							magnitude=magnitudeDiv.substring(index1+11)
						}else{
							magnitude=magnitudeDiv.substring(index1+11,index2)
						}
					}
					Gene gene=new Gene();
					gene.setName(name);
					gene.setDescription1(boxeffect);
					gene.setDescription2(rstext);
					gene.setRepute("good");
					gene.setMagnitude(magnitude);
					list.add(gene);
				}
				//坏基因
				List<Selectable> divs4 = div1.xpath("//div[@class='boxbadresult']").nodes();
				for (Selectable div4 : divs4) {
					String name=div4.xpath("//div[@class='boxlink']/a[1]/text()").toString()+div4.xpath("//div[@class='boxlink']/a[2]/text()").toString();
					String boxeffect=div4.xpath("//div[@class='boxeffect']/text()").toString();
					String rstext=div4.xpath("//div[@class='rstext']/text()").toString();
					String magnitudeDiv=div4.xpath("//div[@class='boxmag']/tidyText()").toString();
					int index1=magnitudeDiv.indexOf("Magnitude: ")
					String magnitude=null
					if(index1!=-1){
						int index2=magnitudeDiv.indexOf("\n")
						if(index2==-1){
							magnitude=magnitudeDiv.substring(index1+11)
						}else{
							magnitude=magnitudeDiv.substring(index1+11,index2)
						}
					}
					Gene gene=new Gene();
					gene.setName(name);
					gene.setDescription1(boxeffect);
					gene.setDescription2(rstext);
					gene.setRepute("bad");
					gene.setMagnitude(magnitude);
					list.add(gene);
				}
				//一般基因
				List<Selectable> divs3 = div1.xpath("//div[@class='boxresult']").nodes();
				for (Selectable div3 : divs3) {
					String name=div3.xpath("//div[@class='boxlink']/a[1]/text()").toString()+div3.xpath("//div[@class='boxlink']/a[2]/text()").toString();
					String boxeffect=div3.xpath("//div[@class='boxeffect']/text()").toString();
					String rstext=div3.xpath("//div[@class='rstext']/text()").toString();
					String magnitudeDiv=div3.xpath("//div[@class='boxmag']/tidyText()").toString();
					int index1=magnitudeDiv.indexOf("Magnitude: ")
					String magnitude=null
					if(index1!=-1){
						int index2=magnitudeDiv.indexOf("\n")
						if(index2==-1){
							magnitude=magnitudeDiv.substring(index1+11)
						}else{
							magnitude=magnitudeDiv.substring(index1+11,index2)
						}
					}
					Gene gene=new Gene();
					gene.setName(name);
					gene.setDescription1(boxeffect);
					gene.setDescription2(rstext);
					gene.setRepute("normal");
					gene.setMagnitude(magnitude);
					list.add(gene);
				}
				map.put(caseName, list);
			}
			page.putField("map", map);
		}
	}

	public void process(ResultItems resultItems, Task task) {
		String username=resultItems.get("username")
		User user=User.findByUsername(username)?:new User(username: username,password: username,isAdmin: false,enabled: true).save(failOnError: true)
		def illnessCat=IllnessCat.findByName("默认分类")
		if (resultItems.get("MedicalConditionsUrl") != null) {
			System.out.println("url1:" + resultItems.get("currentUrl"));
			System.out.println("url2:" + resultItems.get("MedicalConditionsUrl"));
			CrawlRecord crawlRecord = new CrawlRecord();
			crawlRecord.setUsername(user.username);
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
				def illnessName=entry.getKey()
				def illness=Illness.findByName(illnessName) ?: new Illness(name:illnessName,illnessCat:illnessCat).save(failOnError:true)
				println illness.name
				for(Gene gene:entry.getValue()){
					Gene gene0=Gene.findByName(gene.name)
					if(!gene0){
						gene.save(failOnError:true)
						gene0=gene
					}
					String oddRatio
					if(gene0.description1){
						oddRatio=getOddRatio(gene0.description1.toLowerCase(),illnessName.toLowerCase())
					}
					
					new SNPRelation(
						user:user,
						gene:gene0,
						illness:illness,
						oddRatio:oddRatio
						).save(failOnError:true)
				}
			}
		}
		
	}


	def getOddRatio(String str,String illnessName){
		String cur_sentense=""
		String oddRatio
		str.eachWithIndex {c,i->
			//发现点，开始处理
			if(".".equals(c)){
				
				if(i==0){//特殊情况，第一个字符就是.
					
				}else{
					String pre=str[i-1]
					try{
						Integer.parseInt(pre+"")
						//如果之前是数值，可能是float类型数值，也可能是句子结尾
						if(str.length()==i){//特殊情况，已经是结尾了
							if(cur_sentense.contains(illnessName)){
								if(!oddRatio){
									oddRatio=println2(cur_sentense)
								}
							}
							cur_sentense=""
						}else{
							String aft=str[i+1]
							try{
								Integer.parseInt(aft)
								//float类型数值
								cur_sentense=cur_sentense+c;
							}catch(e){
								//句子结尾
								if(cur_sentense.contains(illnessName)){
									if(!oddRatio){
										oddRatio=println2(cur_sentense)
									}
								}
								cur_sentense=""
							}
						}
					}catch(e){
						//是一句话结尾
						if(cur_sentense.contains(illnessName)){
							if(!oddRatio){
								oddRatio=println2(cur_sentense)
							}
						}
						cur_sentense=""
					}
				}
				
			}else{//累加
				cur_sentense=cur_sentense+c;
			}
		}
		return oddRatio
	}
	
	def println2(String str) {
        String re = "([-\\+]?[0-9]([0-9]*)(\\.[0-9]+)?)|(^0\$)";
  
        Pattern p = Pattern.compile(re);
        Matcher m = p.matcher(str);
		String string=null
		while(m.find()){
			string=m.group(1);
		}
		if(string&&Double.valueOf(string)>10){
			string=null
		}
		return string
   }

}

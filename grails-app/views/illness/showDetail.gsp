<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>基因检测报告</title>
<link rel="stylesheet" type="text/css" media="all" href="${resource(dir: 'css', file: 'css.css')}"/>
<style type="text/css">
body {
	font-family: SimSun;
}


@media print {   
	body{
		page-break-after:always;
		background-color: lightblue;
	}
	.div_hidden{
		display:none;
	}
} 
</style>
</head>
<body>
	<div class="header">
	<div class="lefts"><g:img dir="images" file="logo2.jpg" width="457" height="134"/></div>
	<div class="rights">
    	<p><span>${username }</span><g:link controller="logout">[注销]</g:link></p>
        <p>欢迎进入基因检测报告！</p>
    </div>
</div>
<div class="main2 A1"><!--在这里改A1\A2\A3\A3分别对应健康普、生命普、药物普、个性普-->
  <div class="tit3">
  		<p class="s1">${illnessInstance?.name }</p>
        <p class="s2">${illnessInstance?.chineseName }</p>
  </div>
   <div class="contBox1">
   		<div class="lefts">
        	<dl>
            	<dd class="img${(int)Math.ceil(risk*100/20) }"></dd><!--命名分别为img0、img1、img2、img3、img4、img5-->
                <dt>风险等级</dt>
            </dl>
        </div>
        <div class="rights">
        	<div class="page1">
			<div class="wenzi">
            	<p class="s_1">good基因数目</p>
            	<p class="s_2">bad基因数目</p>
            </div>
            <div class="tiaozhuang">
            	<div class="red" style="width:${badNum*100/snps.size() }%;">${badNum }</div>
            	<div class="green" style="width:${goodNum*100/snps.size() }%;">${goodNum }</div>
            </div>
        	</div>
<%--        	<div class="jdBxo1">--%>
<%--            	<div class="tit">您的<br/>基因</div>--%>
<%--                <div class="bfb"><div class="bx" style="width:${risk*100 }%;"><div class="num1">${risk*100 }%</div></div></div><!--这里由百分比控制宽度-->--%>
<%--               --%>
<%--            </div>--%>
<%--        	<div class="jdBxo2">--%>
<%--            	<div class="tit">平均<br/>风险</div>--%>
<%--                <div class="bfb"><div class="bx" style=" width:${Double.valueOf(illnessInstance?.averageRisk)*100 }%;"><div class="num1">${Double.valueOf(illnessInstance?.averageRisk)*100 }%</div></div></div><!--这里由百分比控制宽度-->--%>
<%--            </div>--%>
        </div>
   </div> 
    <div class="contBox2">
   	  <div class="title">
        	疾病介绍
      </div>
    	<div class="cont">
    		${illnessInstance?.description }
<%--        	<dl>--%>
<%--            	<dd><img src="../images/img2.jpg" width="190" height="139" /></dd>--%>
<%--                <dt>${illnessInstance?.description }</dt>--%>
<%--	           </dl>--%>
	        </div>
	    </div>
	    <div class="contBox2">
	   	  <div class="title"> 遗传vs环境 </div>
	    	<div class="cont jieshao">
		      <dl>
		        <dd><img src="../images/img3.jpg" width="190" height="139" /></dd>
		        <dt>
					${illnessInstance?.geneticEnvironment }
				</dt>
		      </dl>

	        </div>
	    </div>
	    <div class="contBox2 only1">
		    <h3 style="font-weight:normal;">你可以做什么？</h3>
		    <div class="cont jieshao2">
		      <p>
			  	${illnessInstance?.canDo }
			  <p>
		      <h6>了解症状，如果您担心的话，和你的医生谈谈。</h6>
		      狼疮是一种复杂的疾病，常常被误认为是其他疾病，如类风湿关节炎，血液系统疾病，纤维肌痛，糖尿病，甲状腺问题，和莱姆病。
		      </p>
		      <p>
		      <h6>了解你的家族病史</h6>
		      虽然关于狼疮是怎么引起的人们所知不多，但美国狼疮基金会指出，这种疾病会在家族中延续。家族病史中有其他自身免疫性疾病，如类风湿关节炎或牛皮癣，也可能是引起狼疮的风险因素。美国总医师研究的&quot;我家族的健康肖像&quot;工具可以帮你收集你的家族病史。
		      </p>
		      <p>
		      <h6>咨询遗传咨询师</h6>
		      遗传咨询师专门帮助人们了解遗传性疾病和遗传测试结果。点击这里了解更多关于基因咨询事宜。
		      </p>
		    </div>
	   	  
	  </div>
	    <div class="contBox2">
	   	  <div class="title"> 技术报告 </div>
	    	<div class="cont baokao">
	        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr style="color:#000;">
	    <th height="36" align="center" valign="middle" class="backgrounds">SPN</th>
	    <th height="36" align="center" valign="middle" class="backgrounds">Magnitude</th>
	    <th height="36" align="center" valign="middle" class="backgrounds">References</th>
	    <th height="36" align="center" valign="middle" class="backgrounds">Frequency</th>
	    <th height="36" align="center" valign="middle" class="backgrounds">Repute</th>
	  </tr>
	  <g:each in="${genes }" var="gene" status="i">
	  <tr>
	    <td height="36" align="center" valign="middle" bgcolor="${(i % 2) == 0 ? '#e9e9ea' : ''}">
			${gene.description1!=null?'<a href="'+createLink(controller:"gene",action:"show")+'?id='+gene.id+'&username='+username+'&illnessId='+illnessInstance.id+'&status='+status+'">':'' }
	    	${gene.name }
	    	${gene.description1!=null?'</a>':'' }
	    </td>
	    <td height="36" align="center" valign="middle" bgcolor="${(i % 2) == 0 ? '#e9e9ea' : ''}">${gene.magnitude }</td>
	    <td height="36" align="center" valign="middle" bgcolor="${(i % 2) == 0 ? '#e9e9ea' : ''}">${gene.references }<br /></td>
	    <td height="36" align="center" valign="middle" bgcolor="${(i % 2) == 0 ? '#e9e9ea' : ''}">${gene.frequency }</td>
	    <td height="36" align="center" valign="middle" bgcolor="${(i % 2) == 0 ? '#e9e9ea' : ''}">${gene.repute }</td>
	  </tr>
	  </g:each>
	</table>
	
	      </div>
	    </div>
	    <div class="pageContent">
	    <div class="page2">
	    	<g:if test="${total!=1&&status==0 }">
	  		<div class="pageBox2"><g:link class="s2" action="showDetailByStatus" params='[username:"${username }",status:"${status+1 }"]'>下一个</g:link></div>
		  	</g:if>
		  	<g:if test="${total!=1&&status!=0&&status!=(total-1) }">
		  		<div class="pageBox2"><g:link class="s2" action="showDetailByStatus" params='[username:"${username }",status:"${status+1 }"]'>下一个</g:link></div>
		  		<div class="pageBox1"><g:link class="s2" action="showDetailByStatus" params='[username:"${username }",status:"${status-1 }"]'>上一个</g:link></div>
		  	</g:if>
		  	<g:if test="${total!=1&&status==(total-1) }">
		  		<div class="pageBox1"><g:link class="s2" action="showDetailByStatus" params='[username:"${username }",status:"${status-1 }"]'>上一个</g:link></div>
		  	</g:if>
				<div class="pageBox">
					<g:link class="s1" controller="showResult" action="index"
						params='[username:"${username }"]'>返回列表</g:link>
				</div>
			</div>
	    </div>
	</div>
</body>
</html>
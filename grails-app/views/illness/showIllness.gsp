<!-- 为了打印而存在 -->
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>基因检测报告</title>
<link rel="stylesheet" type="text/css" media="screen" 
	href="${resource(dir: 'css', file: 'css.css')}" />
<link rel="stylesheet" type="text/css" media="print" 
	href="${resource(dir: 'css', file: 'print.css')}" />
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
	    	<!--0821改开始-->
	    	<ul class="fx">
	        	<li class="s1">
	            	<h5><strong>Good SNPs</strong><br />风险降低</h5>
	                <div class="boxN"><div class="boxR" style=" width:${badNum*100/snps.size() }%;"><p>${badNum }</p></div></div>
	            </li>
	            <li>
	            	<h5><strong>Bad SNPs</strong><br />风险升高</h5>
	                <div class="boxN"><div class="boxR" style="width:${goodNum*100/snps.size() }%;"><p>${goodNum }</p></div></div>
	            </li>
	        </ul>
	    	<!--0821改结束-->
        </div>
   </div> 
    <div class="contBox2">
   	  <div class="title">
        	疾病介绍
      </div>
    	<div class="cont">
    		${illnessInstance?.description }
	        </div>
	    </div>
	    <div class="contBox2">
	   	  <div class="title"> 遗传vs环境 </div>
	    	<div class="cont jieshao">
		      <dl>
		        <dd><g:img dir="images" file="img3.jpg" width="190" height="139" /></dd>
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
	    	${gene.name }
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
	</div>
</body>
</html>
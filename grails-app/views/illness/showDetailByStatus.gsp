<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>基因检测报告</title>
<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'css.css')}" />
</head>
<body>
	<div class="header">
	<div class="lefts"><g:img dir="images" file="logo2.jpg" width="457" height="134"/></div>
	<div class="rights">
    	<p><span>${username }</span><g:link controller="logout">[注销]</g:link></p>
        <p>欢迎进入基因检测报告！</p>
    </div>
</div>
<div class="main2">
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
   	  <div class="tit4">
        	疾病介绍
      </div>
    	<div class="cont jieshao">
    		${illnessInstance?.description }
<%--        	<dl>--%>
<%--            	<dd><img src="../images/img2.jpg" width="190" height="139" /></dd>--%>
<%--                <dt>${illnessInstance?.description }</dt>--%>
<%--	           </dl>--%>
	        </div>
	    </div>
	    <div class="contBox2">
	   	  <div class="tit4">
	       	遗传vs环境
	  </div>
	    	<div class="cont jieshao">
	    		${illnessInstance?.geneticEnvironment }
<%--	        	<dl>--%>
<%--	            	<dd><img src="../images/img3.jpg" width="190" height="139" /></dd>--%>
<%--	                <dt>${illnessInstance?.geneticEnvironment }</dt>--%>
<%--	            </dl>--%>
	        </div>
	    </div>
	    <div class="contBox2">
	   	  <div class="tit4">你可以做什么？</div>
	        <div class="cont">
	        	<div class="content">
		          ${illnessInstance?.canDo }
	       		</div>
	        </div>
	  </div>
	    <div class="contBox2">
	   	  <div class="tit4">
	       技术报告
	  </div>
	    	<div class="cont baokao">
	        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr style="color:#fff;">
	    <th height="36" align="center" valign="middle" bgcolor="#ff8470">SPN</th>
	    <th height="36" align="center" valign="middle" bgcolor="#ff8470">Magnitude</th>
	    <th height="36" align="center" valign="middle" bgcolor="#ff8470">References</th>
	    <th height="36" align="center" valign="middle" bgcolor="#ff8470">Frequency</th>
	    <th height="36" align="center" valign="middle" bgcolor="#ff8470">Repute</th>
	  </tr>
	  <g:each in="${genes }" var="gene">
	  <tr>
	    <td height="36" align="center" valign="middle">${gene.name }<br /></td>
	    <td height="36" align="center" valign="middle">${gene.magnitude }</td>
	    <td height="36" align="center" valign="middle">${gene.references }<br /></td>
	    <td height="36" align="center" valign="middle">${gene.frequency }</td>
	    <td height="36" align="center" valign="middle">${gene.repute }</td>
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
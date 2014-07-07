<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>基因检测报告</title>
<link rel="stylesheet" type="text/css" media="all" href="${resource(dir: 'css', file: 'css.css')}" />
</head>
<body>
	<div class="header">
	<div class="lefts"><g:img dir="images" file="logo2.jpg" width="457" height="134"/></div>
	<div class="rights">
    	<p><span>${username }</span><g:link controller="logout">[注销]</g:link></p>
        <p>欢迎进入基因检测报告！</p>
        <p>
        	<g:form url="[action:'searchData',controller:'showResult']" >
        		<input type="hidden" name="username" value="${username }"/>
				<input name="searchString" id="search" placeholder="请输入病例名"/>
			</g:form>
        </p>
    </div>
	</div>
	<div class="main">
		<div class="titles">
	    	目录
	    </div>
	    <div class="lists">
	    	<div class="listBox">
	       		<h5 class="tit1 jt01">第一部分<span>疾病风险评估</span></h5>
	            <ul style="display:block;">
	            <li>
	  			<g:link controller="illness" action="showHighAll" params='[username:"${username }"]'>较高风险疾病汇总</g:link>
		  		</li>
		  		<li>
		  			<g:link controller="illness" action="showLowAll" params='[username:"${username }"]'>较低风险疾病汇总</g:link>
		  		</li>
		  		<li>
		  			<g:link controller="illness" action="showNormalAll" params='[username:"${username }"]'>一般风险疾病汇总</g:link>
		  		</li>
	            <g:each in="${illnesses }" var="illness" status="i">
	  			<li>
	  				<g:link controller="illness" action="showDetail" params='[illnessId:"${illness.id }",status:"${i }",username:"${username }"]'> ${illness.chineseName?:illness.name }</g:link>
	  			</li>
	  			</g:each>
	            </ul>
	        </div>
	        <div class="listBox">
	   		  <h5 class="tit1 jt02">第二部分<span>先天性遗传疾病</span></h5>
	          <ul>
	            <li><a href="#">较高风险疾病汇总</a></li>
	            <li><a href="#">较低风险疾病汇总</a></li>
	            <li><a href="#">一般风险疾病汇总</a></li>
	            <li><a href="#">年龄相关性黄斑变性</a></li>
	            <li><a href="#">心房颤动</a></li>
	            </ul>
	        </div>
	        <div class="listBox">
	   		  <h5 class="tit1 jt02">第三部分<span>个体化用药指导</span></h5>
	          <ul>
	            <li><a href="#">较高风险疾病汇总</a></li>
	            <li><a href="#">较低风险疾病汇总</a></li>
	            <li><a href="#">一般风险疾病汇总</a></li>
	            <li><a href="#">年龄相关性黄斑变性</a></li>
	            <li><a href="#">心房颤动</a></li>
	            </ul>
	        </div>
	    </div>
	</div>
</body>
</html>
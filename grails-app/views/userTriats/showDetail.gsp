<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>基因检测报告</title>
<link rel="stylesheet" type="text/css" media="screen" 
	href="${resource(dir: 'css', file: 'css.css')}" />
<link rel="stylesheet" type="text/css" media="print" 
	href="${resource(dir: 'css', file: 'print.css')}" />
</head>
<body>

	<div class="header">
		<div class="lefts">
			<g:img dir="images" file="logo2.jpg" width="457" height="134" />
		</div>
		<div class="rights">
			<p>
				<span>
					${username }
				</span>
				<g:link controller="logout">[注销]</g:link>
			</p>
			<p>欢迎进入基因检测报告！</p>
		</div>
	</div>
	<div class="main2 A3">
		<div class="tit3">
			<p class="s1">
				${userTriatsInstance?.triats.name }
			</p>
			<p class="s2">
				${userTriatsInstance?.triats.chineseName }
			</p>
		</div>
		<g:if test="${userTriatsInstance.triats.introduction!=null&&userTriatsInstance.triats.introduction!='' }">
			<div class="contBox2">
				<div class="tit4">前言</div>
				<div class="cont jieshao">
					${userTriatsInstance.triats.introduction }
				</div>
			</div>
		</g:if>
		<g:if test="${userTriatsInstance.triats.result!=null&&userTriatsInstance.triats.result!='' }">
			<div class="contBox2">
				<div class="tit4">结果</div>
				<div class="cont jieshao">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					  <tr>
					    <th height="36" align="center" valign="middle" class="backgrounds">SPN</th>
					    <th height="36" align="center" valign="middle" class="backgrounds">Genotype</th>
					    <th height="36" align="center" valign="middle" class="backgrounds">Result</th>
					  </tr>
					  <tr>
					    <td height="36" align="center" valign="middle" bgcolor="#e9e9ea">${userTriatsInstance?.triats?.result.substring(0, userTriatsInstance.triats.result.indexOf('(')) }</td>
					    <td height="36" align="center" valign="middle" bgcolor="#e9e9ea">${userTriatsInstance.getResult().split(':')[0] }</td>
					    <td height="36" align="center" valign="middle" bgcolor="#e9e9ea">${userTriatsInstance.getResult().split(':')[1] }</td>
					  </tr>
					</table>
				</div>
			</div>
		</g:if>
		<g:if test="${userTriatsInstance.triats.genetics!=null&&userTriatsInstance.triats.genetics!='' }">
		<div class="contBox2">
			<div class="tit4">遗传和环境因素</div>
			<div class="cont">
				<div class="content">
					<div class="cont jieshao">
					${userTriatsInstance.triats.genetics}
			       	</div>
				</div>
			</div>
		</div>
		</g:if>
		
		<g:if test="${userTriatsInstance.triats.biology!=null&&userTriatsInstance.triats.biology!='' }">
		<div class="contBox2">
			<div class="title">生物学作用</div>
			<div class="cont jieshao">
				${userTriatsInstance.triats.biology }
			</div>
		</div>
		</g:if>
		<g:if test="${userTriatsInstance.triats.findings!=null&&userTriatsInstance.triats.findings!='' }">
		<div class="contBox2">
			<div class="title">主要发现</div>
			<div class="cont">
				<div class="content">
					${userTriatsInstance.triats.findings}
				</div>
			</div>
		</div>
		</g:if>
		
		<g:if test="${userTriatsInstance.triats.geneAbstract!=null&&userTriatsInstance.triats.geneAbstract.size()!=0 }">
		<g:each in="${userTriatsInstance.triats.geneAbstract }" var="geneAbstract">
		<div class="contBox2">
			<div class="tit4">基因/SNP摘要</div>
			<div class="cont">
				<div class="content">
					<div class="cont jieshao">
			       	  <h5 class="tit">${geneAbstract.name }</h5>
			          <table width="100%" border="0" cellspacing="0" cellpadding="0">
						  <tr>
						    <td width="15%" height="40" bgcolor="#f4f4f4" class="paddingLR">杂志</td>
						    <td width="85%" bgcolor="#f4f4f4" class="paddingLR">${geneAbstract.journal }</td>
						  </tr>
						  <tr>
						    <td height="40" class="paddingLR">研究规模</td>
						    <td class="paddingLR">
						    	<g:each in="${(1..geneAbstract.studySize) }">
								<g:img dir="images" file="ico1.gif"/>
								</g:each>
						    </td>
						  </tr>
						  <tr>
						    <td height="40" bgcolor="#f4f4f4" class="paddingLR">标记</td>
						    <td bgcolor="#f4f4f4" class="paddingLR">${geneAbstract.marker }</td>
						  </tr>
						</table>
						<p class="wzCont" style="padding-bottom:20px;">${geneAbstract.description }</p>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					  <tr style="color:#fff;">
					    <th height="36" align="center" valign="middle" bgcolor="#ff8470">Who</th>
					    <th height="36" align="center" valign="middle" bgcolor="#ff8470">基因型</th>
					    <th height="36" align="center" valign="middle" bgcolor="#ff8470">意义</th>
					  </tr>
					  <g:each in="${map2.get(geneAbstract.name) }" var="key">
					   <g:if test="${key==map3.get(geneAbstract.name) }">
					   <tr>
					    <td height="36" align="center" valign="middle">${username }</td>
					    <td height="36" align="center" valign="middle">${key }</td>
					    <td height="36" align="center" valign="middle">${map1.get(geneAbstract.name).get(key) }</td>
					   </tr>
					   </g:if>
					  </g:each>
					  </table>
					  <p class="wzCont" style="padding-bottom:20px;">${geneAbstract.reference }</p>
			      </div>
				</div>
			</div>
		</div>
		</g:each>
		</g:if>
		
		<div class="pageContent pdf_div_hidden">
			<div class="page2">
				<g:if test="${total!=1&&status==0 }">
					<div class="pageBox2">
						<g:link class="s2" action="showDetailByStatus"
							params='[username:"${username }",status:"${status+1 }"]'>下一个</g:link>
					</div>
				</g:if>
				<g:if test="${total!=1&&status!=0&&status!=(total-1) }">
					<div class="pageBox2">
						<g:link class="s2" action="showDetailByStatus"
							params='[username:"${username }",status:"${status+1 }"]'>下一个</g:link>
					</div>
					<div class="pageBox1">
						<g:link class="s2" action="showDetailByStatus"
							params='[username:"${username }",status:"${status-1 }"]'>上一个</g:link>
					</div>
				</g:if>
				<g:if test="${total!=1&&status==(total-1) }">
					<div class="pageBox1">
						<g:link class="s2" action="showDetailByStatus"
							params='[username:"${username }",status:"${status-1 }"]'>上一个</g:link>
					</div>
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
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
	<div class="main2 A1">
		<div class="tit3">
			<p class="s1">
				${userDrugRelationInstance?.drugResponse.name }
			</p>
			<p class="s2">
				${userDrugRelationInstance?.drugResponse.chineseName }
			</p>
		</div>
		<g:if test="${userDrugRelationInstance.drugResponse.introduction!=null&&userDrugRelationInstance.drugResponse.introduction!='' }">
			<div class="contBox2">
				<div class="tit4">引言</div>
				<div class="cont jieshao">
					${userDrugRelationInstance.drugResponse.introduction }
				</div>
			</div>
		</g:if>
		<g:if test="${userDrugRelationInstance.drugResponse.geneAbstract!=null&&userDrugRelationInstance.drugResponse.geneAbstract!='' }">
		<div class="contBox2">
			<div class="tit4">基因/SNP摘要</div>
			<div class="cont">
				<div class="content">
					<div class="cont jieshao">
			       	  <h5 class="tit">${userDrugRelationInstance?.drugResponse.geneAbstract.name }</h5>
			          <table width="100%" border="0" cellspacing="0" cellpadding="0">
						  <tr>
						    <td width="15%" height="40" bgcolor="#f4f4f4" class="paddingLR">杂志</td>
						    <td width="85%" bgcolor="#f4f4f4" class="paddingLR">${userDrugRelationInstance?.drugResponse.geneAbstract.journal }</td>
						  </tr>
						  <tr>
						    <td height="40" class="paddingLR">研究规模</td>
						    <td class="paddingLR">
						    	<g:each in="${(1..userDrugRelationInstance?.drugResponse.geneAbstract.studySize ) }">
								<g:img dir="images" file="ico1.gif"/>
								</g:each>
						    </td>
						  </tr>
						  <tr>
						    <td height="40" bgcolor="#f4f4f4" class="paddingLR">标记</td>
						    <td bgcolor="#f4f4f4" class="paddingLR">${userDrugRelationInstance?.drugResponse.geneAbstract.marker }</td>
						  </tr>
						</table>
						<p class="wzCont" style="padding-bottom:20px;">${userDrugRelationInstance?.drugResponse.geneAbstract.description }</p>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					  <tr style="color:#fff;">
					    <th height="36" align="center" valign="middle" bgcolor="#ff8470">Who</th>
					    <th height="36" align="center" valign="middle" bgcolor="#ff8470">基因型</th>
					    <th height="36" align="center" valign="middle" bgcolor="#ff8470">意义</th>
					  </tr>
					  <g:each in="${lists }" var="key">
					   <g:if test="${key==type }">
					   <tr>
					    <td height="36" align="center" valign="middle">${username }</td>
					    <td height="36" align="center" valign="middle">${key }</td>
					    <td height="36" align="center" valign="middle">${maps.get(key) }</td>
					   </tr>
					   </g:if>
					  </g:each>
					  </table>
			      </div>
				</div>
			</div>
		</div>
		</g:if>
		
		<g:if test="${userDrugRelationInstance.geneData!=null&&userDrugRelationInstance.geneData!='' }">
		<div class="contBox2">
			<div class="title">你的基因组数据</div>
			<div class="cont jieshao">
				${userDrugRelationInstance.geneData }
			</div>
		</div>
		</g:if>
		<g:if test="${userDrugRelationInstance.oddRatio!=null&&userDrugRelationInstance.oddRatio!='' }">
		<div class="contBox2">
			<div class="title">技术报告</div>
			<div class="cont">
				<div class="content">
					${userDrugRelationInstance?.oddRatio }
				</div>
			</div>
		</div>
		</g:if>
		<g:if test="${userDrugRelationInstance.drugResponse.genetics!=null&&userDrugRelationInstance.drugResponse.genetics!='' }">
		<div class="contBox2">
			<div class="title">${userDrugRelationInstance.drugResponse.chineseName?:userDrugRelationInstance.drugResponse.name }的遗传学研究</div>
			<div class="cont">
				<div class="content">
					${userDrugRelationInstance.drugResponse.genetics }
				</div>
			</div>
		</div>
		</g:if>
		<g:if test="${userDrugRelationInstance.drugResponse.reference!=null&&userDrugRelationInstance.drugResponse.reference!='' }">
		<div class="contBox2">
			<div class="title">参考文献</div>
			<div class="cont">
				<div class="content">
					${userDrugRelationInstance.drugResponse.reference }
				</div>
			</div>
		</div>
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
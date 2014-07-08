<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>基因检测报告</title>
<link rel="stylesheet" type="text/css"
	href="${resource(dir: 'css', file: 'css.css')}" />
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
	<div class="main2">
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
		<g:if test="${userDrugRelationInstance.geneAbstract!=null&&userDrugRelationInstance.geneAbstract!='' }">
		<div class="contBox2">
			<div class="tit4">基因/SNP摘要</div>
			<div class="cont">
				<div class="content">
					${userDrugRelationInstance?.geneAbstract }
				</div>
			</div>
		</div>
		</g:if>
		
		<g:if test="${userDrugRelationInstance.geneData!=null&&userDrugRelationInstance.geneData!='' }">
		<div class="contBox2">
			<div class="tit4">你的基因组数据</div>
			<div class="cont jieshao">
				${userDrugRelationInstance.geneData }
			</div>
		</div>
		</g:if>
		<g:if test="${userDrugRelationInstance.oddRatio!=null&&userDrugRelationInstance.oddRatio!='' }">
		<div class="contBox2">
			<div class="tit4">技术报告</div>
			<div class="cont">
				<div class="content">
					${userDrugRelationInstance?.oddRatio }
				</div>
			</div>
		</div>
		</g:if>
		<g:if test="${userDrugRelationInstance.drugResponse.genetics!=null&&userDrugRelationInstance.drugResponse.genetics!='' }">
		<div class="contBox2">
			<div class="tit4">${userDrugRelationInstance.drugResponse.chineseName?:userDrugRelationInstance.drugResponse.name }的遗传学研究</div>
			<div class="cont">
				<div class="content">
					${userDrugRelationInstance.drugResponse.genetics }
				</div>
			</div>
		</div>
		</g:if>
		<g:if test="${userDrugRelationInstance.drugResponse.reference!=null&&userDrugRelationInstance.drugResponse.reference!='' }">
		<div class="contBox2">
			<div class="tit4">参考文献</div>
			<div class="cont">
				<div class="content">
					${userDrugRelationInstance.drugResponse.reference }
				</div>
			</div>
		</div>
		</g:if>
		
		<div class="pageContent">
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
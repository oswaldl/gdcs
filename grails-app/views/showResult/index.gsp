<%@page import="com.zy.vo.UserDrugRelation"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>基因检测报告</title>
<link rel="stylesheet" type="text/css" media="all"
	href="${resource(dir: 'css', file: 'css.css')}" />
<r:external uri="/js/jquery-1.4.2.min.js" />
<style type="text/css">
body {
	font-family: SimSun;
}
</style>
<script type="text/javascript">
$(function(){
	$(".listBox li").hover(function(){
		$(this).addClass("cur")
	},function(){
		$(".listBox li").removeClass("cur")
	})
})

	$(document).ready(
			function() {
				$('.lists .listBox').each(
						function(i) {
							$('.lists .listBox:eq(' + i + ')').click(
									function() {
										$('.lists .listBox:eq(' + i + ')')
												.children('ul').show();
										$('.lists .listBox:eq(' + i + ')')
												.children('h5').show()
												.removeClass('jt02').addClass(
														'jt01');
										$('.lists .listBox:eq(' + i + ')')
												.siblings().children().hide();
										$('.lists .listBox:eq(' + i + ')')
												.siblings().children('h5')
												.show().removeClass('jt01')
												.addClass('jt02');
									});
						});
			});
</script>
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
				<g:if test="${currenUser.isAdmin }">
					<g:link controller="console" action="index">[进入后台]</g:link>
				</g:if>
			</p>
			<p>欢迎进入基因检测报告！</p>
			<p>
				<g:form url="[action:'searchData',controller:'showResult']">
					<input type="hidden" name="username" value="${username }" />
					<input name="searchString" id="search" placeholder="请输入病例名" />
				</g:form>
			</p>
		</div>
	</div>
	<div class="main">
		<div class="titles">目录</div>
		<div class="lists">
			<div class="listBox">
				<h5 class="tit1 jt01">
					第一部分<span>疾病风险评估</span>
				</h5>
				<ul style="display: block;">
					<li><g:link controller="illness" action="showHighAll"
							params='[username:"${username }"]'>较高风险疾病汇总</g:link></li>
					<li><g:link controller="illness" action="showLowAll"
							params='[username:"${username }"]'>较低风险疾病汇总</g:link></li>
					<li><g:link controller="illness" action="showNormalAll"
							params='[username:"${username }"]'>一般风险疾病汇总</g:link></li>
					<g:each in="${illnesses }" var="illness" status="i">
						<li><g:link controller="illness" action="showDetail"
								params='[illnessId:"${illness.id }",status:"${i }",username:"${username }"]'>
								${illness.chineseName?:illness.name }
							</g:link></li>
					</g:each>
				</ul>
			</div>
			<div class="listBox">
				<h5 class="tit1 jt02">
					第二部分<span>先天性遗传疾病</span>
				</h5>
				<ul>
					<div class="tit">
	                <div class="s1">名称</div>
	                <div class="s2">研究数量</div>
	                <div class="s3">结果</div>
	                </div>
					<g:each in="${inheritedConditionses }" var="inheritedConditions">
						<li>
							<div class="s1">${inheritedConditions.name }</div>
			                <div class="s2">
				                <g:each in="${(1..inheritedConditions.magnitude ) }">
								<g:img dir="images" file="ico1.gif"/>
								</g:each>
			                </div>
			                <div class="s3">${inheritedConditions.result }</div>
						</li>
					</g:each>
				</ul>
			</div>
			<div class="listBox">
				<h5 class="tit1 jt02">
					第三部分<span>个体化用药指导</span>
				</h5>
				<ul>
					<div class="tit">
	                <div class="s1">名称</div>
	                <div class="s2">研究数量</div>
	                <div class="s3">状态</div>
	                </div>
					<g:each in="${drugResponses }" var="drugResponse" status="i">
						<li>
							<div class="s1">
								<g:link controller="userDrugRelation" action="showDetail" params='[drugResponseId:"${drugResponse.id }",status:"${i }",username:"${username }"]'>
									${drugResponse.chineseName?:drugResponse.name }
								</g:link>
							</div>
			                <div class="s2">
			                	<g:each in="${(1..drugResponse.magnitude ) }">
								<g:img dir="images" file="ico1.gif"/>
								</g:each>
			                </div>
			                <div class="s3">${UserDrugRelation.findByDrugResponseAndUsername(drugResponse, username).state }</div>
						</li>
					</g:each>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
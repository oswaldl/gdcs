
<%@ page import="com.zy.vo.Gene" %>
<!DOCTYPE html>
<html>
	<head>
		<title>基因检测报告</title>
		<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'css.css')}"/>
		<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'style.css')}"/>
		<g:set var="entityName" value="${message(code: 'gene.label', default: 'Gene')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="header">
			<div class="lefts"><g:img dir="images" file="logo2.jpg" width="457" height="134"/></div>
			<div class="rights">
		    	<p><span>${params.username }</span><g:link controller="logout">[注销]</g:link></p>
		        <p>欢迎进入基因检测报告！</p>
		    </div>
		</div>
		<div class="main2">
		  <div class="tit3">
		  		<p class="s1">${geneInstance?.name }</p>
		  </div>
		</div>
		<div class="contBox2">
	   	  <div class="tit4">基因详细信息</div>
	        <div class="cont">
	        	<div class="content">
		          <table>
		          	<tr>
		          		<td>名称</td>
		          		<td>${geneInstance?.name }</td>
		          	</tr>
		          	<tr>
		          		<td>repute</td>
		          		<td>${geneInstance?.repute }</td>
		          	</tr>
		          	<tr>
		          		<td>magnitude</td>
		          		<td>${geneInstance?.magnitude }</td>
		          	</tr>
		          	<tr>
		          		<td>frequency</td>
		          		<td>${geneInstance?.frequency }</td>
		          	</tr>
		          	<tr>
		          		<td>references</td>
		          		<td>${geneInstance?.references }</td>
		          	</tr>
		          	<tr>
		          		<td>介绍</td>
		          		<td>${geneInstance?.description2 }</td>
		          	</tr>
		          	<tr>
		          		<td>影响病例</td>
		          		<td>${geneInstance?.description1 }</td>
		          	</tr>
		 			<tr>
		 				<td colspan="2">
		 					<g:if test="${params.status=='null' }">
		 						<g:link class="button" controller="illness" action="showIllness" params='[illnessId:"${params.illnessId }",username:"${params.username }"]' >返回</g:link>
		 					</g:if>
		 					<g:if test="${params.status!='null' }">
		 						<g:link class="button" controller="illness" action="showDetail" params='[illnessId:"${params.illnessId }",status:"${params.status }",username:"${params.username }"]' >返回</g:link>
		 					</g:if>
		 				</td>
		 			</tr>
		          </table>
	       		</div>
	        </div>
	  </div>
	</body>
</html>


<%@ page import="com.zy.vo.Illness" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'style.css')}" />
		<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'console_style.css')}" />
		<g:set var="entityName" value="${message(code: 'illness.label', default: 'Illness')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="content">
			<div class="contiter">
    			<h2>病例列表</h2>
    		</div>
    		<div class="conmain">
    			<g:link class="botton" action="create">新增</g:link>
    			<g:form url="[action:'getIllness',controller:'illness']" >
				<input name="searchString" id="search" />
				<input type="submit" style="float:right;margin-right:640px;" value="查询" />
				</g:form>
    		</div>
    		<div class="conmain">
    			<strong class="Orange">
    				<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
    			</strong>
    		</div>
			<div class="conmain">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr class="tbbg">
						
						<td width="19%" align="center"><strong>中文名</strong></td>
   						<td width="19%" align="center"><strong>英文名</strong></td>
   						<td width="62%" align="center"><strong>描述</strong></td>
					
					</tr>
				<g:each in="${illnessInstanceList}" status="i" var="illnessInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="edit" id="${illnessInstance.id}">${fieldValue(bean: illnessInstance, field: "chineseName")}</g:link></td>
					
						<td><g:link action="edit" id="${illnessInstance.id}">${fieldValue(bean: illnessInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: illnessInstance, field: "description")}</td>
					
					</tr>
				</g:each>
			</table>
			</div>
			</div>
	</body>
</html>

<%@ page import="com.zy.vo.IllnessCat" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'style.css')}" />
		<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'console_style.css')}" />
		<g:set var="entityName" value="${message(code: 'illnessCat.label', default: 'IllnessCat')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="content">
			<div class="contiter">
    			<h2>病例列表</h2>
    		</div>
    		<div class="conmain">
    			<g:link class="botton" action="create">新增</g:link>
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
					<td width="19%" align="center"><strong>名称</strong></td>
				</tr>
				<g:each in="${illnessCatInstanceList}" status="i" var="illnessCatInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="edit" id="${illnessCatInstance.id}">${fieldValue(bean: illnessCatInstance, field: "name")}</g:link></td>
					</tr>
				</g:each>
			</table>
			<div class="pagination">
				<g:paginate total="${illnessCatInstanceTotal}" />
			</div>
			</div>
			</div>
	</body>
</html>

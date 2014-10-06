
<%@ page import="com.zy.vo.Inherited" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css"
	href="${resource(dir: 'css', file: 'style.css')}" />
<link rel="stylesheet" type="text/css"
	href="${resource(dir: 'css', file: 'console_style.css')}" />
		<g:set var="entityName" value="${message(code: 'inherited.label', default: 'Inherited')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="content">
		<div class="contiter">
			<h2>生命谱列表</h2>
		</div>
		<div class="conmain">
			<g:link class="botton" action="create">新增</g:link>
		</div>
		<div class="conmain">
			<strong class="Orange"> <g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
			</strong>
		</div>
		<div class="conmain">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr class="tbbg">
					<td width="30%" align="center"><strong>中文名</strong></td>
					<td width="30%" align="center"><strong>英文名</strong></td>
					<td width="40%" align="center"><strong>研究数量</strong></td>
				</tr>
				<g:each in="${inheritedInstanceList}" status="i"
					var="inheritedInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="edit" id="${inheritedInstance.id}">
								${fieldValue(bean: inheritedInstance, field: "chineseName")}
							</g:link></td>

						<td><g:link action="edit" id="${inheritedInstance.id}">
								${fieldValue(bean: inheritedInstance, field: "name")}
							</g:link></td>

						<td>
							<g:link action="edit" id="${inheritedInstance.id}">
								${fieldValue(bean: inheritedInstance, field: "magnitude")}
							</g:link>
						</td>
					</tr>
				</g:each>
			</table>
			<div class="pagination">
				<g:paginate total="${inheritedInstanceTotal}" />
			</div>
		</div>
	</div>
	</body>
</html>

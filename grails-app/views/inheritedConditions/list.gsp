
<%@ page import="com.zy.vo.InheritedConditions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inheritedConditions.label', default: 'InheritedConditions')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-inheritedConditions" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-inheritedConditions" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="magnitude" title="${message(code: 'inheritedConditions.magnitude.label', default: 'Magnitude')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'inheritedConditions.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="result" title="${message(code: 'inheritedConditions.result.label', default: 'Result')}" />
					
						<g:sortableColumn property="username" title="${message(code: 'inheritedConditions.username.label', default: 'Username')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${inheritedConditionsInstanceList}" status="i" var="inheritedConditionsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${inheritedConditionsInstance.id}">${fieldValue(bean: inheritedConditionsInstance, field: "magnitude")}</g:link></td>
					
						<td>${fieldValue(bean: inheritedConditionsInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: inheritedConditionsInstance, field: "result")}</td>
					
						<td>${fieldValue(bean: inheritedConditionsInstance, field: "username")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${inheritedConditionsInstanceTotal}" />
			</div>
		</div>
	</body>
</html>


<%@ page import="com.zy.vo.UserTriats" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userTriats.label', default: 'UserTriats')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-userTriats" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-userTriats" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="result" title="${message(code: 'userTriats.result.label', default: 'Result')}" />
					
						<th><g:message code="userTriats.triats.label" default="Triats" /></th>
					
						<g:sortableColumn property="username" title="${message(code: 'userTriats.username.label', default: 'Username')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userTriatsInstanceList}" status="i" var="userTriatsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userTriatsInstance.id}">${fieldValue(bean: userTriatsInstance, field: "result")}</g:link></td>
					
						<td>${fieldValue(bean: userTriatsInstance, field: "triats")}</td>
					
						<td>${fieldValue(bean: userTriatsInstance, field: "username")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userTriatsInstanceTotal}" />
			</div>
		</div>
	</body>
</html>


<%@ page import="com.zy.vo.Triats" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'triats.label', default: 'Triats')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-triats" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-triats" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="magnitude" title="${message(code: 'triats.magnitude.label', default: 'Magnitude')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'triats.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="result" title="${message(code: 'triats.result.label', default: 'Result')}" />
					
						<g:sortableColumn property="username" title="${message(code: 'triats.username.label', default: 'Username')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${triatsInstanceList}" status="i" var="triatsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${triatsInstance.id}">${fieldValue(bean: triatsInstance, field: "magnitude")}</g:link></td>
					
						<td>${fieldValue(bean: triatsInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: triatsInstance, field: "result")}</td>
					
						<td>${fieldValue(bean: triatsInstance, field: "username")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${triatsInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

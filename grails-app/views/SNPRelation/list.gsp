
<%@ page import="com.zy.vo.SNPRelation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'SNPRelation.label', default: 'SNPRelation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-SNPRelation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-SNPRelation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="SNPRelation.gene.label" default="Gene" /></th>
					
						<th><g:message code="SNPRelation.illness.label" default="Illness" /></th>
					
						<th><g:message code="SNPRelation.user.label" default="User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${SNPRelationInstanceList}" status="i" var="SNPRelationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${SNPRelationInstance.id}">${fieldValue(bean: SNPRelationInstance, field: "gene")}</g:link></td>
					
						<td>${fieldValue(bean: SNPRelationInstance, field: "illness")}</td>
					
						<td>${fieldValue(bean: SNPRelationInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${SNPRelationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

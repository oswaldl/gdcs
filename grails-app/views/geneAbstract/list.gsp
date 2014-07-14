
<%@ page import="com.zy.vo.GeneAbstract" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'geneAbstract.label', default: 'GeneAbstract')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-geneAbstract" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-geneAbstract" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'geneAbstract.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="journal" title="${message(code: 'geneAbstract.journal.label', default: 'Journal')}" />
					
						<g:sortableColumn property="marker" title="${message(code: 'geneAbstract.marker.label', default: 'Marker')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'geneAbstract.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="studySize" title="${message(code: 'geneAbstract.studySize.label', default: 'Study Size')}" />
					
						<g:sortableColumn property="types" title="${message(code: 'geneAbstract.types.label', default: 'Types')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${geneAbstractInstanceList}" status="i" var="geneAbstractInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${geneAbstractInstance.id}">${fieldValue(bean: geneAbstractInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: geneAbstractInstance, field: "journal")}</td>
					
						<td>${fieldValue(bean: geneAbstractInstance, field: "marker")}</td>
					
						<td>${fieldValue(bean: geneAbstractInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: geneAbstractInstance, field: "studySize")}</td>
					
						<td>${fieldValue(bean: geneAbstractInstance, field: "types")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${geneAbstractInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

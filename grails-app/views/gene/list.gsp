
<%@ page import="com.zy.vo.Gene" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'gene.label', default: 'Gene')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-gene" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-gene" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'gene.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description1" title="${message(code: 'gene.description1.label', default: 'Description1')}" />
					
						<g:sortableColumn property="description2" title="${message(code: 'gene.description2.label', default: 'Description2')}" />
					
						<g:sortableColumn property="isReputeGood" title="${message(code: 'gene.isReputeGood.label', default: 'Is Repute Good')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${geneInstanceList}" status="i" var="geneInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${geneInstance.id}">${fieldValue(bean: geneInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: geneInstance, field: "description1")}</td>
					
						<td>${fieldValue(bean: geneInstance, field: "description2")}</td>
					
						<td><g:formatBoolean boolean="${geneInstance.isReputeGood}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${geneInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

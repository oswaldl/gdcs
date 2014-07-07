
<%@ page import="com.zy.vo.UserDrugRelation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userDrugRelation.label', default: 'UserDrugRelation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-userDrugRelation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-userDrugRelation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="geneData" title="${message(code: 'userDrugRelation.geneData.label', default: 'Gene Data')}" />
					
						<g:sortableColumn property="oddRatio" title="${message(code: 'userDrugRelation.oddRatio.label', default: 'Odd Ratio')}" />
					
						<g:sortableColumn property="geneAbstract" title="${message(code: 'userDrugRelation.geneAbstract.label', default: 'Gene Abstract')}" />
					
						<th><g:message code="userDrugRelation.drugResponse.label" default="Drug Response" /></th>
					
						<g:sortableColumn property="state" title="${message(code: 'userDrugRelation.state.label', default: 'State')}" />
					
						<g:sortableColumn property="username" title="${message(code: 'userDrugRelation.username.label', default: 'Username')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userDrugRelationInstanceList}" status="i" var="userDrugRelationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userDrugRelationInstance.id}">${fieldValue(bean: userDrugRelationInstance, field: "geneData")}</g:link></td>
					
						<td>${fieldValue(bean: userDrugRelationInstance, field: "oddRatio")}</td>
					
						<td>${fieldValue(bean: userDrugRelationInstance, field: "geneAbstract")}</td>
					
						<td>${fieldValue(bean: userDrugRelationInstance, field: "drugResponse")}</td>
					
						<td>${fieldValue(bean: userDrugRelationInstance, field: "state")}</td>
					
						<td>${fieldValue(bean: userDrugRelationInstance, field: "username")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userDrugRelationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

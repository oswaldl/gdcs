
<%@ page import="com.zy.vo.GeneAbstract" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'geneAbstract.label', default: 'GeneAbstract')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-geneAbstract" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-geneAbstract" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list geneAbstract">
			
				<g:if test="${geneAbstractInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="geneAbstract.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${geneAbstractInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${geneAbstractInstance?.journal}">
				<li class="fieldcontain">
					<span id="journal-label" class="property-label"><g:message code="geneAbstract.journal.label" default="Journal" /></span>
					
						<span class="property-value" aria-labelledby="journal-label"><g:fieldValue bean="${geneAbstractInstance}" field="journal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${geneAbstractInstance?.marker}">
				<li class="fieldcontain">
					<span id="marker-label" class="property-label"><g:message code="geneAbstract.marker.label" default="Marker" /></span>
					
						<span class="property-value" aria-labelledby="marker-label"><g:fieldValue bean="${geneAbstractInstance}" field="marker"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${geneAbstractInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="geneAbstract.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${geneAbstractInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${geneAbstractInstance?.studySize}">
				<li class="fieldcontain">
					<span id="studySize-label" class="property-label"><g:message code="geneAbstract.studySize.label" default="Study Size" /></span>
					
						<span class="property-value" aria-labelledby="studySize-label"><g:fieldValue bean="${geneAbstractInstance}" field="studySize"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${geneAbstractInstance?.types}">
				<li class="fieldcontain">
					<span id="types-label" class="property-label"><g:message code="geneAbstract.types.label" default="Types" /></span>
					
						<span class="property-value" aria-labelledby="types-label"><g:fieldValue bean="${geneAbstractInstance}" field="types"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${geneAbstractInstance?.id}" />
					<g:link class="edit" action="edit" id="${geneAbstractInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

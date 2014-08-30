
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
		</div>
	</body>
</html>

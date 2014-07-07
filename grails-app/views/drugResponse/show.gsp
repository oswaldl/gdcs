
<%@ page import="com.zy.vo.DrugResponse" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'drugResponse.label', default: 'DrugResponse')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-drugResponse" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-drugResponse" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list drugResponse">
			
				<g:if test="${drugResponseInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="drugResponse.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${drugResponseInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${drugResponseInstance?.chineseName}">
				<li class="fieldcontain">
					<span id="chineseName-label" class="property-label"><g:message code="drugResponse.chineseName.label" default="Chinese Name" /></span>
					
						<span class="property-value" aria-labelledby="chineseName-label"><g:fieldValue bean="${drugResponseInstance}" field="chineseName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${drugResponseInstance?.genetics}">
				<li class="fieldcontain">
					<span id="genetics-label" class="property-label"><g:message code="drugResponse.genetics.label" default="Genetics" /></span>
					
						<span class="property-value" aria-labelledby="genetics-label"><g:fieldValue bean="${drugResponseInstance}" field="genetics"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${drugResponseInstance?.reference}">
				<li class="fieldcontain">
					<span id="reference-label" class="property-label"><g:message code="drugResponse.reference.label" default="Reference" /></span>
					
						<span class="property-value" aria-labelledby="reference-label"><g:fieldValue bean="${drugResponseInstance}" field="reference"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${drugResponseInstance?.introduction}">
				<li class="fieldcontain">
					<span id="introduction-label" class="property-label"><g:message code="drugResponse.introduction.label" default="Introduction" /></span>
					
						<span class="property-value" aria-labelledby="introduction-label"><g:fieldValue bean="${drugResponseInstance}" field="introduction"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${drugResponseInstance?.magnitude}">
				<li class="fieldcontain">
					<span id="magnitude-label" class="property-label"><g:message code="drugResponse.magnitude.label" default="Magnitude" /></span>
					
						<span class="property-value" aria-labelledby="magnitude-label"><g:fieldValue bean="${drugResponseInstance}" field="magnitude"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${drugResponseInstance?.id}" />
					<g:link class="edit" action="edit" id="${drugResponseInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

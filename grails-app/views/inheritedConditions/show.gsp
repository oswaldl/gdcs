
<%@ page import="com.zy.vo.InheritedConditions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inheritedConditions.label', default: 'InheritedConditions')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-inheritedConditions" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-inheritedConditions" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list inheritedConditions">
			
				<g:if test="${inheritedConditionsInstance?.magnitude}">
				<li class="fieldcontain">
					<span id="magnitude-label" class="property-label"><g:message code="inheritedConditions.magnitude.label" default="Magnitude" /></span>
					
						<span class="property-value" aria-labelledby="magnitude-label"><g:fieldValue bean="${inheritedConditionsInstance}" field="magnitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inheritedConditionsInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="inheritedConditions.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${inheritedConditionsInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inheritedConditionsInstance?.result}">
				<li class="fieldcontain">
					<span id="result-label" class="property-label"><g:message code="inheritedConditions.result.label" default="Result" /></span>
					
						<span class="property-value" aria-labelledby="result-label"><g:fieldValue bean="${inheritedConditionsInstance}" field="result"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inheritedConditionsInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="inheritedConditions.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${inheritedConditionsInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${inheritedConditionsInstance?.id}" />
					<g:link class="edit" action="edit" id="${inheritedConditionsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

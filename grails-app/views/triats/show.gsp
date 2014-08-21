
<%@ page import="com.zy.vo.Triats" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'triats.label', default: 'Triats')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-triats" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-triats" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list triats">
			
				<g:if test="${triatsInstance?.magnitude}">
				<li class="fieldcontain">
					<span id="magnitude-label" class="property-label"><g:message code="triats.magnitude.label" default="Magnitude" /></span>
					
						<span class="property-value" aria-labelledby="magnitude-label"><g:fieldValue bean="${triatsInstance}" field="magnitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${triatsInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="triats.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${triatsInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${triatsInstance?.result}">
				<li class="fieldcontain">
					<span id="result-label" class="property-label"><g:message code="triats.result.label" default="Result" /></span>
					
						<span class="property-value" aria-labelledby="result-label"><g:fieldValue bean="${triatsInstance}" field="result"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${triatsInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="triats.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${triatsInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${triatsInstance?.id}" />
					<g:link class="edit" action="edit" id="${triatsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

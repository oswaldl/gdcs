
<%@ page import="com.zy.vo.UserTriats" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userTriats.label', default: 'UserTriats')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-userTriats" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-userTriats" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list userTriats">
			
				<g:if test="${userTriatsInstance?.result}">
				<li class="fieldcontain">
					<span id="result-label" class="property-label"><g:message code="userTriats.result.label" default="Result" /></span>
					
						<span class="property-value" aria-labelledby="result-label"><g:fieldValue bean="${userTriatsInstance}" field="result"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userTriatsInstance?.triats}">
				<li class="fieldcontain">
					<span id="triats-label" class="property-label"><g:message code="userTriats.triats.label" default="Triats" /></span>
					
						<span class="property-value" aria-labelledby="triats-label"><g:link controller="triats" action="show" id="${userTriatsInstance?.triats?.id}">${userTriatsInstance?.triats?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${userTriatsInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="userTriats.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${userTriatsInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${userTriatsInstance?.id}" />
					<g:link class="edit" action="edit" id="${userTriatsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>


<%@ page import="com.zy.vo.CrawlRecord" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'crawlRecord.label', default: 'CrawlRecord')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-crawlRecord" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-crawlRecord" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list crawlRecord">
			
				<g:if test="${crawlRecordInstance?.url1}">
				<li class="fieldcontain">
					<span id="url1-label" class="property-label"><g:message code="crawlRecord.url1.label" default="Url1" /></span>
					
						<span class="property-value" aria-labelledby="url1-label"><g:fieldValue bean="${crawlRecordInstance}" field="url1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${crawlRecordInstance?.url2}">
				<li class="fieldcontain">
					<span id="url2-label" class="property-label"><g:message code="crawlRecord.url2.label" default="Url2" /></span>
					
						<span class="property-value" aria-labelledby="url2-label"><g:fieldValue bean="${crawlRecordInstance}" field="url2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${crawlRecordInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="crawlRecord.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${crawlRecordInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${crawlRecordInstance?.id}" />
					<g:link class="edit" action="edit" id="${crawlRecordInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

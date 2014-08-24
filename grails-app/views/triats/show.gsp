
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
			
				<g:if test="${triatsInstance?.introduction}">
				<li class="fieldcontain">
					<span id="introduction-label" class="property-label"><g:message code="triats.introduction.label" default="Introduction" /></span>
					
						<span class="property-value" aria-labelledby="introduction-label"><g:fieldValue bean="${triatsInstance}" field="introduction"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${triatsInstance?.genetics}">
				<li class="fieldcontain">
					<span id="genetics-label" class="property-label"><g:message code="triats.genetics.label" default="Genetics" /></span>
					
						<span class="property-value" aria-labelledby="genetics-label"><g:fieldValue bean="${triatsInstance}" field="genetics"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${triatsInstance?.biology}">
				<li class="fieldcontain">
					<span id="biology-label" class="property-label"><g:message code="triats.biology.label" default="Biology" /></span>
					
						<span class="property-value" aria-labelledby="biology-label"><g:fieldValue bean="${triatsInstance}" field="biology"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${triatsInstance?.findings}">
				<li class="fieldcontain">
					<span id="findings-label" class="property-label"><g:message code="triats.findings.label" default="Findings" /></span>
					
						<span class="property-value" aria-labelledby="findings-label"><g:fieldValue bean="${triatsInstance}" field="findings"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${triatsInstance?.chineseName}">
				<li class="fieldcontain">
					<span id="chineseName-label" class="property-label"><g:message code="triats.chineseName.label" default="Chinese Name" /></span>
					
						<span class="property-value" aria-labelledby="chineseName-label"><g:fieldValue bean="${triatsInstance}" field="chineseName"/></span>
					
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
			
				<g:if test="${triatsInstance?.geneAbstract}">
				<li class="fieldcontain">
					<span id="geneAbstract-label" class="property-label"><g:message code="triats.geneAbstract.label" default="Gene Abstract" /></span>
					
						<g:each in="${triatsInstance.geneAbstract}" var="g">
						<span class="property-value" aria-labelledby="geneAbstract-label"><g:link controller="geneAbstract" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${triatsInstance?.magnitude}">
				<li class="fieldcontain">
					<span id="magnitude-label" class="property-label"><g:message code="triats.magnitude.label" default="Magnitude" /></span>
					
						<span class="property-value" aria-labelledby="magnitude-label"><g:fieldValue bean="${triatsInstance}" field="magnitude"/></span>
					
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

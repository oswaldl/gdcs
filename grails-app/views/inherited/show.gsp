
<%@ page import="com.zy.vo.Inherited" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inherited.label', default: 'Inherited')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-inherited" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-inherited" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list inherited">
			
				<g:if test="${inheritedInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="inherited.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${inheritedInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inheritedInstance?.chineseName}">
				<li class="fieldcontain">
					<span id="chineseName-label" class="property-label"><g:message code="inherited.chineseName.label" default="Chinese Name" /></span>
					
						<span class="property-value" aria-labelledby="chineseName-label"><g:fieldValue bean="${inheritedInstance}" field="chineseName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inheritedInstance?.genetics}">
				<li class="fieldcontain">
					<span id="genetics-label" class="property-label"><g:message code="inherited.genetics.label" default="Genetics" /></span>
					
						<span class="property-value" aria-labelledby="genetics-label"><g:fieldValue bean="${inheritedInstance}" field="genetics"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inheritedInstance?.reference}">
				<li class="fieldcontain">
					<span id="reference-label" class="property-label"><g:message code="inherited.reference.label" default="Reference" /></span>
					
						<span class="property-value" aria-labelledby="reference-label"><g:fieldValue bean="${inheritedInstance}" field="reference"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inheritedInstance?.introduction}">
				<li class="fieldcontain">
					<span id="introduction-label" class="property-label"><g:message code="inherited.introduction.label" default="Introduction" /></span>
					
						<span class="property-value" aria-labelledby="introduction-label"><g:fieldValue bean="${inheritedInstance}" field="introduction"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inheritedInstance?.geneAbstract}">
				<li class="fieldcontain">
					<span id="geneAbstract-label" class="property-label"><g:message code="inherited.geneAbstract.label" default="Gene Abstract" /></span>
					
						<g:each in="${inheritedInstance.geneAbstract}" var="g">
						<span class="property-value" aria-labelledby="geneAbstract-label"><g:link controller="geneAbstract" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${inheritedInstance?.geneData}">
				<li class="fieldcontain">
					<span id="geneData-label" class="property-label"><g:message code="inherited.geneData.label" default="Gene Data" /></span>
					
						<span class="property-value" aria-labelledby="geneData-label"><g:fieldValue bean="${inheritedInstance}" field="geneData"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inheritedInstance?.magnitude}">
				<li class="fieldcontain">
					<span id="magnitude-label" class="property-label"><g:message code="inherited.magnitude.label" default="Magnitude" /></span>
					
						<span class="property-value" aria-labelledby="magnitude-label"><g:fieldValue bean="${inheritedInstance}" field="magnitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inheritedInstance?.oddRatio}">
				<li class="fieldcontain">
					<span id="oddRatio-label" class="property-label"><g:message code="inherited.oddRatio.label" default="Odd Ratio" /></span>
					
						<span class="property-value" aria-labelledby="oddRatio-label"><g:fieldValue bean="${inheritedInstance}" field="oddRatio"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${inheritedInstance?.id}" />
					<g:link class="edit" action="edit" id="${inheritedInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

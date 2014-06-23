
<%@ page import="com.zy.vo.Illness" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'illness.label', default: 'Illness')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-illness" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-illness" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list illness">
			
				<g:if test="${illnessInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="illness.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${illnessInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${illnessInstance?.chineseName}">
				<li class="fieldcontain">
					<span id="chineseName-label" class="property-label"><g:message code="illness.chineseName.label" default="Chinese Name" /></span>
					
						<span class="property-value" aria-labelledby="chineseName-label"><g:fieldValue bean="${illnessInstance}" field="chineseName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${illnessInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="illness.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${illnessInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${illnessInstance?.canDo}">
				<li class="fieldcontain">
					<span id="canDo-label" class="property-label"><g:message code="illness.canDo.label" default="Can Do" /></span>
					
						<span class="property-value" aria-labelledby="canDo-label"><g:fieldValue bean="${illnessInstance}" field="canDo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${illnessInstance?.geneticEnvironment}">
				<li class="fieldcontain">
					<span id="geneticEnvironment-label" class="property-label"><g:message code="illness.geneticEnvironment.label" default="Genetic Environment" /></span>
					
						<span class="property-value" aria-labelledby="geneticEnvironment-label"><g:fieldValue bean="${illnessInstance}" field="geneticEnvironment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${illnessInstance?.reference}">
				<li class="fieldcontain">
					<span id="reference-label" class="property-label"><g:message code="illness.reference.label" default="Reference" /></span>
					
						<span class="property-value" aria-labelledby="reference-label"><g:fieldValue bean="${illnessInstance}" field="reference"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${illnessInstance?.averageRisk}">
				<li class="fieldcontain">
					<span id="averageRisk-label" class="property-label"><g:message code="illness.averageRisk.label" default="Average Risk" /></span>
					
						<span class="property-value" aria-labelledby="averageRisk-label"><g:fieldValue bean="${illnessInstance}" field="averageRisk"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${illnessInstance?.illnessCat}">
				<li class="fieldcontain">
					<span id="illnessCat-label" class="property-label"><g:message code="illness.illnessCat.label" default="Illness Cat" /></span>
					
						<span class="property-value" aria-labelledby="illnessCat-label"><g:link controller="illnessCat" action="show" id="${illnessInstance?.illnessCat?.id}">${illnessInstance?.illnessCat?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${illnessInstance?.id}" />
					<g:link class="edit" action="edit" id="${illnessInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

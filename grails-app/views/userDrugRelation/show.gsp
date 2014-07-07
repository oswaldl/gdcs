
<%@ page import="com.zy.vo.UserDrugRelation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userDrugRelation.label', default: 'UserDrugRelation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-userDrugRelation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-userDrugRelation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list userDrugRelation">
			
				<g:if test="${userDrugRelationInstance?.geneData}">
				<li class="fieldcontain">
					<span id="geneData-label" class="property-label"><g:message code="userDrugRelation.geneData.label" default="Gene Data" /></span>
					
						<span class="property-value" aria-labelledby="geneData-label"><g:fieldValue bean="${userDrugRelationInstance}" field="geneData"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userDrugRelationInstance?.oddRatio}">
				<li class="fieldcontain">
					<span id="oddRatio-label" class="property-label"><g:message code="userDrugRelation.oddRatio.label" default="Odd Ratio" /></span>
					
						<span class="property-value" aria-labelledby="oddRatio-label"><g:fieldValue bean="${userDrugRelationInstance}" field="oddRatio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userDrugRelationInstance?.geneAbstract}">
				<li class="fieldcontain">
					<span id="geneAbstract-label" class="property-label"><g:message code="userDrugRelation.geneAbstract.label" default="Gene Abstract" /></span>
					
						<span class="property-value" aria-labelledby="geneAbstract-label"><g:fieldValue bean="${userDrugRelationInstance}" field="geneAbstract"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userDrugRelationInstance?.drugResponse}">
				<li class="fieldcontain">
					<span id="drugResponse-label" class="property-label"><g:message code="userDrugRelation.drugResponse.label" default="Drug Response" /></span>
					
						<span class="property-value" aria-labelledby="drugResponse-label"><g:link controller="drugResponse" action="show" id="${userDrugRelationInstance?.drugResponse?.id}">${userDrugRelationInstance?.drugResponse?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${userDrugRelationInstance?.state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="userDrugRelation.state.label" default="State" /></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${userDrugRelationInstance}" field="state"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userDrugRelationInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="userDrugRelation.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${userDrugRelationInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${userDrugRelationInstance?.id}" />
					<g:link class="edit" action="edit" id="${userDrugRelationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

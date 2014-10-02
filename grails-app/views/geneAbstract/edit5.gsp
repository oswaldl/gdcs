<%@ page import="com.zy.vo.GeneAbstract" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'style.css')}" />
		<g:set var="entityName" value="${message(code: 'geneAbstract.label', default: 'GeneAbstract')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="title">更新界面</div>
		<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
		</g:if>
		<g:form method="post" >
			<g:hiddenField name="id" value="${geneAbstractInstance?.id}" />
			<g:hiddenField name="drugResponseInstanceId" value="${drugResponseInstanceId}" />
			<g:hiddenField name="version" value="${geneAbstractInstance?.version}" />
			<fieldset class="form">
				<g:render template="form"/>
			</fieldset>
			<fieldset class="buttons">
				<g:actionSubmit class="save" action="update" value="更新" />
			</fieldset>
		</g:form>
	</body>
</html>

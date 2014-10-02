<%@ page import="com.zy.vo.GeneAbstract" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'style.css')}" />
		<g:set var="entityName" value="${message(code: 'geneAbstract.label', default: 'GeneAbstract')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="title">新增界面</div>
		<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
		</g:if>
		<g:form method="post" >
			<g:hiddenField name="drugResponseInstanceId" value="${drugResponseInstanceId}" />
			<fieldset class="form">
				<g:render template="form"/>
			</fieldset>
			<fieldset class="buttons">
				<g:actionSubmit class="save" action="save1" value="新增" />
			</fieldset>
		</g:form>
	</body>
</html>
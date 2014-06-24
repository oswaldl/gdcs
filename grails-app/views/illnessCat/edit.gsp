<%@ page import="com.zy.vo.IllnessCat" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'style.css')}" />
		<g:set var="entityName" value="${message(code: 'illnessCat.label', default: 'IllnessCat')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="title">更新病例分类界面</div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:form method="post" >
				<g:hiddenField name="id" value="${illnessCatInstance?.id}" />
				<g:hiddenField name="version" value="${illnessCatInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="更新" />
					<g:actionSubmit class="delete" action="delete" value="删除" formnovalidate="" onclick="return confirm('确定删除？');" />
				</fieldset>
			</g:form>
	</body>
</html>

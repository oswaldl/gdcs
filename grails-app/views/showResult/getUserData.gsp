<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'style.css')}" />
		<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'console_style.css')}" />
		<g:set var="entityName" value="${message(code: 'showResult.label', default: 'ShowResult')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="title">新增爬取用户界面</div>
			<strong class="Orange">
   				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>
   			</strong>
			<g:form method="post" >
				<fieldset class="form">
					<table>
						<tr>
							<td width="40%" >URL</td>
							<td width="60%"><g:textField name="url"/></td>
						</tr>
					</table>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="getDataByURL" value="确定" />
				</fieldset>
			</g:form>
	</body>
</html>
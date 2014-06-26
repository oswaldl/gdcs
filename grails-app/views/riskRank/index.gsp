<%@ page import="com.zy.vo.RiskRank" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'style.css')}" />
		<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'console_style.css')}" />
		<g:set var="entityName" value="${message(code: 'riskRank.label', default: 'RiskRank')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="title">风险分级更新界面</div>
			<strong class="Orange">
   				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>
   			</strong>
			<g:form method="post" >
				<g:hiddenField name="id" value="${riskRankInstance?.id}" />
				<g:hiddenField name="version" value="${riskRankInstance?.version}" />
				<fieldset class="form">
					<table>
						<tr>
							<td width="60%" class="fieldcontain ${hasErrors(bean: riskRankInstance, field: 'high', 'error')} required">（本人风险-平均风险）高于此值将划分为高风险</td>
							<td width="40%"><g:textField name="high" value="${riskRankInstance?.high*100}"/>%</td>
						</tr>
						<tr>
							<td width="60%" class="fieldcontain ${hasErrors(bean: riskRankInstance, field: 'low', 'error')} required">（本人风险-平均风险）高于此值将划分为低风险</td>
							<td width="40%"><g:textField name="low" value="${riskRankInstance?.low*100}"/>%</td>
						</tr>
					</table>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="更新" />
				</fieldset>
			</g:form>
	</body>
</html>
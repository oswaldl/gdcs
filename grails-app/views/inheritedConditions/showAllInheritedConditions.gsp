<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>基因检测报告</title>
<link rel="stylesheet" type="text/css"
	href="${resource(dir: 'css', file: 'style.css')}" />
<link rel="stylesheet" type="text/css"
	href="${resource(dir: 'css', file: 'console_style.css')}" />
</head>
<body>
  <div class="content">
		<div class="contiter">
			<h2>${user.chineseName?:user.username }-生命谱列表</h2>
		</div>
		<div class="conmain">
   			<g:link class="botton" params='[username:"${user.username }"]' action="create">新增</g:link>
   			<g:form url="[action:'getInheritedConditions',controller:'inheritedConditions']" >
			<input name="searchString" id="search" />
			<input name="username" type="hidden" value="${user.username }"/>
			<input type="submit" style="float:right;margin-right:640px;" value="查询" />
			</g:form>
   		</div>
		<div class="conmain">
			<strong class="Orange"> <g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
			</strong>
		</div>
		<div class="conmain">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr class="tbbg">

					<td width="30%" align="center"><strong>名称</strong></td>
					<td width="30%" align="center"><strong>研究数量</strong></td>
					<td width="40%" align="center"><strong>结果</strong></td>

				</tr>
				<g:each in="${inheritedConditionsInstanceList}" status="i"
					var="inheritedConditionsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="edit" id="${inheritedConditionsInstance.id }">${fieldValue(bean: inheritedConditionsInstance, field: "name")}</g:link></td>

						<td>${fieldValue(bean: inheritedConditionsInstance, field: "magnitude")}</td>

						<td>${fieldValue(bean: inheritedConditionsInstance, field: "result")}</td>
					</tr>
				</g:each>
			</table>
			<div class="pagination">
				<g:paginate controller="inheritedConditions" action="showAllInheritedConditions" id="${user.id }" total="${inheritedConditionsInstanceTotal}" />
			</div>
		</div>
	</div>
</body>
</html>
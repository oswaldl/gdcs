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
			<h2>${user.chineseName?:user.username }-药品谱列表</h2>
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
					<td width="30%" align="center"><strong>中文名</strong></td>
					<td width="30%" align="center"><strong>英文名</strong></td>
					<td width="40%" align="center"><strong>操作</strong></td>
				</tr>
				<g:each in="${drugResponseInstanceList}" status="i"
					var="drugResponseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td>${fieldValue(bean: drugResponseInstance, field: "chineseName")}</td>

						<td>${fieldValue(bean: drugResponseInstance, field: "name")}</td>

						<td>
							<g:link controller="userDrugRelation" action="edit" params='[userId:"${user.id }",drugResponseId:"${drugResponseInstance.id }"]'>编辑</g:link>
						</td>
					</tr>
				</g:each>
			</table>
			<div class="pagination">
				<g:paginate controller="userDrugRelation" action="showAllDrugResponse" id="${user.id }" total="${drugResponseInstanceTotal}" />
			</div>
		</div>
	</div>
</body>
</html>
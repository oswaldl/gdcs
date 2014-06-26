<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${resource(dir: 'css', file: 'css.css')}" />
</head>
<body>
	<div class="header">
		<div class="lefts">
			<img src="../images/logo2.jpg" width="457" height="134" />
		</div>
		<div class="rights">
			<p>
				<span>${username }</span><a href="#">[注销]</a>
			</p>
			<p>欢迎进入基因检测报告！</p>
		</div>
	</div>
	<div class="main">
		<div class="tit2">
			<h3>一般风险</h3>
		</div>
		<div class="content">
			<table width="100%" border="0" cellspacing="1" cellpadding="0"
				bgcolor="#f4f4f4">
				<tr style="font-size: 18px; color: #fff;">
					<th width="305" height="50" align="center" valign="middle"
						bgcolor="#19b1ad">名称</th>
					<th width="180" align="center" valign="middle" bgcolor="#19b1ad">研究数量</th>
					<th width="190" align="center" valign="middle" bgcolor="#19b1ad">你的风险</th>
					<th width="190" align="center" valign="middle" bgcolor="#19b1ad">平均风险</th>
					<th width="150" align="center" valign="middle" bgcolor="#19b1ad">与平均对比</th>
				</tr>
				<g:each in="${illnesses }" var="illness" status="i">
					<tr bgcolor="${(i % 2) == 0 ? '#ffffff' : '#fafafa'}">
						<td align="center" valign="middle" class="paddingT10">
							${illness.name }
						</td>
						<td align="center" valign="middle" class="paddingT10"><img
							src="../images/ico1.gif" /><img src="../images/ico1.gif" /><img
							src="../images/ico1.gif" /><img src="../images/ico1.gif" /><img
							src="../images/ico1.gif" /></td>
						<td align="center" valign="middle" class="paddingT10"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td align="center" valign="middle"><img
										src="../images/ico2.gif" /><img src="../images/ico2.gif" /><img
										src="../images/ico2.gif" /><img src="../images/ico3.gif" /><img
										src="../images/ico3.gif" /></td>
								</tr>
								<tr>
									<td align="center" valign="middle">
										${map.get(illness)*100 }%
									</td>
								</tr>
							</table></td>
						<td align="center" valign="middle" class="paddingT10"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td align="center" valign="middle"><img
										src="../images/ico2.gif" /><img src="../images/ico2.gif" /><img
										src="../images/ico2.gif" /><img src="../images/ico3.gif" /><img
										src="../images/ico3.gif" /></td>
								</tr>
								<tr>
									<td align="center" valign="middle">
										${illness.getRisk()*100 }%
									</td>
								</tr>
							</table></td>
						<td align="center" valign="middle" class="paddingT10">
							${(double)Math.round(map.get(illness)/illness.getRisk()*100)/100 }倍
						</td>
					</tr>
				</g:each>
			</table>
		</div>
		<div class="pageBox">
			<g:link class="s1" controller="showResult" action="index"
				params='[username:"${username }"]'>返回列表</g:link>
		</div>
	</div>
</body>
</html>
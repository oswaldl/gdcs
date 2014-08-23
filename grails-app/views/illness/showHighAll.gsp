<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>基因检测报告</title>
<link rel="stylesheet" type="text/css" media="screen" href="${resource(dir: 'css', file: 'css.css')}" />
<link rel="stylesheet" type="text/css" media="print" href="${resource(dir: 'css', file: 'print.css')}" />
</head>
<body>
	<div class="header">
		<div class="lefts">
			<g:img dir="images" file="logo2.jpg" width="457" height="134"/>
		</div>
		<div class="rights">
			<p>
				<span>${username }</span><g:link controller="logout">[注销]</g:link>
			</p>
			<p>欢迎进入基因检测报告！</p>
		</div>
	</div>
	<div class="main A1">
		<div class="pic"></div>
		<div class="tit2">
			<h3>较高风险</h3>
		</div>
		<div class="content">
			<table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#f4f4f4" style="font-size:22px;" >
				<tr>
					<th width="432" height="50" align="center" valign="middle" bgcolor="#eeefef" style="font-weight:normal;">名称</th>
					<th width="172" align="center" valign="middle" bgcolor="#dcdddd" style="font-weight:normal;">研究数量</th>
					<th width="140" align="center" valign="middle" bgcolor="#eeefef" style="font-weight:normal;">你的风险</th>
					<%--<th width="140" align="center" valign="middle" bgcolor="#eeefef" style="font-weight:normal;">平均风险</th>
					--%><th width="150" align="center" valign="middle" bgcolor="#dcdddd" style="font-weight:normal;">Good VS Bad</th>
				</tr>

<g:each in="${illnesses }" var="illness" status="i">
        <tr>
          <td align="left" valign="middle" bgcolor="#eeefef" class="paddingT102 ">
			  <g:link controller="illness" action="showIllness" params='[illnessId:"${illness.id }",username:"${username }"]'>
			  		<g:if test="${illness.chineseName}">
			  			${illness.chineseName }
			  		</g:if>
			  		<g:else>
						${illness.name }
					</g:else>
			  </g:link>
		  </td>
		  
		  <!-- 研究数量 -->
          <td align="center" valign="middle" bgcolor="#dcdddd" class="paddingT10">
			<div class="tubiao">
				<g:if test="${illness.getMagnitude()==0}">
				<%--
					<g:each in="${(0..4 ) }">
						<div class="ico"></div>
			  		</g:each>
			  		--%>
				</g:if>
				<g:else>
					<g:each in="${(0..illness.getMagnitude() ) }">
						<div class="ico"></div>
			  		</g:each>
				</g:else>
			  
            </div>
		  </td>
		  
		  <!-- 你的风险 -->
          <td align="center" valign="middle" bgcolor="#eeefef" class="paddingT10">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<td align="center" valign="middle" class="tubiao">
						<div class="tubiao">
							<g:if test="${((int)Math.ceil(map.get(illness)*100/20)) ==0}">
							<%--
								<g:each in="${0..4 }">
									<div class="ico1b"></div>
								</g:each>
								--%>
		                	</g:if>
		                	<g:else>
								<g:each in="${0..((int)Math.ceil(map.get(illness)*100/20))}">
										<div class="ico1a"></div>
								</g:each>
								<g:each in="${((int)Math.ceil(map.get(illness)*100/20))..4}">
										<div class="ico1b"></div>
								</g:each>
							</g:else>
						</div>
					 </td>
				  </tr>
				  
				  <%--<tr>
					<td align="center" valign="middle">${map.get(illness)*100 }%</td>
				  </tr>
            	--%>
            	</table>
		  </td>
		  
		  <!-- 平均风险 -->
          <%--<td align="center" valign="middle" bgcolor="#eeefef" class="paddingT10">
		     <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
              	<td>
	                <div class="tubiao">
	                	<g:if test="${((int)Math.ceil(illness.getRisk()*100/20))==0}">
	                	
							<g:each in="${0..4 }">
								<div class="ico1b"></div>
							</g:each>
							
	                	</g:if>
	                	<g:else>
		                	<g:each in="${(0..(int)Math.ceil(illness.getRisk()*100/20) ) }">
								<div class="ico1a"></div>
							</g:each>
							<g:each in="${(((int)Math.ceil(illness.getRisk()*100/20))..4 ) }">
								<div class="ico1b"></div>
							</g:each>
	                	</g:else>
	                </div>
                </td>
              </tr>
              <tr>
                <td align="center" valign="middle">${illness.getRisk()*100 }%</td>
              </tr>
            </table>
		  </td>
          --%>
          	<td align="center" valign="middle" bgcolor="#dcdddd" class="paddingT10">
          	${illness.getGoodGenesCount(username)}/${illness.getBadGenesCount(username)}
          	</td>
        </tr>
</g:each>

			</table>
		</div>
		<div class="pageBox">
			<g:link class="s1" controller="showResult" action="index" params='[username:"${username }"]'>返回列表</g:link>
		</div>
	</div>
</body>
</html>
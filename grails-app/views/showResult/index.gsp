<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>Insert title here</title>
</head>
<body>
  <div class="body">
  	<ul>
  		<li>
  			<g:link controller="illness" action="showHighAll" params='[username:"${username }"]'>较高风险疾病汇总</g:link>
  		</li>
  		<li>
  			<g:link controller="illness" action="showLowAll" params='[username:"${username }"]'>较低风险疾病汇总</g:link>
  		</li>
  		<li>
  			<g:link controller="illness" action="showNormalAll" params='[username:"${username }"]'>一般风险疾病汇总</g:link>
  		</li>
  		<g:each in="${illnesses }" var="illness" status="i">
  			<li>
  				<g:link controller="illness" action="showDetail" params='[illnessId:"${illness.id }",status:"${i }",username:"${username }"]'> ${illness.chineseName?:illness.name }</g:link>
  			</li>
  		</g:each>
  	</ul>
  </div>
</body>
</html>
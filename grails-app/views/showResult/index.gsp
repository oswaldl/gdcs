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
  			<g:link controller="illness" action="showHighAll">较高风险疾病汇总</g:link>
  		</li>
  		<li>
  			<g:link controller="illness" action="showLowAll">较低风险疾病汇总</g:link>
  		</li>
  		<li>
  			<g:link controller="illness" action="showNormalAll">一般风险疾病汇总</g:link>
  		</li>
  		<g:each in="${illnesses }" var="illness">
  			<li>
  				<g:link controller="illness" action="show" id="${illness.id }">${illness.chineseName?:illness.name }</g:link>
  			</li>
  		</g:each>
  	</ul>
  </div>
</body>
</html>
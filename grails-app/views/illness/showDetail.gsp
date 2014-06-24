<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="layout" content="main"/>
<title>Insert title here</title>
</head>
<body>
  <div class="body">
  	${illnessInstance?.name }
  	<br>
  	<g:if test="${total!=1&&status==0 }">
  		<g:link action="showDetailByStatus" params='[username:"${username }",status:"${status+1 }"]'>下一个</g:link>
  	</g:if>
  	<g:if test="${total!=1&&status!=0&&status!=(total-1) }">
  		<g:link action="showDetailByStatus" params='[username:"${username }",status:"${status-1 }"]'>上一个</g:link>
  		<g:link action="showDetailByStatus" params='[username:"${username }",status:"${status+1 }"]'>下一个</g:link>
  	</g:if>
  	<g:if test="${total!=1&&status==(total-1) }">
  		<g:link action="showDetailByStatus" params='[username:"${username }",status:"${status-1 }"]'>上一个</g:link>
  	</g:if>
  	<g:link controller="showResult" action="index" params='[username:"${username }"]'>返回列表</g:link>
  </div>
</body>
</html>
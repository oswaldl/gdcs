<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Insert title here</title>
<ckeditor:resources/>
</head>
<body>
  <div class="body">
  	<form action="saveDesc">
  	<input type="hidden" name="illnessId" value="${illness?.id }">
  	<input type="hidden" name="username" value="${username }">
  	<ckeditor:editor name="description" height="400px" width="100%">
		${illness?.description }
	</ckeditor:editor>
	<input type="submit" value="提交"/>
	</form>
  </div>
</body>
</html>
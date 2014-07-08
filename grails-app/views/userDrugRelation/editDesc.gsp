<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>基因检测报告</title>
<ckeditor:resources/>
</head>
<body>
  <div class="body">
  	<form action="saveDesc">
  	<input type="hidden" name="userDrugRelationId" value="${userDrugRelation?.id }">
  	<input type="hidden" name="type" value="${type }">
  	<ckeditor:editor name="description" height="400px" width="100%">
		${description }
	</ckeditor:editor>
	<input type="submit" value="提交"/>
	</form>
  </div>
</body>
</html>
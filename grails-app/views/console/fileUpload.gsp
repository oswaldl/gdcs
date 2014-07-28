<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>基因检测项目</title>
</head>
<body>
   <g:uploadForm action="upload" controller="console" >
     	 文件:<input type="file" name="myFile" id="myFile"/>
       <g:submitButton name="submit" value="开始上传"/>
	</g:uploadForm>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%--<meta name="layout" content="main"/>--%>
<title>show</title>
<ckeditor:resources/>
</head>
<body>
  <div class="body">
  	<table width="100%">
  		<tr>
  			<th colspan="2">${user?.username } 基因检测报告</th>
  		</tr>
  		<g:each in="${illnesses }" var="illness">
  			<tr>
  				<th>${illness.name }</th>
  				<th>${illness.description }</th>
  			</tr>
  			<g:each in="${map.get(illness) }" var="gene">
  				<tr>
  					<td>${gene.name }</td>
  					<td>${gene.description1 } ${gene.description2 }</td>
  				</tr>
  			</g:each>
  		</g:each>
  	</table>
  </div>
  <div>
	<form action="testData">
  	<ckeditor:editor name="myeditor" height="400px" width="80%">
		${initialValue }
	</ckeditor:editor>
	<input type="submit" value="提交"/>
	</form>
  </div>
</body>
</html>
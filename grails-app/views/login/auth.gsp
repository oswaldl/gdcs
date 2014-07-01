<html>
<head>
	<title><g:message code="springSecurity.login.title"/></title>
	<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'css.css')}">
	<r:external uri="/js/jquery-1.4.2.min.js" />
	<script type="text/javascript">
		$(function(){
			var heights = $(window).height(); 
			$(".bg1").height(heights/2)
		})
	</script>
	
</head>

<body>

<div class="bg1" style="widht:100%;">
	<div class="login">
        <div class="logo"><img src="../images/LOGO.png" width="243" height="166" /></div>
        <form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
        <div class="box">
        	<ul>
            	<li><input type='text' class=inputs name='j_username' id='username' placeholder="请输入用户名"/></li>
                <li><input type='password' class='inputs' name='j_password' id='password' placeholder="请输入密码"/></li>
                <li style="padding-bottom:15px;"><input class="buttons" type='submit' id="submit" value='登录'/></li>
                <li style="color:#999999;">
                	<g:if test='${flash.message}'>
						<div style="color: red;">${flash.message}</div>
					</g:if>
                </li>
                <li style="color:#999999;">
                	<p class="s1">
                	<input type='checkbox' style='vertical-align:middle;' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/> 
                	记住账号密码</p>
                    <p class="s2"><a href="#">免费注册新用户</a></p>
                </li>
            </ul>
        </div>
        </form>
    </div>
</div>
</body>
</html>

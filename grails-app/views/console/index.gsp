<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%--<meta name="layout" content="main"/>--%>
<title>Insert title here</title>
<link href="css/common_2.css" rel="stylesheet" type="text/css">
<script src="js/jquery-1.10.2.js"></script>
<script src="js/common_2.js"></script>
</head>
<body>
  <div class="wrapper">
	<!-- top -->
  	<div class="sys_top">
    	<div class="sys_top_menu">
        	<div class="menu_left">
            	欢迎您 <strong>admin</strong> 今天是2013年10月10日 星期四<span class="white"> | </span><a href="javascript:HC.logout();">注销登录</a>
            </div>
            <div class="menu_right">
            	 
	            <a href="index_2.html">后台首页</a><span class="white"> | </span><a href="../index.html">前台首页</a>
            </div>
        </div>
    	<div class="sys_top_banner">
    		<div class="menu_right">
	        	<input class="search" type="text" placeholder="输入关键字回车搜索" value="" />
	        </div> 
            <div class="sys_logo">基因检测报告系统 后台管理</div>
        </div>
    </div>
   	<!-- content -->
    <div class="sys_content">
    	<div class="content_menu">
        	<div class="menu_title">导航菜单 <span class="cosp">展开全部</span></div>
        	<ul class="menu_inner">
<%--            	<li>--%>
<%--                	<a href="${createLink(controller:'user',action:'list')}" target="main_frame">用户管理</a>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                	<a href="${createLink(controller:'illnessCat',action:'list')}" target="main_frame">病例分类配置</a>--%>
<%--                </li>--%>
                <li>
                	<a href="${createLink(controller:'illness',action:'list')}" target="main_frame">病例说明配置</a>
                </li>
<%--                <li>--%>
<%--                	<a href="${createLink(controller:'illnessCat',action:'list')}" target="main_frame">风险划分</a>--%>
<%--                </li>--%>
           	</ul>
        </div>
        <div class="content_main">
        	<div class="main_inner">
	        	<iframe class="main_iframe" id="main_frame" name="main_frame" frameborder="0"></iframe>
            </div>
        </div>
    </div>
    <!-- bottom -->
  	<div class="sys_bottom">
    	<div class="bottom_copyright">版权所有&nbsp;&copy;&nbsp;2014&nbsp;深圳市中易科技有限公司</div>
        <div class="bottom_version">当前版本 1.0</div>
    </div>
</div>
<script>
HC.initMenu();
HC.initCosp();
</script>

</body>
</html>
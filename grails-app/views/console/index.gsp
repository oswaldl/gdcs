<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%--<meta name="layout" content="main"/>--%>
<title>基因检测报告</title>
<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'style.css')}" />
<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'common_2.css')}" />
<r:external uri="/js/jquery-1.10.2.js" />
<r:external uri="/js/common_2.js" />
</head>
<body>
  <div class="wrapper">
	<!-- top -->
  	<div class="sys_top">
    	<div class="sys_top_menu">
        	<div class="menu_left">
            	欢迎您 <strong>admin</strong> 今天是2014年7月10日 星期四<span class="white"> | </span><g:link controller="logout">[注销]</g:link>
            </div>
<%--            <div class="menu_right">--%>
<%--	            <a href="index_2.html">后台首页</a><span class="white"> | </span><a href="../index.html">前台首页</a>--%>
<%--            </div>--%>
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
            	<li>
                	<a href="${createLink(controller:'user',action:'index')}" target="main_frame">用户管理</a>
                </li>
                <li>
                	<a href="${createLink(controller:'console',action:'fileUpload')}" target="main_frame">上传须爬取人员网页</a>
                </li>
                <li>
                	<a href="${createLink(controller:'showResult',action:'getUserData')}" target="main_frame">添加新爬取人员</a>
                </li>
                <li>
                	<a href="${createLink(controller:'illnessCat',action:'list')}" target="main_frame">病例分类配置</a>
                </li>
                <li>
                	<a href="${createLink(controller:'illness',action:'list')}" target="main_frame">病例详细配置</a>
                </li>
                <li>
                	<a href="${createLink(controller:'riskRank',action:'index')}" target="main_frame">风险划分</a>
                </li>
                <li>
                	<a href="${createLink(controller:'inheritedConditions',action:'index')}" target="main_frame">人员生命谱配置</a>
                </li>
                <li>
                	<a href="${createLink(controller:'drugResponse',action:'index')}" target="main_frame">药品谱公有配置</a>
                </li>
<%--                <li>--%>
<%--                	<a href="${createLink(controller:'userDrugRelation',action:'index')}" target="main_frame">人员药品谱配置</a>--%>
<%--                </li>--%>
                <li>
                	<a href="${createLink(controller:'triats',action:'index')}" target="main_frame">个性谱公有配置</a>
                </li>
<%--                <li>--%>
<%--                	<a href="${createLink(controller:'userTriats',action:'index')}" target="main_frame">人员个性谱配置</a>--%>
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
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="layout" content="main"/>
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
            	<li>
                	<a class="active" href="javascript:;">系统首页</a>
                    <ul class="menu_child_1 show">
                        <li><a class="active" href="welcome.html" target="main_frame">系统后台首页</a></li>
                    </ul>
                </li>
                <li>
                	<a href="javascript:;">系统配置</a>
                    <ul class="menu_child_1"><li>
                    	<li><a href="page/systemconfig/productLine/list.html" target="main_frame">产品线名称</a></li>
                    	<li><a href="page/systemconfig/roleDef/roleDefList.html" target="main_frame">角色定义</a></li>
                    	<li><a href="page/systemconfig/auditGroupDef/auditGroupDefList.html" target="main_frame">评审组定义</a></li>
                    	<li><a href="page/systemconfig/areaDef/areaDefList.html" target="main_frame">片区定义</a></li>
                    </ul>
                    
                </li>
 				<li>
        	        <a href="javascript:;">用户管理</a>
                    <ul class="menu_child_1">
                    	<li><a href="page/users/dept/list.html" target="main_frame">部门列表</a></li>
                        <li><a href="page/users/user/list.html" target="main_frame">用户列表</a></li>
                    </ul>                   
                </li>
                <li>
                	<a href="javascript:;">产品线配置</a>
                    <ul class="menu_child_1">
                    	<li><a href="page/productLineConfig/ProductTypeConfig/list.html" target="main_frame">产品分类</a></li>
                    	<li><a href="page/productLineConfig/ProductSeriesConfig/list.html" target="main_frame">产品系列</a></li>
                        <li><a href="page/productLineConfig/productAuditGroupConfig/list.html" target="main_frame">产品线评审组配置</a></li>
                        <li><a href="page/productLineConfig/productRoleConfig/list.html" target="main_frame">产品线角色配置</a></li>
                        <li><a href="page/productLineConfig/fileAuditPath/list.html" target="main_frame">文档评审路径配置</a></li>
                    </ul>
                </li>
                <li>
    	            <a href="javascript:;">产品数据管理</a>
                    <ul class="menu_child_1">
                        <li>
                        	<a href="javascript:;" target="main_frame">产品信息</a>
                            <ul class="menu_child_2">
                                <li><a href="page/productDataConfig/fileCategoryConfig/list.html" target="main_frame">产品资料类型配置</a></li>
                            </ul> 
                        </li>
                        <li>
                        	<a href="javascript:;" target="main_frame">解决方案</a>
                            <ul class="menu_child_2">
                                <li><a href="page/productDataConfig/industryConfig/list.html" target="main_frame">行业分类</a></li>
                                <li><a href="page/productDataConfig/solutionTypeConfig/list.html" target="main_frame">方案类型</a></li>
                            </ul> 
                        </li>
                        <li><a href="javascript:;" target="main_frame">竞争分析</a></li>
                    </ul>                
                </li>
                <li>
	                <a href="javascript:;">流程配置</a>
                    <ul class="menu_child_1">
                        <li>
                        	<a href="javascript:;" target="main_frame">发布流程</a>
                            <ul class="menu_child_2">
                                <li>
                                	<a href="page/workflowConfig/publishConfig/publishFileType/list.html" target="main_frame">发布类型</a>
                                </li>
                                <li>
                                	<a href="page/workflowConfig/publishConfig/stage/list.html" target="main_frame">阶段配置</a>
                                </li>
                            </ul> 
                        </li>
                        <li><a href="javascript:alert('未实现');" target="main_frame">试机流程</a></li>
                        <li><a href="javascript:alert('未实现');" target="main_frame">规划流程</a></li>
                        <li><a href="javascript:alert('待扩展，未实现');" target="main_frame">子流程</a></li>
                    </ul>
                </li>
                
               
                <li>
            	    <a href="javascript:;">权限配置</a>
                    <ul class="menu_child_1">
                        <li><a href="page/roles/adminConfig/系统管理员列表.html" target="main_frame">系统管理员配置</a></li>
                        <!-- 
                        <li><a href="page/roles/productAdminConfig/产品线管理员列表.html" target="main_frame">产品线管理员配置</a></li>
                         -->
                        <li><a href="page/roles/accessConfig/index.html" target="main_frame">访问权限控制</a></li>
                    </ul>             
                </li>
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
    	<div class="bottom_copyright">版权所有&nbsp;&copy;&nbsp;2013&nbsp;深圳市汇川技术股份有限公司</div>
        <div class="bottom_version">当前版本 1.0</div>
    </div>
</div>
<script>
HC.initMenu();
HC.initCosp();
</script>

</body>
</html>
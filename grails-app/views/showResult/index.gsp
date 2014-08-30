<%@page import="com.zy.vo.UserDrugRelation" %>
<%@page import="com.zy.vo.UserTriats" %>

    <%@ page contentType="text/html;charset=UTF-8" %>
        <html> 

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>基因检测报告</title>
            <link rel="stylesheet" type="text/css" media="screen" href="${resource(dir: 'css', file: 'css.css')}" />
			<link rel="stylesheet" type="text/css" media="print" href="${resource(dir: 'css', file: 'print.css')}" />
            <r:external uri="/js/jquery-1.4.2.min.js" />
            <script type="text/javascript">
                $(function() {
                    $(".listBox li").hover(function() {
                        $(this).addClass("cur")
                    }, function() {
                        $(".listBox li").removeClass("cur")
                    })
                })
                
            </script>
        </head>

        <body>
            <div class="header">
                <div class="lefts">
                    <g:img dir="images" file="logo2.jpg" width="457" height="134" />
                </div>
                <div class="rights">
                    <p><span>${username }</span>
                        <g:link controller="logout">[注销]</g:link>
                        <g:if test="${currenUser.isAdmin && !inPDF }">
                            <g:link controller="console" action="index">[进入后台]</g:link>
                        </g:if>
                    </p>
                    <p>欢迎进入基因检测报告！</p>
                    <div class="pdf_div_hidden">
                        <p>
                            <g:form url="[action:'searchData',controller:'showResult']">
                                <input type="hidden" name="username" value="${username }" />
                                <input name="searchString" id="search" placeholder="请输入病例名" />
                            </g:form>
                        </p>
                    </div>
                </div>

            </div>
            <div class="main">
				  <div style=" background:url(../images/mulu_bg2.jpg) repeat-y; overflow:hidden; zoom:1;">
				    <div class="titles">
				      <p style="background-color:#fff;">目录</p>
				    </div>
				    <div class="lists">
				      <div class="listBox">
				        <h5 class="titl1 jt01" onclick="$(this).next().toggle()">第一部分<span>疾病风险评估</span></h5>
				        <ul style="display:block;">
				          <li>
				            <div class="paddingLR"><g:link controller="illness" action="showHighAll" params='[username:"${username }"]'>较高风险疾病汇总</g:link></div>
				          </li>
				          <li>
				            <div class="paddingLR"><g:link controller="illness" action="showLowAll" params='[username:"${username }"]'>较低风险疾病汇总</g:link></div>
				          </li>
				          <li>
				            <div class="paddingLR"><g:link controller="illness" action="showNormalAll" params='[username:"${username }"]'>一般风险疾病汇总</g:link></div>
				          </li>
				          <g:each in="${illnesses }" var="illness" status="i">
                                <li>
                                    <div class="paddingLR">
                                        <g:link controller="illness" action="showDetail" params='[illnessId:"${illness.id }",status:"${i }",username:"${username }"]'>
                                            ${illness.chineseName?:illness.name }
                                        </g:link>
                                    </div>
                                </li>
                            </g:each>
				        </ul>
				      </div>
				      <div class="listBox">
				        <h5 class="titl2 jt02" onclick="$(this).next().toggle()">第二部分<span>先天性遗传疾病</span></h5>
				        <ul style="display:block;">
				          <!--默认需隐藏display:block;-->
				          <g:if test="${inheritedConditionses}">
					          <div class="tit">
					            <div class="s1">名称</div>
					            <div class="s2"><span class="paddingT10"></span>研究数量</div>
					            <div class="s3">状态</div>
					          </div>
				          
				          
					          <g:each in="${inheritedConditionses }" var="inheritedConditions">
	                                <li>
	                                    <div class="s1">${inheritedConditions.name }</div>
	                                    <div class="s2">
	                                    	<div class="tubiao">
	                                    		<div class="ico"></div>
		                                        <g:each in="${(1..inheritedConditions.magnitude ) }">
		                                            <g:img dir="images" file="ico1.gif" />
		                                        </g:each>
	                                        </div>
	                                    </div>
	                                    <div class="s3">${inheritedConditions.result }</div>
	                                </li>
	                            </g:each>
                            </g:if>
				        </ul>
				      </div>
				      <div class="listBox">
				        <h5 class="titl3 jt02" onclick="$(this).next().toggle()">第三部分<span>个体化用药指导</span></h5>
				        <ul>
				          
				          <g:if test="${drugResponses}">
					          <div class="tit">
					            <div class="s1">名称</div>
					            <div class="s2"><span class="paddingT10"></span>研究数量</div>
					            <div class="s3">状态</div>
					          </div>
					          <g:each in="${drugResponses }" var="drugResponse" status="i">
	                                <li>
	                                    <div class="s1">
	                                        <g:link controller="userDrugRelation" action="showDetail" params='[drugResponseId:"${drugResponse.id }",status:"${i }",username:"${username }"]'>
	                                            ${drugResponse.chineseName?:drugResponse.name }
	                                        </g:link>
	                                    </div>
	                                    <div class="s2">
	                                    	<div class="tubiao">
		                                    	<g:each in="${(1..drugResponse.magnitude ) }">
		                                    		<div class="ico"></div>
		                                            <g:img dir="images" file="ico1.gif" />
		                                        </g:each>
	                                    	</div>
	                                    </div>
	                                    <div class="s3">${UserDrugRelation.findByDrugResponseAndUsername(drugResponse, username).getState() }</div>
	                                </li>
	                            </g:each>
                            </g:if>
				        </ul>
				      </div>
				      <br></br>
				      <br></br>
				      <div class="listBox">
				        <h5 class="titl4 jt02" onclick="$(this).next().toggle()">第四部分<span>遗传性状分析</span></h5>
				        <ul>
				          <g:if test="${userTriats}">
					          <div class="tit">
					            <div class="s1">名称</div>
					            <div class="s2"><span class="paddingT10"></span>信心</div>
					            <div class="s3">结果</div>
					          </div>
					          <g:each in="${userTriats }" var="triat" status="i">
	                                <li>
	                                    <div class="s1">
	                                        <g:link controller="userTriats" action="showDetail" params='[triatId:"${triat.id }",status:"${i }",username:"${username }"]'>
	                                            ${triat.chineseName?:triat.name }
	                                        </g:link>
	                                    </div>
	                                    <div class="s2">
	                                    	<div class="tubiao">
		                                    	<g:each in="${(1..triat.magnitude ) }">
		                                    		<div class="ico"></div>
		                                            <g:img dir="images" file="ico1.gif" />
		                                        </g:each>
	                                    	</div>
	                                    </div>
	                                    <div class="s3">${UserTriats.findByTriatsAndUsername(triat, username)?.result }</div>
	                                </li>
	                            </g:each>
                            </g:if>
				        </ul>
				      </div>
				      
				    </div>
				  </div>
            </div><!-- end main -->
        </body>

        </html>
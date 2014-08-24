<%@page import="com.zy.vo.UserDrugRelation" %>
    <%@ page contentType="text/html;charset=UTF-8" %>
        <html> 

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>基因检测报告</title>
            <link rel="stylesheet" type="text/css" media="all" href="${resource(dir: 'css', file: 'css.css')}" />
            <r:external uri="/js/jquery-1.4.2.min.js" />
            <style type="text/css">
                body {
                    font-family: SimSun;
                }
                @media print {
                    body {
                        page-break-after: always;
                        background-color: lightblue;
                    }
                    .div_hidden {
                        display: none;
                    }
                }
            </style>
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
        
        
        
        <!-- start 目录 -->
            <div class="header">
                <div class="lefts">
                    <g:img dir="images" file="logo2.jpg" width="457" height="134" />
                </div>
                <div class="rights">
                    <p><span>${username }</span>
                        <g:link controller="logout">[注销]</g:link>
                        <g:if test="${currenUser.isAdmin }">
                            <g:link controller="console" action="index">[进入后台]</g:link>
                        </g:if>
                    </p>
                    <p>欢迎进入基因检测报告！</p>
                    <div class="div_hidden">
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
				            <div class="s1"><g:link controller="illness" action="showHighAll" params='[username:"${username }"]'>较高风险疾病汇总</g:link></div>
				          </li>
				          <li>
				            <div class="s1"><g:link controller="illness" action="showLowAll" params='[username:"${username }"]'>较低风险疾病汇总</g:link></div>
				          </li>
				          <li>
				            <div class="s1"><g:link controller="illness" action="showNormalAll" params='[username:"${username }"]'>一般风险疾病汇总</g:link></div>
				          </li>
				          <g:each in="${illnesses }" var="illness" status="i">
                                <li>
                                    <div class="s1">
                                        <g:link controller="illness" action="showDetail" params='[illnessId:"${illness.id }",status:"${i }",username:"${username }"]'>
                                            ${illness.chineseName?:illness.name }
                                        </g:link>
                                    </div>
                                </li>
                            </g:each>
				        </ul>
				      </div>
				      <div class="listBox">
				        <h5 class="titl2 jt02">第二部分<span>先天性遗传疾病</span></h5>
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
				        <h5 class="titl3 jt02">第三部分<span>个体化用药指导</span></h5>
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
	                                    	<div class=" tubiao">
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
				    </div>
				  </div>
            </div><!-- end main -->
            <!-- end 目录 -->
            
            <!-- start 高风险 -->
	<div class="main A1">
		<div class="pic"></div>
		<div class="tit2">
			<h3>较高风险</h3>
		</div>
		<div class="content">
			<table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#f4f4f4" style="font-size:22px;" >
				<tr>
					<th width="432" height="50" align="center" valign="middle" bgcolor="#eeefef" style="font-weight:normal;">名称</th>
					<th width="172" align="center" valign="middle" bgcolor="#dcdddd" style="font-weight:normal;">研究数量</th>
					<th width="140" align="center" valign="middle" bgcolor="#eeefef" style="font-weight:normal;">你的风险</th>
					<th width="140" align="center" valign="middle" bgcolor="#eeefef" style="font-weight:normal;">平均风险</th>
					<th width="110" align="center" valign="middle" bgcolor="#dcdddd" style="font-weight:normal;">与平均对比</th>
				</tr>

<g:each in="${illnesses }" var="illness" status="i">
        <tr>
          <td align="left" valign="middle" bgcolor="#eeefef" class="paddingT102 ">
			  <g:link controller="illness" action="showIllness" params='[illnessId:"${illness.id }",username:"${username }"]'>
			  		<g:if test="${illness.chineseName}">
			  			${illness.chineseName }
			  		</g:if>
			  		<g:else>
						${illness.name }
					</g:else>
			  </g:link>
		  </td>
		  
		  <!-- 研究数量 -->
          <td align="center" valign="middle" bgcolor="#dcdddd" class="paddingT10">
			<div class="tubiao">
				<g:if test="${illness.getMagnitude()==0}">
					<g:each in="${(0..4 ) }">
						<div class="ico"></div>
			  		</g:each>
				</g:if>
				<g:else>
					<g:each in="${(0..illness.getMagnitude() ) }">
						<div class="ico"></div>
			  		</g:each>
				</g:else>
			  
            </div>
		  </td>
		  
		  <!-- 你的风险 -->
          <td align="center" valign="middle" bgcolor="#eeefef" class="paddingT10">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<td align="center" valign="middle" class="tubiao">
						<div class="tubiao">
							<g:if test="${map.get(illness)<1||map.get(illness)>4}">
								<g:each in="${0..4 }">
									<div class="ico1b"></div>
								</g:each>
		                	</g:if>
		                	<g:else>
								<g:each in="${0..((int)Math.ceil(map.get(illness)*100/20))}">
										<div class="ico1a"></div>
								</g:each>
								<g:each in="${((int)Math.ceil(map.get(illness)*100/20))..4}">
										<div class="ico1b"></div>
								</g:each>
							</g:else>
						</div>
						
				  </tr>
				  <tr>
					<td align="center" valign="middle">${map.get(illness)*100 }%</td>
				  </tr>
            </table>
		  </td>
		  
		  <!-- 平均风险 -->
          <td align="center" valign="middle" bgcolor="#eeefef" class="paddingT10">
		     <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <div class="tubiao">
                	<g:if test="${illness.getRisk()<1||illness.getRisk()>4}">
						<g:each in="${0..4 }">
							<div class="ico1b"></div>
						</g:each>
                	</g:if>
                	<g:else>
	                	<g:each in="${(0..(int)Math.ceil(illness.getRisk()*100/20) ) }">
							<div class="ico1a"></div>
						</g:each>
						<g:each in="${(((int)Math.ceil(illness.getRisk()*100/20))..4 ) }">
							<div class="ico1b"></div>
						</g:each>
                	</g:else>
                </div>
              </tr>
              <tr>
                <td align="center" valign="middle">${illness.getRisk()*100 }%</td>
              </tr>
            </table>
		  </td>
          <td align="center" valign="middle" bgcolor="#dcdddd" class="paddingT10">${(double)Math.round(map.get(illness)/illness.getRisk()*100)/100 }倍</td>
        </tr>
</g:each>

			</table>
		</div>
		<div class="pageBox">
			<g:link class="s1" controller="showResult" action="index" params='[username:"${username }"]'>返回列表</g:link>
		</div>
	</div>
            <!-- end   高风险-->
            
            <!-- start 低风险 -->
	<div class="main A1">
		<div class="tit2">
			<h3>较低风险</h3>
		</div>
		<div class="content">
			<table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#f4f4f4" style="font-size:22px;" >
				<tr>
					<th width="432" height="50" align="center" valign="middle" bgcolor="#eeefef" style="font-weight:normal;">名称</th>
					<th width="172" align="center" valign="middle" bgcolor="#dcdddd" style="font-weight:normal;">研究数量</th>
					<th width="140" align="center" valign="middle" bgcolor="#eeefef" style="font-weight:normal;">你的风险</th>
					<th width="140" align="center" valign="middle" bgcolor="#eeefef" style="font-weight:normal;">平均风险</th>
					<th width="110" align="center" valign="middle" bgcolor="#dcdddd" style="font-weight:normal;">与平均对比</th>
				</tr>

<g:each in="${illnesses }" var="illness" status="i">
        <tr>
          <td align="left" valign="middle" bgcolor="#eeefef" class="paddingT102 ">
			  <g:link controller="illness" action="showIllness" params='[illnessId:"${illness.id }",username:"${username }"]'>
			  		<g:if test="${illness.chineseName}">
			  			${illness.chineseName }
			  		</g:if>
			  		<g:else>
						${illness.name }
					</g:else>
			  </g:link>
		  </td>
		  
		  <!-- 研究数量 -->
          <td align="center" valign="middle" bgcolor="#dcdddd" class="paddingT10">
			<div class="tubiao">
				<g:if test="${illness.getMagnitude()==0}">
					<g:each in="${(0..4 ) }">
						<div class="ico"></div>
			  		</g:each>
				</g:if>
				<g:else>
					<g:each in="${(0..illness.getMagnitude() ) }">
						<div class="ico"></div>
			  		</g:each>
				</g:else>
			  
            </div>
		  </td>
		  
		  <!-- 你的风险 -->
          <td align="center" valign="middle" bgcolor="#eeefef" class="paddingT10">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<td align="center" valign="middle" class="tubiao">
						<div class="tubiao">
							<g:if test="${map.get(illness)<1||map.get(illness)>4}">
								<g:each in="${0..4 }">
									<div class="ico1b"></div>
								</g:each>
		                	</g:if>
		                	<g:else>
								<g:each in="${0..((int)Math.ceil(map.get(illness)*100/20))}">
										<div class="ico1a"></div>
								</g:each>
								<g:each in="${((int)Math.ceil(map.get(illness)*100/20))..4}">
										<div class="ico1b"></div>
								</g:each>
							</g:else>
						</div>
						
				  </tr>
				  <tr>
					<td align="center" valign="middle">${map.get(illness)*100 }%</td>
				  </tr>
            </table>
		  </td>
		  
		  <!-- 平均风险 -->
          <td align="center" valign="middle" bgcolor="#eeefef" class="paddingT10">
		     <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <div class="tubiao">
                	<g:if test="${illness.getRisk()<1||illness.getRisk()>4}">
						<g:each in="${0..4 }">
							<div class="ico1b"></div>
						</g:each>
                	</g:if>
                	<g:else>
	                	<g:each in="${(0..(int)Math.ceil(illness.getRisk()*100/20) ) }">
							<div class="ico1a"></div>
						</g:each>
						<g:each in="${(((int)Math.ceil(illness.getRisk()*100/20))..4 ) }">
							<div class="ico1b"></div>
						</g:each>
                	</g:else>
                </div>
              </tr>
              <tr>
                <td align="center" valign="middle">${illness.getRisk()*100 }%</td>
              </tr>
            </table>
		  </td>
          <td align="center" valign="middle" bgcolor="#dcdddd" class="paddingT10">${(double)Math.round(map.get(illness)/illness.getRisk()*100)/100 }倍</td>
        </tr>
</g:each>

			</table>
		</div>
		<div class="pageBox">
			<g:link class="s1" controller="showResult" action="index" params='[username:"${username }"]'>返回列表</g:link>
		</div>
	</div>
            <!-- end   低风险 -->
            
            <!-- start 一般风险 -->
	<div class="main A1">
		<div class="tit2">
			<h3>一般风险</h3>
		</div>
		<div class="content">
			<table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#f4f4f4" style="font-size:22px;" >
				<tr>
					<th width="432" height="50" align="center" valign="middle" bgcolor="#eeefef" style="font-weight:normal;">名称</th>
					<th width="172" align="center" valign="middle" bgcolor="#dcdddd" style="font-weight:normal;">研究数量</th>
					<th width="140" align="center" valign="middle" bgcolor="#eeefef" style="font-weight:normal;">你的风险</th>
					<th width="140" align="center" valign="middle" bgcolor="#eeefef" style="font-weight:normal;">平均风险</th>
					<th width="110" align="center" valign="middle" bgcolor="#dcdddd" style="font-weight:normal;">与平均对比</th>
				</tr>

<g:each in="${illnesses }" var="illness" status="i">
        <tr>
          <td align="left" valign="middle" bgcolor="#eeefef" class="paddingT102 ">
			  <g:link controller="illness" action="showIllness" params='[illnessId:"${illness.id }",username:"${username }"]'>
			  		<g:if test="${illness.chineseName}">
			  			${illness.chineseName }
			  		</g:if>
			  		<g:else>
						${illness.name }
					</g:else>
			  </g:link>
		  </td>
		  
		  <!-- 研究数量 -->
          <td align="center" valign="middle" bgcolor="#dcdddd" class="paddingT10">
			<div class="tubiao">
				<g:if test="${illness.getMagnitude()==0}">
					<g:each in="${(0..4 ) }">
						<div class="ico"></div>
			  		</g:each>
				</g:if>
				<g:else>
					<g:each in="${(0..illness.getMagnitude() ) }">
						<div class="ico"></div>
			  		</g:each>
				</g:else>
			  
            </div>
		  </td>
		  
		  <!-- 你的风险 -->
          <td align="center" valign="middle" bgcolor="#eeefef" class="paddingT10">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<td align="center" valign="middle" class="tubiao">
						<div class="tubiao">
							<g:if test="${map.get(illness)<1||map.get(illness)>4}">
								<g:each in="${0..4 }">
									<div class="ico1b"></div>
								</g:each>
		                	</g:if>
		                	<g:else>
								<g:each in="${0..((int)Math.ceil(map.get(illness)*100/20))}">
										<div class="ico1a"></div>
								</g:each>
								<g:each in="${((int)Math.ceil(map.get(illness)*100/20))..4}">
										<div class="ico1b"></div>
								</g:each>
							</g:else>
						</div>
						
				  </tr>
				  <tr>
					<td align="center" valign="middle">${map.get(illness)*100 }%</td>
				  </tr>
            </table>
		  </td>
		  
		  <!-- 平均风险 -->
          <td align="center" valign="middle" bgcolor="#eeefef" class="paddingT10">
		     <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <div class="tubiao">
                	<g:if test="${illness.getRisk()<1||illness.getRisk()>4}">
						<g:each in="${0..4 }">
							<div class="ico1b"></div>
						</g:each>
                	</g:if>
                	<g:else>
	                	<g:each in="${(0..(int)Math.ceil(illness.getRisk()*100/20) ) }">
							<div class="ico1a"></div>
						</g:each>
						<g:each in="${(((int)Math.ceil(illness.getRisk()*100/20))..4 ) }">
							<div class="ico1b"></div>
						</g:each>
                	</g:else>
                </div>
              </tr>
              <tr>
                <td align="center" valign="middle">${illness.getRisk()*100 }%</td>
              </tr>
            </table>
		  </td>
          <td align="center" valign="middle" bgcolor="#dcdddd" class="paddingT10">${(double)Math.round(map.get(illness)/illness.getRisk()*100)/100 }倍</td>
        </tr>
</g:each>

			</table>
		</div>
		<div class="pageBox">
			<g:link class="s1" controller="showResult" action="index" params='[username:"${username }"]'>返回列表</g:link>
		</div>
	</div>
            <!-- end   一般风险 -->
            
            
            <!-- start 健康谱1 -->
            
            
            <!-- end   健康谱1 -->
            
            <!-- start 生命谱2 -->
            
            <!-- end   生命谱2 -->
            
            <!-- start 药物谱3 -->
            
            <!-- end   药物谱3 -->
            
            <!-- start 个性谱4 -->
            
            <!-- end   个性谱4 -->
            

            
            
            
            
            
            
            
            
        </body>

        </html>
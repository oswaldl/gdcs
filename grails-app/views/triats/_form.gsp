<%@ page import="com.zy.vo.Triats" %>

<table>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: triatsInstance, field: 'name', 'error')} ">名称</td>
    <td><g:textField name="name" value="${triatsInstance?.name}"/></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: triatsInstance, field: 'chineseName', 'error')} ">中文名称</td>
    <td><g:textField name="chineseName" value="${triatsInstance?.chineseName}"/></td>
  </tr>
  <tr>
  	<td class="fieldcontain ${hasErrors(bean: triatsInstance, field: 'magnitude', 'error')}">信心</td>
  	<td><g:field name="magnitude" type="number" value="${triatsInstance.magnitude}" required=""/></td>
  </tr>
  <tr>
  	<td class="fieldcontain ${hasErrors(bean: triatsInstance, field: 'result', 'error')} ">结果（应该是根据某一基因自动生成）</td>
  	<td><g:textField name="result" value="${triatsInstance?.result}"/></td>
  </tr>
  <tr>
  	<td class="fieldcontain ${hasErrors(bean: triatsInstance, field: 'introduction', 'error')} ">前言</td>
  	<td><g:textArea name="introduction" cols="40" rows="5" maxlength="3000" value="${triatsInstance?.introduction}"/></td>
  </tr>
  <tr>
  	<td class="fieldcontain ${hasErrors(bean: triatsInstance, field: 'genetics', 'error')} ">遗传和环境因素</td>
  	<td><g:textArea name="genetics" cols="40" rows="5" maxlength="3000" value="${triatsInstance?.genetics}"/></td>
  </tr>
  <tr>
  	<td class="fieldcontain ${hasErrors(bean: triatsInstance, field: 'biology', 'error')} ">生物学作用</td>
  	<td><g:textArea name="biology" cols="40" rows="5" maxlength="3000" value="${triatsInstance?.biology}"/></td>
  </tr>
  <tr>
  	<td class="fieldcontain ${hasErrors(bean: triatsInstance, field: 'findings', 'error')} ">主要发现</td>
  	<td><g:textArea name="findings" cols="40" rows="5" maxlength="3000" value="${triatsInstance?.findings}"/></td>
  </tr>
  <tr>
  	<td class="fieldcontain ${hasErrors(bean: triatsInstance, field: 'geneAbstract', 'error')} ">基因摘要</td>
  	<td>
  	
  	<g:link controller="geneAbstract" action="edit3" params='[triatsInstanceId:"${triatsInstance?.id }"]'>添加</g:link>
  	<br>
  	<g:each in="${triatsInstance?.geneAbstract}" status="i" var="geneAbstractInstance">
  		${geneAbstractInstance?.name }<g:link controller="geneAbstract" action="edit2" params='[triatsInstanceId:"${triatsInstance?.id }",geneAbstractInstanceId:"${geneAbstractInstance?.id }"]'>编辑</g:link>
  	</g:each>
  	
  	
  	</td>
  </tr>
</table>

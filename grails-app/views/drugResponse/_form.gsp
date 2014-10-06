<%@ page import="com.zy.vo.DrugResponse" %>

<table>
<%--  <tr>--%>
<%--    <td>基因/SNP摘要</td>--%>
<%--    <td><g:link controller="geneAbstract" action="edit" params='[drugResponseId:"${drugResponseInstance?.id }"]'>编辑</g:link></td>--%>
<%--  </tr>--%>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: drugResponseInstance, field: 'chineseName', 'error')} ">中文名</td>
    <td><g:textField name="chineseName" value="${drugResponseInstance?.chineseName}"/></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: drugResponseInstance, field: 'name', 'error')} required">英文名</td>
    <td><g:textField name="name" required="" value="${drugResponseInstance?.name}"/></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: drugResponseInstance, field: 'magnitude', 'error')} required">研究数量</td>
    <td><g:field name="magnitude" type="number" value="${drugResponseInstance.magnitude}" required=""/></td>
  </tr>
  <tr>
  	<td class="fieldcontain ${hasErrors(bean: drugResponseInstance, field: 'geneData', 'error')} required">基因数据（-:结果1;--:结果2;+:结果3）</td>
  	<td><g:textField name="geneData" value="${drugResponseInstance?.geneData}"/></td>
  </tr>
  <tr>
  	<td class="fieldcontain ${hasErrors(bean: drugResponseInstance, field: 'oddRatio', 'error')} required">技术报告（rs10757278(GG:-,AA:--);）</td>
  	<td><g:textField name="oddRatio" value="${drugResponseInstance?.oddRatio}"/></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: drugResponseInstance, field: 'genetics', 'error')} ">
    	遗传学研究&nbsp;&nbsp;<g:link controller="drugResponse" action="editDesc" params='[drugResponseId:"${drugResponseInstance?.id }",type:"genetics"]'>编辑</g:link>
    </td>
    <td><g:textArea name="genetics" cols="40" rows="5" maxlength="3000" value="${drugResponseInstance?.genetics}"/></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: drugResponseInstance, field: 'reference', 'error')} ">
    	参考文献&nbsp;&nbsp;<g:link controller="drugResponse" action="editDesc" params='[drugResponseId:"${drugResponseInstance?.id }",type:"reference"]'>编辑</g:link>
    </td>
    <td><g:textArea name="reference" cols="40" rows="5" maxlength="3000" value="${drugResponseInstance?.reference}"/></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: drugResponseInstance, field: 'introduction', 'error')} ">
    	引言&nbsp;&nbsp;<g:link controller="drugResponse" action="editDesc" params='[drugResponseId:"${drugResponseInstance?.id }",type:"introduction"]'>编辑</g:link>
    </td>
    <td><g:textArea name="introduction" cols="40" rows="5" maxlength="3000" value="${drugResponseInstance?.introduction}"/></td>
  </tr>
  <tr>
	  <td class="fieldcontain ${hasErrors(bean: drugResponseInstance, field: 'geneAbstract', 'error')} ">基因/SNP摘要</td>
	  <td>
	  	<g:link controller="geneAbstract" action="edit4" params='[drugResponseInstanceId:"${drugResponseInstance?.id }"]'>添加</g:link>
	  	<br>
	  	<g:each in="${drugResponseInstance?.geneAbstract}" status="i" var="geneAbstractInstance">
	  		${geneAbstractInstance?.name }<g:link controller="geneAbstract" action="edit5" params='[drugResponseInstanceId:"${drugResponseInstance?.id }",geneAbstractInstanceId:"${geneAbstractInstance?.id }"]'>编辑</g:link>
	  	</g:each>
	  </td>
  </tr>
</table>


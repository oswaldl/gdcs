<%@ page import="com.zy.vo.Inherited" %>

<table>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: inheritedInstance, field: 'chineseName', 'error')} ">中文名</td>
    <td><g:textField name="chineseName" value="${inheritedInstance?.chineseName}"/></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: inheritedInstance, field: 'name', 'error')} required">英文名</td>
    <td><g:textField name="name" required="" value="${inheritedInstance?.name}"/></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: inheritedInstance, field: 'magnitude', 'error')} required">研究数量</td>
    <td><g:field name="magnitude" type="number" value="${inheritedInstance.magnitude}" required=""/></td>
  </tr>
  <tr>
  	<td class="fieldcontain ${hasErrors(bean: inheritedInstance, field: 'geneData', 'error')} required">基因数据（-:结果1;--:结果2;+:结果3）</td>
  	<td><g:textField name="geneData" value="${inheritedInstance?.geneData}"/></td>
  </tr>
  <tr>
  	<td class="fieldcontain ${hasErrors(bean: inheritedInstance, field: 'oddRatio', 'error')} required">技术报告（rs10757278(GG:-,AA:--);）</td>
  	<td><g:textField name="oddRatio" value="${inheritedInstance?.oddRatio}"/></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: inheritedInstance, field: 'genetics', 'error')} ">遗传学研究</td>
    <td><g:textArea name="genetics" cols="40" rows="5" maxlength="3000" value="${inheritedInstance?.genetics}"/></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: inheritedInstance, field: 'reference', 'error')} ">参考文献</td>
    <td><g:textArea name="reference" cols="40" rows="5" maxlength="3000" value="${inheritedInstance?.reference}"/></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: inheritedInstance, field: 'introduction', 'error')} ">引言</td>
    <td><g:textArea name="introduction" cols="40" rows="5" maxlength="3000" value="${inheritedInstance?.introduction}"/></td>
  </tr>
  <tr>
	  <td class="fieldcontain ${hasErrors(bean: inheritedInstance, field: 'geneAbstract', 'error')} ">基因/SNP摘要</td>
	  <td>
	  	<g:link controller="geneAbstract" action="edit6" params='[inheritedInstanceId:"${inheritedInstance?.id }"]'>添加</g:link>
	  	<br>
	  	<g:each in="${inheritedInstance?.geneAbstract}" status="i" var="geneAbstractInstance">
	  		${geneAbstractInstance?.name }<g:link controller="geneAbstract" action="edit7" params='[inheritedInstanceId:"${inheritedInstance?.id }",geneAbstractInstanceId:"${geneAbstractInstance?.id }"]'>编辑</g:link>
	  	</g:each>
	  </td>
  </tr>
</table>
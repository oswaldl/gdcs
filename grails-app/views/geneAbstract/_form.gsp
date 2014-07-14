<%@ page import="com.zy.vo.GeneAbstract" %>

<table>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: geneAbstractInstance, field: 'name', 'error')} ">名称</td>
    <td><g:textField name="name" value="${geneAbstractInstance?.name}"/></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: geneAbstractInstance, field: 'marker', 'error')} ">标记</td>
    <td><g:textField name="marker" value="${geneAbstractInstance?.marker}"/></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: geneAbstractInstance, field: 'journal', 'error')} ">杂志</td>
    <td><g:textField name="journal" value="${geneAbstractInstance?.journal}"/></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: geneAbstractInstance, field: 'studySize', 'error')} required">研究规模</td>
    <td><g:field name="studySize" type="number" value="${geneAbstractInstance.studySize}" required=""/></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: geneAbstractInstance, field: 'description', 'error')} ">描述</td>
    <td><g:textArea name="description" cols="40" rows="5" maxlength="3000" value="${geneAbstractInstance?.description}"/></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: geneAbstractInstance, field: 'types', 'error')} ">类型及影响</td>
    <td><g:textArea name="types" cols="40" rows="5" maxlength="3000" value="${geneAbstractInstance?.types}"/></td>
  </tr>
</table>


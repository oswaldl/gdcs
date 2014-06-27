<%@ page import="com.zy.vo.Illness" %>

<table>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: illnessInstance, field: 'chineseName', 'error')} ">中文名</td>
    <td><g:textField name="chineseName" value="${illnessInstance?.chineseName}"/></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: illnessInstance, field: 'name', 'error')} required">英文名</td>
    <td><g:textField name="name" required="" value="${illnessInstance?.name}"/></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: illnessInstance, field: 'averageRisk', 'error')} ">平均风险值（将数值化为小数形式）</td>
    <td><g:textField name="averageRisk" value="${illnessInstance?.averageRisk}"/></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: illnessInstance, field: 'illnessCat', 'error')} required">病例分类</td>
    <td><g:select id="illnessCat" name="illnessCat.id" from="${com.zy.vo.IllnessCat.list()}" optionKey="id" required="" value="${illnessInstance?.illnessCat?.id}" class="many-to-one"/></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: illnessInstance, field: 'description', 'error')} ">
    	描述&nbsp;&nbsp;<g:link controller="showResult" action="editDesc" params='[illnessId:"${illnessInstance?.id }",type:"description"]'>编辑</g:link>
    </td>
    <td><g:textArea name="description" cols="40" rows="5" maxlength="3000" value="${illnessInstance?.description}"/></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: illnessInstance, field: 'geneticEnvironment', 'error')} ">
    	遗传与环境&nbsp;&nbsp;<g:link controller="showResult" action="editDesc" params='[illnessId:"${illnessInstance?.id }",type:"geneticEnvironment"]'>编辑</g:link>
    </td>
    <td><g:textArea name="geneticEnvironment" cols="40" rows="5" maxlength="3000" value="${illnessInstance?.geneticEnvironment}"/></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: illnessInstance, field: 'canDo', 'error')} ">
    	你能做什么&nbsp;&nbsp;<g:link controller="showResult" action="editDesc" params='[illnessId:"${illnessInstance?.id }",type:"canDo"]'>编辑</g:link>
    </td>
    <td><g:textArea name="canDo" cols="40" rows="5" maxlength="3000" value="${illnessInstance?.canDo}"/></td>
  </tr>
<%--  <tr>--%>
<%--    <td class="fieldcontain ${hasErrors(bean: illnessInstance, field: 'reference', 'error')} ">引用文献</td>--%>
<%--    <td><g:textArea name="reference" cols="40" rows="5" maxlength="3000" value="${illnessInstance?.reference}"/></td>--%>
<%--  </tr>--%>
</table>


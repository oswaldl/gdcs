<%@ page import="com.zy.vo.InheritedConditions" %>

<table>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: inheritedConditionsInstance, field: 'magnitude', 'error')} required">名称</td>
    <td><g:textField name="name" value="${inheritedConditionsInstance?.name}"/><input type="hidden" name="username" value="${inheritedConditionsInstance?.username}"></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: inheritedConditionsInstance, field: 'magnitude', 'error')} required">研究数量</td>
    <td><g:field name="magnitude" type="number" value="${inheritedConditionsInstance.magnitude}" required=""/></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: inheritedConditionsInstance, field: 'result', 'error')} ">结果</td>
    <td><g:textField name="result" value="${inheritedConditionsInstance?.result}"/></td>
  </tr>
</table>


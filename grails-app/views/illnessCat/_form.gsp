<%@ page import="com.zy.vo.IllnessCat" %>

<table>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: illnessCatInstance, field: 'name', 'error')} ">名称</td>
    <td><g:textField name="name" value="${illnessCatInstance?.name}"/></td>
  </tr>
</table>



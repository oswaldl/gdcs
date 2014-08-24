<%@ page import="com.zy.vo.UserTriats" %>

<table>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: userTriatsInstance, field: 'username', 'error')} ">用户名：</td>
    <td>${userTriatsInstance?.username}</td>
  </tr>
  <tr>
    <td>个性谱名称</td>
    <td>${userTriatsInstance?.triats.name?:userTriatsInstance?.triats.chineseName}</td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: userTriatsInstance, field: 'result', 'error')} ">检查结果</td>
    <td><g:textField name="result" value="${userTriatsInstance?.result}"/></td>
  </tr>
</table>


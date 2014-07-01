<%@ page import="com.zy.auth.User" %>

<table>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">用户名</td>
    <td><g:textField name="username" required="" value="${userInstance?.username}"/></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: userInstance, field: 'chineseName', 'error')} required">中文名</td>
    <td><g:textField name="chineseName" required="" value="${userInstance?.chineseName}"/></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">密码</td>
    <td><input name="password" type="password" value="${userInstance?.password }"></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">是否启用</td>
    <td><g:checkBox name="enabled" value="${userInstance?.enabled}" /></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: userInstance, field: 'isAdmin', 'error')} ">是否为管理员</td>
    <td><g:checkBox name="isAdmin" value="${userInstance?.isAdmin}" /></td>
  </tr>
</table>

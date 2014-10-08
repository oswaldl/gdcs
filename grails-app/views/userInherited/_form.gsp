<%@ page import="com.zy.vo.UserInherited" %>



<div class="fieldcontain ${hasErrors(bean: userInheritedInstance, field: 'inherited', 'error')} required">
	<label for="inherited">
		<g:message code="userInherited.inherited.label" default="Inherited" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="inherited" name="inherited.id" from="${com.zy.vo.Inherited.list()}" optionKey="id" required="" value="${userInheritedInstance?.inherited?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInheritedInstance, field: 'username', 'error')} ">
	<label for="username">
		<g:message code="userInherited.username.label" default="Username" />
		
	</label>
	<g:textField name="username" value="${userInheritedInstance?.username}"/>
</div>


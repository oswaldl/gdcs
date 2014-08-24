<%@ page import="com.zy.vo.Triats" %>



<div class="fieldcontain ${hasErrors(bean: triatsInstance, field: 'magnitude', 'error')} required">
	<label for="magnitude">
		<g:message code="triats.magnitude.label" default="Magnitude" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="magnitude" type="number" value="${triatsInstance.magnitude}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: triatsInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="triats.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${triatsInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: triatsInstance, field: 'result', 'error')} ">
	<label for="result">
		<g:message code="triats.result.label" default="Result" />
		
	</label>
	<g:textField name="result" value="${triatsInstance?.result}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: triatsInstance, field: 'username', 'error')} ">
	<label for="username">
		<g:message code="triats.username.label" default="Username" />
		
	</label>
	<g:textField name="username" value="${triatsInstance?.username}"/>
</div>


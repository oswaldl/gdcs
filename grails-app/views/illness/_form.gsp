<%@ page import="com.zy.vo.Illness" %>



<div class="fieldcontain ${hasErrors(bean: illnessInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="illness.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${illnessInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: illnessInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="illness.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${illnessInstance?.description}"/>
</div>


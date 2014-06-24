<%@ page import="com.zy.vo.IllnessCat" %>



<div class="fieldcontain ${hasErrors(bean: illnessCatInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="illnessCat.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${illnessCatInstance?.name}"/>
</div>


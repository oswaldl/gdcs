<%@ page import="com.zy.vo.Gene" %>



<div class="fieldcontain ${hasErrors(bean: geneInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="gene.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${geneInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: geneInstance, field: 'magnitude', 'error')} ">
	<label for="magnitude">
		<g:message code="gene.magnitude.label" default="Magnitude" />
		
	</label>
	<g:textField name="magnitude" value="${geneInstance?.magnitude}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: geneInstance, field: 'frequency', 'error')} ">
	<label for="frequency">
		<g:message code="gene.frequency.label" default="Frequency" />
		
	</label>
	<g:textField name="frequency" value="${geneInstance?.frequency}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: geneInstance, field: 'references', 'error')} ">
	<label for="references">
		<g:message code="gene.references.label" default="References" />
		
	</label>
	<g:textField name="references" value="${geneInstance?.references}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: geneInstance, field: 'description1', 'error')} ">
	<label for="description1">
		<g:message code="gene.description1.label" default="Description1" />
		
	</label>
	<g:textArea name="description1" cols="40" rows="5" maxlength="3000" value="${geneInstance?.description1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: geneInstance, field: 'description2', 'error')} ">
	<label for="description2">
		<g:message code="gene.description2.label" default="Description2" />
		
	</label>
	<g:textArea name="description2" cols="40" rows="5" maxlength="3000" value="${geneInstance?.description2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: geneInstance, field: 'repute', 'error')} ">
	<label for="repute">
		<g:message code="gene.repute.label" default="Repute" />
		
	</label>
	<g:textField name="repute" value="${geneInstance?.repute}"/>
</div>


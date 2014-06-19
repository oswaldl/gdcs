<%@ page import="com.zy.vo.Gene" %>



<div class="fieldcontain ${hasErrors(bean: geneInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="gene.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${geneInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: geneInstance, field: 'description1', 'error')} ">
	<label for="description1">
		<g:message code="gene.description1.label" default="Description1" />
		
	</label>
	<g:textField name="description1" value="${geneInstance?.description1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: geneInstance, field: 'description2', 'error')} ">
	<label for="description2">
		<g:message code="gene.description2.label" default="Description2" />
		
	</label>
	<g:textField name="description2" value="${geneInstance?.description2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: geneInstance, field: 'isReputeGood', 'error')} ">
	<label for="isReputeGood">
		<g:message code="gene.isReputeGood.label" default="Is Repute Good" />
		
	</label>
	<g:checkBox name="isReputeGood" value="${geneInstance?.isReputeGood}" />
</div>


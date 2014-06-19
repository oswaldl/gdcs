<%@ page import="com.zy.vo.SNPRelation" %>



<div class="fieldcontain ${hasErrors(bean: SNPRelationInstance, field: 'gene', 'error')} required">
	<label for="gene">
		<g:message code="SNPRelation.gene.label" default="Gene" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="gene" name="gene.id" from="${com.zy.vo.Gene.list()}" optionKey="id" required="" value="${SNPRelationInstance?.gene?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: SNPRelationInstance, field: 'illness', 'error')} required">
	<label for="illness">
		<g:message code="SNPRelation.illness.label" default="Illness" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="illness" name="illness.id" from="${com.zy.vo.Illness.list()}" optionKey="id" required="" value="${SNPRelationInstance?.illness?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: SNPRelationInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="SNPRelation.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.zy.vo.User.list()}" optionKey="id" required="" value="${SNPRelationInstance?.user?.id}" class="many-to-one"/>
</div>


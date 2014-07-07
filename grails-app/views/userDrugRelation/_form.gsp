<%@ page import="com.zy.vo.UserDrugRelation" %>



<div class="fieldcontain ${hasErrors(bean: userDrugRelationInstance, field: 'geneData', 'error')} ">
	<label for="geneData">
		<g:message code="userDrugRelation.geneData.label" default="Gene Data" />
		
	</label>
	<g:textArea name="geneData" cols="40" rows="5" maxlength="3000" value="${userDrugRelationInstance?.geneData}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userDrugRelationInstance, field: 'oddRatio', 'error')} ">
	<label for="oddRatio">
		<g:message code="userDrugRelation.oddRatio.label" default="Odd Ratio" />
		
	</label>
	<g:textArea name="oddRatio" cols="40" rows="5" maxlength="3000" value="${userDrugRelationInstance?.oddRatio}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userDrugRelationInstance, field: 'geneAbstract', 'error')} ">
	<label for="geneAbstract">
		<g:message code="userDrugRelation.geneAbstract.label" default="Gene Abstract" />
		
	</label>
	<g:textArea name="geneAbstract" cols="40" rows="5" maxlength="3000" value="${userDrugRelationInstance?.geneAbstract}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userDrugRelationInstance, field: 'drugResponse', 'error')} required">
	<label for="drugResponse">
		<g:message code="userDrugRelation.drugResponse.label" default="Drug Response" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="drugResponse" name="drugResponse.id" from="${com.zy.vo.DrugResponse.list()}" optionKey="id" required="" value="${userDrugRelationInstance?.drugResponse?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userDrugRelationInstance, field: 'state', 'error')} ">
	<label for="state">
		<g:message code="userDrugRelation.state.label" default="State" />
		
	</label>
	<g:textField name="state" value="${userDrugRelationInstance?.state}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userDrugRelationInstance, field: 'username', 'error')} ">
	<label for="username">
		<g:message code="userDrugRelation.username.label" default="Username" />
		
	</label>
	<g:textField name="username" value="${userDrugRelationInstance?.username}"/>
</div>


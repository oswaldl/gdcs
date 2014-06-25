<%@ page import="com.zy.vo.RiskRank" %>



<div class="fieldcontain ${hasErrors(bean: riskRankInstance, field: 'high', 'error')} required">
	<label for="high">
		<g:message code="riskRank.high.label" default="High" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="high" value="${fieldValue(bean: riskRankInstance, field: 'high')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: riskRankInstance, field: 'low', 'error')} required">
	<label for="low">
		<g:message code="riskRank.low.label" default="Low" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="low" value="${fieldValue(bean: riskRankInstance, field: 'low')}" required=""/>
</div>


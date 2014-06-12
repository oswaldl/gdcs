<%@ page import="com.zy.vo.CrawlRecord" %>



<div class="fieldcontain ${hasErrors(bean: crawlRecordInstance, field: 'url1', 'error')} ">
	<label for="url1">
		<g:message code="crawlRecord.url1.label" default="Url1" />
		
	</label>
	<g:textField name="url1" value="${crawlRecordInstance?.url1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: crawlRecordInstance, field: 'url2', 'error')} ">
	<label for="url2">
		<g:message code="crawlRecord.url2.label" default="Url2" />
		
	</label>
	<g:textField name="url2" value="${crawlRecordInstance?.url2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: crawlRecordInstance, field: 'username', 'error')} ">
	<label for="username">
		<g:message code="crawlRecord.username.label" default="Username" />
		
	</label>
	<g:textField name="username" value="${crawlRecordInstance?.username}"/>
</div>


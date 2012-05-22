<%@ page import="edu.rpi.Status" %>



<div class="fieldcontain ${hasErrors(bean: statusInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="status.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${statusInstance?.description}"/>
</div>


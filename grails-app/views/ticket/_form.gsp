<%@ page import="edu.rpi.Ticket" %>



<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'shortDesc', 'error')} required">
	<label for="shortDesc">
		<g:message code="ticket.shortDesc.label" default="Short Desc" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="shortDesc" required="" value="${ticketInstance?.shortDesc}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'longDesc', 'error')} required">
	<label for="longDesc">
		<g:message code="ticket.longDesc.label" default="Long Desc" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="longDesc" required="" value="${ticketInstance?.longDesc}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="ticket.status.label" default="Status" />
		
	</label>
	<g:select id="status" name="status.id" from="${edu.rpi.Status.list()}" optionKey="id" value="${ticketInstance?.status?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'dateClosed', 'error')} ">
	<label for="dateClosed">
		<g:message code="ticket.dateClosed.label" default="Date Closed" />
		
	</label>
	<g:datePicker name="dateClosed" precision="day"  value="${ticketInstance?.dateClosed}" default="none" noSelection="['': '']" />
</div>



<%@ page import="edu.rpi.Ticket" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ticket.label', default: 'Ticket')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ticket" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ticket" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ticket">
			
				<g:if test="${ticketInstance?.shortDesc}">
				<li class="fieldcontain">
					<span id="shortDesc-label" class="property-label"><g:message code="ticket.shortDesc.label" default="Short Desc" /></span>
					
						<span class="property-value" aria-labelledby="shortDesc-label"><g:fieldValue bean="${ticketInstance}" field="shortDesc"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.longDesc}">
				<li class="fieldcontain">
					<span id="longDesc-label" class="property-label"><g:message code="ticket.longDesc.label" default="Long Desc" /></span>
					
						<span class="property-value" aria-labelledby="longDesc-label"><g:fieldValue bean="${ticketInstance}" field="longDesc"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="ticket.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:link controller="status" action="show" id="${ticketInstance?.status?.id}">${ticketInstance?.status?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="ticket.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${ticketInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.dateClosed}">
				<li class="fieldcontain">
					<span id="dateClosed-label" class="property-label"><g:message code="ticket.dateClosed.label" default="Date Closed" /></span>
					
						<span class="property-value" aria-labelledby="dateClosed-label"><g:formatDate date="${ticketInstance?.dateClosed}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${ticketInstance?.id}" />
					<g:link class="edit" action="edit" id="${ticketInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

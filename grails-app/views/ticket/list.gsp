
<%@ page import="edu.rpi.Ticket" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ticket.label', default: 'Ticket')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ticket" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ticket" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="shortDesc" title="${message(code: 'ticket.shortDesc.label', default: 'Short Desc')}" />
					
						<g:sortableColumn property="longDesc" title="${message(code: 'ticket.longDesc.label', default: 'Long Desc')}" />
					
						<th><g:message code="ticket.status.label" default="Status" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'ticket.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="dateClosed" title="${message(code: 'ticket.dateClosed.label', default: 'Date Closed')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ticketInstanceList}" status="i" var="ticketInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ticketInstance.id}">${fieldValue(bean: ticketInstance, field: "shortDesc")}</g:link></td>
					
						<td>${fieldValue(bean: ticketInstance, field: "longDesc")}</td>
					
						<td>${fieldValue(bean: ticketInstance, field: "status")}</td>
					
						<td><g:formatDate date="${ticketInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${ticketInstance.dateClosed}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ticketInstanceTotal}" />
			</div>
		</div>
	</body>
</html>


<%@ page import="scrumplanner20.SprintMember" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sprintMember.label', default: 'SprintMember')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-sprintMember" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/index.gsp')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-sprintMember" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
                        <th><g:message code="sprintMember.person.label" default="Person" /></th>
                        <g:sortableColumn property="sprint" title="${message(code: 'sprintMember.sprint.label', default: 'Sprint')}" />
                        <g:sortableColumn property="role" title="${message(code: 'sprintMember.role.label', default: 'Role')}" />
						<g:sortableColumn property="dailyHours" title="${message(code: 'sprintMember.dailyHours.label', default: 'Daily Hours')}" />
                        <g:sortableColumn property="daysOff" title="${message(code: 'sprintMember.daysOff.label', default: 'Days Off')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${sprintMemberInstanceList}" status="i" var="sprintMemberInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td><g:link action="show" id="${sprintMemberInstance.id}">${fieldValue(bean: sprintMemberInstance, field: "person")}</g:link></td>
                        <td><g:link controller="sprint" action="show" id="${sprintMemberInstance?.sprint.id}">${fieldValue(bean: sprintMemberInstance, field: "sprint")}</g:link></td>
                        <td>${fieldValue(bean: sprintMemberInstance, field: "role.role")}</td>
						<td>${fieldValue(bean: sprintMemberInstance, field: "dailyHours")}</td>
                        <td>${fieldValue(bean: sprintMemberInstance, field: "daysOff")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${sprintMemberInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

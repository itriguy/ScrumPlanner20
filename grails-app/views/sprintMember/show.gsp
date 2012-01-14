
<%@ page import="scrumplanner20.SprintMember" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sprintMember.label', default: 'SprintMember')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-sprintMember" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/index.gsp')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-sprintMember" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list sprintMember">
			
				<g:if test="${sprintMemberInstance?.person}">
				<li class="fieldcontain">
					<span id="person-label" class="property-label"><g:message code="sprintMember.person.label" default="Person" /></span>
					
						<span class="property-value" aria-labelledby="person-label"><g:link controller="person" action="show" id="${sprintMemberInstance?.person?.id}">${sprintMemberInstance?.person?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${sprintMemberInstance?.sprint}">
				<li class="fieldcontain">
					<span id="sprint-label" class="property-label"><g:message code="sprintMember.sprint.label" default="Sprint" /></span>
					
						<span class="property-value" aria-labelledby="sprint-label"><g:link controller="sprint" action="show" id="${sprintMemberInstance?.sprint?.id}">${sprintMemberInstance?.sprint?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${sprintMemberInstance?.dailyHours}">
				<li class="fieldcontain">
					<span id="dailyHours-label" class="property-label"><g:message code="sprintMember.dailyHours.label" default="Daily Hours" /></span>
					
						<span class="property-value" aria-labelledby="dailyHours-label"><g:fieldValue bean="${sprintMemberInstance}" field="dailyHours"/></span>
					
				</li>
				</g:if>

                <li class="fieldcontain">
                    <span id="daysOff-label" class="property-label"><g:message code="sprintMember.daysOff.label" default="Days Off" /></span>

                        <span class="property-value" aria-labelledby="daysOff-label"><g:fieldValue bean="${sprintMemberInstance}" field="daysOff"/></span>
                </li>

				<g:if test="${sprintMemberInstance?.role}">
				<li class="fieldcontain">
					<span id="role-label" class="property-label"><g:message code="sprintMember.role.label" default="Role" /></span>
					
						<span class="property-value" aria-labelledby="role-label"><g:fieldValue bean="${sprintMemberInstance}" field="role.role"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${sprintMemberInstance?.id}" />
					<g:link class="edit" action="edit" id="${sprintMemberInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

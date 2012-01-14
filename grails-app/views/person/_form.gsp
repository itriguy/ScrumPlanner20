<%@ page import="scrumplanner20.Person" %>


<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="person.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" maxlength="20" required="" value="${personInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="person.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" maxlength="20" required="" value="${personInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'emailAddress', 'error')} ">
	<label for="emailAddress">
		<g:message code="person.emailAddress.label" default="Email Address" />
		
	</label>
	<g:field type="email" name="emailAddress" value="${personInstance?.emailAddress}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'managedTeams', 'error')} ">
	<label for="managedTeams">
		<g:message code="person.managedTeams.label" default="Managed Teams" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personInstance?.managedTeams?}" var="m">
    <li><g:link controller="team" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="team" action="create" params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'team.label', default: 'Team')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'sprints', 'error')} ">
	<label for="sprints">
		<g:message code="person.sprints.label" default="Sprints" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personInstance?.sprints?}" var="s">
    <li><g:link controller="sprintMember" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="sprintMember" action="create" params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'sprintMember.label', default: 'SprintMember')])}</g:link>
</li>
</ul>

</div>


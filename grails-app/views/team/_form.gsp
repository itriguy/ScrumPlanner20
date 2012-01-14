<%@ page import="scrumplanner20.Team" %>



<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="team.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="15" required="" value="${teamInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'teamLeader', 'error')} ">
	<label for="teamLeader">
		<g:message code="team.teamLeader.label" default="Team Leader" />
		
	</label>
	<g:select id="teamLeader" name="teamLeader.id" from="${scrumplanner20.Person.list()}" optionKey="id" value="${teamInstance?.teamLeader?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'sprints', 'error')} ">
	<label for="sprints">
		<g:message code="team.sprints.label" default="Sprints" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${teamInstance?.sprints?}" var="s">
    <li><g:link controller="sprint" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="sprint" action="create" params="['team.id': teamInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'sprint.label', default: 'Sprint')])}</g:link>
</li>
</ul>

</div>


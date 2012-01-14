<%@ page import="scrumplanner20.SprintMember" %>



<div class="fieldcontain ${hasErrors(bean: sprintMemberInstance, field: 'person', 'error')} required">
	<label for="person">
		<g:message code="sprintMember.person.label" default="Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="person" name="person.id" from="${scrumplanner20.Person.list()}" optionKey="id" required="" value="${sprintMemberInstance?.person?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sprintMemberInstance, field: 'sprint', 'error')} required">
	<label for="sprint">
		<g:message code="sprintMember.sprint.label" default="Sprint" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sprint" name="sprint.id" from="${scrumplanner20.Sprint.list()}"
              optionKey="id" required="" value="${sprintMemberInstance?.sprint?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sprintMemberInstance, field: 'dailyHours', 'error')} required">
	<label for="dailyHours">
		<g:message code="sprintMember.dailyHours.label" default="Daily Hours" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="dailyHours" required="" value="${fieldValue(bean: sprintMemberInstance, field: 'dailyHours')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sprintMemberInstance, field: 'daysOff', 'error')} required">
	<label for="daysOff">
		<g:message code="sprintMember.daysOff.label" default="Days Off" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="daysOff" required="" value="${fieldValue(bean: sprintMemberInstance, field: 'daysOff')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sprintMemberInstance, field: 'role', 'error')} required">
	<label for="role">
		<g:message code="sprintMember.role.label" default="Role" />
		<span class="required-indicator">*</span>
	</label>

	<g:select name='role' value="${sprintMemberInstance?.role?.name()}"
        from='${scrumplanner20.ScrumRole?.values()}'
        optionValue="role"/>
</div>


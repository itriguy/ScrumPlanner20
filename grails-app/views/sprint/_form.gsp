<%@ page import="scrumplanner20.Sprint" %>



<div class="fieldcontain ${hasErrors(bean: sprintInstance, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="sprint.name.label" default="Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" maxlength="30" required="" value="${sprintInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sprintInstance, field: 'team', 'error')} required">
    <label for="team">
        <g:message code="sprint.team.label" default="Team"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="team" name="team.id" from="${scrumplanner20.Team.list()}" optionKey="id" required=""
              value="${sprintInstance?.team?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sprintInstance, field: 'workingDays', 'error')} required">
    <label for="workingDays">
        <g:message code="sprint.workingDays.label" default="Working Days"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field type="number" name="workingDays" required=""
             value="${fieldValue(bean: sprintInstance, field: 'workingDays')}"/>
</div>

<div class="fieldcontain">
    <span id="hours-label" class="property-label"><g:message code="sprint.hours.label"
                                                               default="Hours"/></span>
    <span class="property-value" aria-labelledby="hours-label">${sprintInstance?.hours}</span>
</div>

<div class="fieldcontain ${hasErrors(bean: sprintInstance, field: 'sprintStart', 'error')} required">
    <label for="sprintStart">
        <g:message code="sprint.sprintStart.label" default="Sprint Start"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="sprintStart" precision="day" value="${sprintInstance?.sprintStart}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sprintInstance, field: 'sprintEnd', 'error')} required">
    <label for="sprintEnd">
        <g:message code="sprint.sprintEnd.label" default="Sprint End"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="sprintEnd" precision="day" value="${sprintInstance?.sprintEnd}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sprintInstance, field: 'members', 'error')} ">
    <label for="members">
        <g:message code="sprint.members.label" default="Members"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${sprintInstance.members}" var="m">
            <li><g:link controller="person"
                         action="show"
                         id="${m.person.id}">${m?.person.encodeAsHTML()}</g:link>
                <g:link controller="sprintMember" action="show"
                         id="${m.id}">(${m?.role.role})</g:link>
                <g:link controller="sprintMember" action="delete"
                         id="${m.id}" params="[redirect: 'sprint', redirectAction: 'edit', redirectId: sprintInstance?.id]"
                         onclick="return confirm('${message(code: 'Delete Member', default: 'Are you sure want to remove this member?')}');">
                    <g:img dir="images" file="skin/database_delete.png"/>
                </g:link>
            </li>
        </g:each>
        <li class="add">
            <g:link controller="sprintMember" action="create"
                    params="['sprint.id': sprintInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'sprintMember.label', default: 'Sprint Member')])}</g:link>
        </li>
    </ul>

</div>

<div class="fieldcontain ${hasErrors(bean: sprintInstance, field: 'notes', 'error')} ">
    <label for="notes">
        <g:message code="sprint.notes.label" default="Notes"/>

    </label>
    <g:textArea name="notes" cols="40" rows="5" maxlength="500" value="${sprintInstance?.notes}"/>
</div>


<%@ page import="scrumplanner20.Sprint" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'sprint.label', default: 'Sprint')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-sprint" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/index.gsp')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-sprint" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list sprint">

        <g:if test="${sprintInstance?.name}">
            <li class="fieldcontain">
                <span id="name-label" class="property-label"><g:message code="sprint.name.label" default="Name"/></span>

                <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${sprintInstance}"
                                                                                        field="name"/></span>

            </li>
        </g:if>

        <g:if test="${sprintInstance?.team}">
            <li class="fieldcontain">
                <span id="team-label" class="property-label"><g:message code="sprint.team.label" default="Team"/></span>

                <span class="property-value" aria-labelledby="team-label"><g:link controller="team" action="show"
                                                                                  id="${sprintInstance?.team?.id}">${sprintInstance?.team?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${sprintInstance?.workingDays}">
            <li class="fieldcontain">
                <span id="workingDays-label" class="property-label"><g:message code="sprint.workingDays.label"
                                                                               default="Working Days"/></span>

                <span class="property-value" aria-labelledby="workingDays-label"><g:fieldValue bean="${sprintInstance}"
                                                                                               field="workingDays"/></span>

            </li>
        </g:if>

        <li class="fieldcontain">
            <span id="hours-label" class="property-label"><g:message code="sprint.hours.label"
                                                                       default="Hours"/></span>
            <span class="property-value" aria-labelledby="hours-label">${sprintInstance?.hours}</span>
        </li>

        <g:if test="${sprintInstance?.sprintStart}">
            <li class="fieldcontain">
                <span id="sprintStart-label" class="property-label"><g:message code="sprint.sprintStart.label"
                                                                               default="Sprint Start"/></span>

                <span class="property-value" aria-labelledby="sprintStart-label"><g:formatDate
                    date="${sprintInstance?.sprintStart}" format="yyyy-MM-dd"/></span>

            </li>
        </g:if>

        <g:if test="${sprintInstance?.sprintEnd}">
            <li class="fieldcontain">
                <span id="sprintEnd-label" class="property-label"><g:message code="sprint.sprintEnd.label"
                                                                             default="Sprint End"/></span>

                <span class="property-value" aria-labelledby="sprintEnd-label"><g:formatDate
                    date="${sprintInstance?.sprintEnd}" format="yyyy-MM-dd"/></span>

            </li>
        </g:if>

        <li class="fieldcontain">
            <span id="members-label" class="property-label"><g:message code="sprint.members.label"
                                                                       default="Members"/></span>
            <g:each in="${sprintInstance.members}" var="m">
                <span class="property-value" aria-labelledby="members-label">
                    <g:link controller="person" action="show"
                             id="${m.person.id}">${m?.person.encodeAsHTML()}</g:link>
                    <g:link controller="sprintMember" action="show"
                             id="${m.id}">(${m?.role.role})</g:link>
                    <g:link controller="sprintMember" action="remoteDelete"
                             id="${m.id}" params="[redirect: 'sprint', redirectAction: 'show', redirectId: sprintInstance?.id]"
                             onclick="return confirm('${message(code: 'Delete Member', default: 'Are you sure want to remove this member?')}');">
                        <g:img dir="images" file="skin/database_delete.png"/>
                    </g:link>
                </span>
            </g:each>
            <span class="property-value" aria-labelledby="members-label">
                    <g:link controller="sprintMember" action="create" class="add"
                            params="['sprint.id': sprintInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'sprintMember.label', default: 'Sprint Member')])}</g:link>
            </span>
        </li>

        <g:if test="${sprintInstance?.notes}">
            <li class="fieldcontain">
                <span id="notes-label" class="property-label"><g:message code="sprint.notes.label"
                                                                         default="Notes"/></span>

                <span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${sprintInstance}"
                                                                                         field="notes"/></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${sprintInstance?.id}"/>
            <g:link class="edit" action="edit" id="${sprintInstance?.id}"><g:message code="default.button.edit.label"
                                                                                     default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>

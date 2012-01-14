<%@ page import="scrumplanner20.Sprint" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'sprint.label', default: 'Sprint')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-sprint" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/index.gsp')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-sprint" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="name" title="${message(code: 'sprint.name.label', default: 'Name')}"/>

            <th><g:message code="sprint.team.label" default="Team"/></th>


            <g:sortableColumn property="workingDays"
                              title="${message(code: 'sprint.workingDays.label', default: 'Working Days')}"/>

            <g:sortableColumn property="sprintStart"
                              title="${message(code: 'sprint.sprintStart.label', default: 'Sprint Start')}"/>

            <g:sortableColumn property="sprintEnd"
                              title="${message(code: 'sprint.sprintEnd.label', default: 'Sprint End')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${sprintInstanceList}" status="i" var="sprintInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${sprintInstance.id}">${fieldValue(bean: sprintInstance, field: "name")}</g:link></td>

                <td>${fieldValue(bean: sprintInstance, field: "team")}</td>

                <td>${fieldValue(bean: sprintInstance, field: "workingDays")}</td>

                <td><g:formatDate date="${sprintInstance.sprintStart}" format="yyyy-MM-dd"/></td>

                <td><g:formatDate date="${sprintInstance.sprintEnd}" format="yyyy-MM-dd"/></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${sprintInstanceTotal}"/>
    </div>
</div>
</body>
</html>

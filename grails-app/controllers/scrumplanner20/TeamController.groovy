package scrumplanner20

import org.springframework.dao.DataIntegrityViolationException

class TeamController
{
    def listName = "Teams"


    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index()
    {
        redirect(action: "list", params: params)
    }

    def list()
    {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [teamInstanceList: Team.list(params), teamInstanceTotal: Team.count()]
    }

    def create()
    {
        [teamInstance: new Team(params)]
    }

    def save()
    {
        def teamInstance = new Team(params)
        if(!teamInstance.save(flush: true))
        {
            render(view: "create", model: [teamInstance: teamInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'team.label', default: 'Team'), teamInstance.id])
        redirect(action: "show", id: teamInstance.id)
    }

    def show()
    {
        def teamInstance = Team.get(params.id)
        if(!teamInstance)
        {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'team.label', default: 'Team'), params.id])
            redirect(action: "list")
            return
        }

        [teamInstance: teamInstance]
    }

    def edit()
    {
        def teamInstance = Team.get(params.id)
        if(!teamInstance)
        {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'team.label', default: 'Team'), params.id])
            redirect(action: "list")
            return
        }

        [teamInstance: teamInstance]
    }

    def update()
    {
        def teamInstance = Team.get(params.id)
        if(!teamInstance)
        {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'team.label', default: 'Team'), params.id])
            redirect(action: "list")
            return
        }

        if(params.version)
        {
            def version = params.version.toLong()
            if(teamInstance.version > version)
            {
                teamInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                                                [message(code: 'team.label', default: 'Team')] as Object[],
                                                "Another user has updated this Team while you were editing")
                render(view: "edit", model: [teamInstance: teamInstance])
                return
            }
        }

        teamInstance.properties = params

        if(!teamInstance.save(flush: true))
        {
            render(view: "edit", model: [teamInstance: teamInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'team.label', default: 'Team'), teamInstance.id])
        redirect(action: "show", id: teamInstance.id)
    }

    def delete()
    {
        def teamInstance = Team.get(params.id)
        if(!teamInstance)
        {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'team.label', default: 'Team'), params.id])
            redirect(action: "list")
            return
        }

        try
        {
            teamInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'team.label', default: 'Team'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e)
        {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'team.label', default: 'Team'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}

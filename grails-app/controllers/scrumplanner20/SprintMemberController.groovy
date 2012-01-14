package scrumplanner20

import org.springframework.dao.DataIntegrityViolationException

class SprintMemberController
{
    def listName = "Sprint Members"

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index()
    {
        redirect(action: "list", params: params)
    }

    def list()
    {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [sprintMemberInstanceList: SprintMember.list(params), sprintMemberInstanceTotal: SprintMember.count()]
    }

    def create()
    {
        [sprintMemberInstance: new SprintMember(params)]
    }

    def save()
    {
        def sprintMemberInstance = new SprintMember(params)
        if(!sprintMemberInstance.save(flush: true))
        {
            render(view: "create", model: [sprintMemberInstance: sprintMemberInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'sprintMember.label', default: 'SprintMember'), sprintMemberInstance.id])
        redirect(action: "show", id: sprintMemberInstance.id)
    }

    def show()
    {
        def sprintMemberInstance = SprintMember.get(params.id)
        if(!sprintMemberInstance)
        {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sprintMember.label', default: 'SprintMember'), params.id])
            redirect(action: "list")
            return
        }

        [sprintMemberInstance: sprintMemberInstance]
    }

    def edit()
    {
        def sprintMemberInstance = SprintMember.get(params.id)
        if(!sprintMemberInstance)
        {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sprintMember.label', default: 'SprintMember'), params.id])
            redirect(action: "list")
            return
        }

        [sprintMemberInstance: sprintMemberInstance]
    }

    def update()
    {
        def sprintMemberInstance = SprintMember.get(params.id)
        if(!sprintMemberInstance)
        {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sprintMember.label', default: 'SprintMember'), params.id])
            redirect(action: "list")
            return
        }

        if(params.version)
        {
            def version = params.version.toLong()
            if(sprintMemberInstance.version > version)
            {
                sprintMemberInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                                                        [message(code: 'sprintMember.label', default: 'SprintMember')] as Object[],
                                                        "Another user has updated this SprintMember while you were editing")
                render(view: "edit", model: [sprintMemberInstance: sprintMemberInstance])
                return
            }
        }

        sprintMemberInstance.properties = params

        if(!sprintMemberInstance.save(flush: true))
        {
            render(view: "edit", model: [sprintMemberInstance: sprintMemberInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'sprintMember.label', default: 'SprintMember'), sprintMemberInstance.id])
        redirect(action: "show", id: sprintMemberInstance.id)
    }

    def delete()
    {
        def sprintMemberInstance = SprintMember.get(params.id)
        if(!sprintMemberInstance)
        {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sprintMember.label', default: 'SprintMember'), params.id])
            redirect(action: "list")
            return
        }

        try
        {
            sprintMemberInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'sprintMember.label', default: 'SprintMember'), params.id])
            if(params.redirect){
                def redController = params.redirect
                def redirectAction = params.redirectAction
                def redirectId= params.redirectId
                redirect(controller: redController, action: redirectAction, id: redirectId)
            }else{
                redirect(action: "list")
            }
        }
        catch (DataIntegrityViolationException e)
        {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'sprintMember.label', default: 'SprintMember'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    def remoteDelete()
    {
        delete()
    }
}

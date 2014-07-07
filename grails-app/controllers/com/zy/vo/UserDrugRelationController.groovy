package com.zy.vo

import org.springframework.dao.DataIntegrityViolationException

class UserDrugRelationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userDrugRelationInstanceList: UserDrugRelation.list(params), userDrugRelationInstanceTotal: UserDrugRelation.count()]
    }

    def create() {
        [userDrugRelationInstance: new UserDrugRelation(params)]
    }

    def save() {
        def userDrugRelationInstance = new UserDrugRelation(params)
        if (!userDrugRelationInstance.save(flush: true)) {
            render(view: "create", model: [userDrugRelationInstance: userDrugRelationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'userDrugRelation.label', default: 'UserDrugRelation'), userDrugRelationInstance.id])
        redirect(action: "show", id: userDrugRelationInstance.id)
    }

    def show(Long id) {
        def userDrugRelationInstance = UserDrugRelation.get(id)
        if (!userDrugRelationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userDrugRelation.label', default: 'UserDrugRelation'), id])
            redirect(action: "list")
            return
        }

        [userDrugRelationInstance: userDrugRelationInstance]
    }

    def edit(Long id) {
        def userDrugRelationInstance = UserDrugRelation.get(id)
        if (!userDrugRelationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userDrugRelation.label', default: 'UserDrugRelation'), id])
            redirect(action: "list")
            return
        }

        [userDrugRelationInstance: userDrugRelationInstance]
    }

    def update(Long id, Long version) {
        def userDrugRelationInstance = UserDrugRelation.get(id)
        if (!userDrugRelationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userDrugRelation.label', default: 'UserDrugRelation'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userDrugRelationInstance.version > version) {
                userDrugRelationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'userDrugRelation.label', default: 'UserDrugRelation')] as Object[],
                          "Another user has updated this UserDrugRelation while you were editing")
                render(view: "edit", model: [userDrugRelationInstance: userDrugRelationInstance])
                return
            }
        }

        userDrugRelationInstance.properties = params

        if (!userDrugRelationInstance.save(flush: true)) {
            render(view: "edit", model: [userDrugRelationInstance: userDrugRelationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'userDrugRelation.label', default: 'UserDrugRelation'), userDrugRelationInstance.id])
        redirect(action: "show", id: userDrugRelationInstance.id)
    }

    def delete(Long id) {
        def userDrugRelationInstance = UserDrugRelation.get(id)
        if (!userDrugRelationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userDrugRelation.label', default: 'UserDrugRelation'), id])
            redirect(action: "list")
            return
        }

        try {
            userDrugRelationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'userDrugRelation.label', default: 'UserDrugRelation'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userDrugRelation.label', default: 'UserDrugRelation'), id])
            redirect(action: "show", id: id)
        }
    }
}

package com.zy.vo

import org.springframework.dao.DataIntegrityViolationException

import com.zy.auth.User

class TriatsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [triatsInstanceList: Triats.list(params), triatsInstanceTotal: Triats.count()]
    }

    def create() {
        [triatsInstance: new Triats(params)]
    }

    def save() {
        def triatsInstance = new Triats(params)
        if (!triatsInstance.save(flush: true)) {
            render(view: "create", model: [triatsInstance: triatsInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'triats.label', default: 'Triats'), triatsInstance.id])
        redirect(action: "show", id: triatsInstance.id)
    }

    def show(Long id) {
        def triatsInstance = Triats.get(id)
        if (!triatsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'triats.label', default: 'Triats'), id])
            redirect(action: "list")
            return
        }

        [triatsInstance: triatsInstance]
    }

    def edit(Long id) {
        def triatsInstance = Triats.get(id)
        if (!triatsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'triats.label', default: 'Triats'), id])
            redirect(action: "list")
            return
        }

        [triatsInstance: triatsInstance]
    }

    def update(Long id, Long version) {
        def triatsInstance = Triats.get(id)
        if (!triatsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'triats.label', default: 'Triats'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (triatsInstance.version > version) {
                triatsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'triats.label', default: 'Triats')] as Object[],
                          "Another user has updated this Triats while you were editing")
                render(view: "edit", model: [triatsInstance: triatsInstance])
                return
            }
        }

        triatsInstance.properties = params

        if (!triatsInstance.save(flush: true)) {
            render(view: "edit", model: [triatsInstance: triatsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'triats.label', default: 'Triats'), triatsInstance.id])
        redirect(action: "show", id: triatsInstance.id)
    }

    def delete(Long id) {
        def triatsInstance = Triats.get(id)
        if (!triatsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'triats.label', default: 'Triats'), id])
            redirect(action: "list")
            return
        }

        try {
            triatsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'triats.label', default: 'Triats'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'triats.label', default: 'Triats'), id])
            redirect(action: "show", id: id)
        }
    }
	
	
}

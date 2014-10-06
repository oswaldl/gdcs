package com.zy.vo

import org.springframework.dao.DataIntegrityViolationException

class InheritedController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [inheritedInstanceList: Inherited.list(params), inheritedInstanceTotal: Inherited.count()]
    }

    def create() {
        [inheritedInstance: new Inherited(params)]
    }

    def save() {
        def inheritedInstance = new Inherited(params)
        if (!inheritedInstance.save(flush: true)) {
            render(view: "create", model: [inheritedInstance: inheritedInstance])
            return
        }

        flash.message = "创建成功！"
        redirect(action: "list")
    }

    def show(Long id) {
        def inheritedInstance = Inherited.get(id)
        if (!inheritedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inherited.label', default: 'Inherited'), id])
            redirect(action: "list")
            return
        }

        [inheritedInstance: inheritedInstance]
    }

    def edit(Long id) {
        def inheritedInstance = Inherited.get(id)
        if (!inheritedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inherited.label', default: 'Inherited'), id])
            redirect(action: "list")
            return
        }

        [inheritedInstance: inheritedInstance]
    }

    def update(Long id, Long version) {
        def inheritedInstance = Inherited.get(id)
        if (!inheritedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inherited.label', default: 'Inherited'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (inheritedInstance.version > version) {
                inheritedInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'inherited.label', default: 'Inherited')] as Object[],
                          "Another user has updated this Inherited while you were editing")
                render(view: "edit", model: [inheritedInstance: inheritedInstance])
                return
            }
        }

        inheritedInstance.properties = params

        if (!inheritedInstance.save(flush: true)) {
            render(view: "edit", model: [inheritedInstance: inheritedInstance])
            return
        }

        flash.message = "更新成功！"
        redirect(action: "list")
    }

    def delete(Long id) {
        def inheritedInstance = Inherited.get(id)
        if (!inheritedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inherited.label', default: 'Inherited'), id])
            redirect(action: "list")
            return
        }

        try {
            inheritedInstance.delete(flush: true)
           flash.message = "删除成功！"
		   redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'inherited.label', default: 'Inherited'), id])
            redirect(action: "show", id: id)
        }
    }
}

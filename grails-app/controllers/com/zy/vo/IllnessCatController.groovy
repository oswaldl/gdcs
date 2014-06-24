package com.zy.vo

import org.springframework.dao.DataIntegrityViolationException

class IllnessCatController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [illnessCatInstanceList: IllnessCat.list(params), illnessCatInstanceTotal: IllnessCat.count()]
    }

    def create() {
        [illnessCatInstance: new IllnessCat(params)]
    }

    def save() {
        def illnessCatInstance = new IllnessCat(params)
        if (!illnessCatInstance.save(flush: true)) {
            render(view: "create", model: [illnessCatInstance: illnessCatInstance])
            return
        }

        flash.message = "创建成功！"
        redirect(action: "list")
    }

    def show(Long id) {
        def illnessCatInstance = IllnessCat.get(id)
        if (!illnessCatInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'illnessCat.label', default: 'IllnessCat'), id])
            redirect(action: "list")
            return
        }

        [illnessCatInstance: illnessCatInstance]
    }

    def edit(Long id) {
        def illnessCatInstance = IllnessCat.get(id)
        if (!illnessCatInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'illnessCat.label', default: 'IllnessCat'), id])
            redirect(action: "list")
            return
        }

        [illnessCatInstance: illnessCatInstance]
    }

    def update(Long id, Long version) {
        def illnessCatInstance = IllnessCat.get(id)
        if (!illnessCatInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'illnessCat.label', default: 'IllnessCat'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (illnessCatInstance.version > version) {
                illnessCatInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'illnessCat.label', default: 'IllnessCat')] as Object[],
                          "Another user has updated this IllnessCat while you were editing")
                render(view: "edit", model: [illnessCatInstance: illnessCatInstance])
                return
            }
        }

        illnessCatInstance.properties = params

        if (!illnessCatInstance.save(flush: true)) {
            render(view: "edit", model: [illnessCatInstance: illnessCatInstance])
            return
        }

        flash.message = "修改成功！"
        redirect(action: "list")
    }

    def delete(Long id) {
        def illnessCatInstance = IllnessCat.get(id)
        if (!illnessCatInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'illnessCat.label', default: 'IllnessCat'), id])
            redirect(action: "list")
            return
        }

        try {
            illnessCatInstance.delete(flush: true)
            flash.message = "删除成功！"
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'illnessCat.label', default: 'IllnessCat'), id])
            redirect(action: "show", id: id)
        }
    }
}

package com.zy.vo

import org.springframework.dao.DataIntegrityViolationException

class GeneController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [geneInstanceList: Gene.list(params), geneInstanceTotal: Gene.count()]
    }

    def create() {
        [geneInstance: new Gene(params)]
    }

    def save() {
        def geneInstance = new Gene(params)
        if (!geneInstance.save(flush: true)) {
            render(view: "create", model: [geneInstance: geneInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'gene.label', default: 'Gene'), geneInstance.id])
        redirect(action: "show", id: geneInstance.id)
    }

    def show(Long id) {
        def geneInstance = Gene.get(id)
        if (!geneInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gene.label', default: 'Gene'), id])
            redirect(action: "list")
            return
        }
		
        [geneInstance: geneInstance,params:params]
    }

    def edit(Long id) {
        def geneInstance = Gene.get(id)
        if (!geneInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gene.label', default: 'Gene'), id])
            redirect(action: "list")
            return
        }

        [geneInstance: geneInstance]
    }

    def update(Long id, Long version) {
        def geneInstance = Gene.get(id)
        if (!geneInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gene.label', default: 'Gene'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (geneInstance.version > version) {
                geneInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'gene.label', default: 'Gene')] as Object[],
                          "Another user has updated this Gene while you were editing")
                render(view: "edit", model: [geneInstance: geneInstance])
                return
            }
        }

        geneInstance.properties = params

        if (!geneInstance.save(flush: true)) {
            render(view: "edit", model: [geneInstance: geneInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'gene.label', default: 'Gene'), geneInstance.id])
        redirect(action: "show", id: geneInstance.id)
    }

    def delete(Long id) {
        def geneInstance = Gene.get(id)
        if (!geneInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gene.label', default: 'Gene'), id])
            redirect(action: "list")
            return
        }

        try {
            geneInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'gene.label', default: 'Gene'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'gene.label', default: 'Gene'), id])
            redirect(action: "show", id: id)
        }
    }
}

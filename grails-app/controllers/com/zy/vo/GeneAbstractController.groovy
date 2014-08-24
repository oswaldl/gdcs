package com.zy.vo

import org.springframework.dao.DataIntegrityViolationException

class GeneAbstractController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [geneAbstractInstanceList: GeneAbstract.list(params), geneAbstractInstanceTotal: GeneAbstract.count()]
    }

    def create() {
        [geneAbstractInstance: new GeneAbstract(params)]
    }

    def save() {
        def geneAbstractInstance = new GeneAbstract(params)
        if (!geneAbstractInstance.save(flush: true)) {
            render(view: "create", model: [geneAbstractInstance: geneAbstractInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'geneAbstract.label', default: 'GeneAbstract'), geneAbstractInstance.id])
        redirect(action: "show", id: geneAbstractInstance.id)
    }

    def show(Long id) {
        def geneAbstractInstance = GeneAbstract.get(id)
        if (!geneAbstractInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'geneAbstract.label', default: 'GeneAbstract'), id])
            redirect(action: "list")
            return
        }

        [geneAbstractInstance: geneAbstractInstance]
    }

    def edit() {
		DrugResponse drugResponse=params.drugResponseId=="null"?new DrugResponse().save(failOnError:true):DrugResponse.get(params.drugResponseId)
        def geneAbstractInstance = drugResponse.geneAbstract
        if (!geneAbstractInstance) {
			geneAbstractInstance=new GeneAbstract().save(failOnError:true)
        }
        [geneAbstractInstance: geneAbstractInstance,drugResponseId:drugResponse.id]
    }
	
	def edit2() {
		Triats triats=params.triatsInstanceId=="null"?new Triats().save(failOnError:true):Triats.get(params.triatsInstanceId)
		def geneAbstractInstance = triats.geneAbstract
		if (!geneAbstractInstance) {
			geneAbstractInstance=new GeneAbstract().save(failOnError:true)
		}
		[geneAbstractInstance: geneAbstractInstance,triatsInstanceId:triats.id]
	}

    def update(Long id, Long version) {
        def geneAbstractInstance = GeneAbstract.get(id)
        if (!geneAbstractInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'geneAbstract.label', default: 'GeneAbstract'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (geneAbstractInstance.version > version) {
                geneAbstractInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'geneAbstract.label', default: 'GeneAbstract')] as Object[],
                          "Another user has updated this GeneAbstract while you were editing")
                render(view: "edit", model: [geneAbstractInstance: geneAbstractInstance])
                return
            }
        }

        geneAbstractInstance.properties = params

        if (!geneAbstractInstance.save(flush: true)) {
            render(view: "edit", model: [geneAbstractInstance: geneAbstractInstance])
            return
        }
		if(params.drugResponseId){
			def drugResponse=DrugResponse.get(params.drugResponseId)
			drugResponse.geneAbstract=geneAbstractInstance
			drugResponse.save(failOnError:true)
        	redirect(controller:"drugResponse",action: "edit", params: [id:drugResponse.id])
		}
		if(params.triatsInstanceId){
			def triatsInstance=Triats.get(params.drugResponseId)
			triatsInstance.geneAbstract=geneAbstractInstance
			triatsInstance.save(failOnError:true)
        	redirect(controller:"triats",action: "edit", params: [id:triatsInstance.id])
		}
    }

    def delete(Long id) {
        def geneAbstractInstance = GeneAbstract.get(id)
        if (!geneAbstractInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'geneAbstract.label', default: 'GeneAbstract'), id])
            redirect(action: "list")
            return
        }

        try {
            geneAbstractInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'geneAbstract.label', default: 'GeneAbstract'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'geneAbstract.label', default: 'GeneAbstract'), id])
            redirect(action: "show", id: id)
        }
    }
}

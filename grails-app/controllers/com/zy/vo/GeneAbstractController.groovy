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

		
		Triats triats=params.triatsInstanceId=="null"?new Triats().save(failOnError:true):Triats.get(params.triatsInstanceId)
		if(triats){
			triats.addToGeneAbstract(geneAbstractInstance)
			triats.save();
		}
		
        flash.message = message(code: 'default.created.message', args: [message(code: 'geneAbstract.label', default: 'GeneAbstract'), geneAbstractInstance.id])
        redirect(controller:"triats",action: "edit", id: triats.id)
    }
	//药品谱save
	def save1() {
		def geneAbstractInstance = new GeneAbstract(params)
		if (!geneAbstractInstance.save(flush: true)) {
			render(view: "create", model: [geneAbstractInstance: geneAbstractInstance])
			return
		}

		
		DrugResponse triats=params.drugResponseInstanceId=="null"?new DrugResponse().save(failOnError:true):DrugResponse.get(params.drugResponseInstanceId)
		if(triats){
			triats.addToGeneAbstract(geneAbstractInstance)
			triats.save();
		}
		
		flash.message = message(code: 'default.created.message', args: [message(code: 'geneAbstract.label', default: 'GeneAbstract'), geneAbstractInstance.id])
		redirect(controller:"drugResponse",action: "edit", id: triats.id)
	}
	
	//生命谱save
	def save2() {
		def geneAbstractInstance = new GeneAbstract(params)
		if (!geneAbstractInstance.save(flush: true)) {
			render(view: "create", model: [geneAbstractInstance: geneAbstractInstance])
			return
		}

		
		Inherited triats=params.inheritedInstanceId=="null"?new Inherited().save(failOnError:true):Inherited.get(params.inheritedInstanceId)
		if(triats){
			triats.addToGeneAbstract(geneAbstractInstance)
			triats.save();
		}
		
		flash.message = message(code: 'default.created.message', args: [message(code: 'geneAbstract.label', default: 'GeneAbstract'), geneAbstractInstance.id])
		redirect(controller:"inherited",action: "edit", id: triats.id)
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
	
	//re show
	def edit2() {
		Triats triats=params.triatsInstanceId=="null"?new Triats().save(failOnError:true):Triats.get(params.triatsInstanceId)
		def geneAbstractInstance = GeneAbstract.get(params.geneAbstractInstanceId)
		[geneAbstractInstance: geneAbstractInstance,triatsInstanceId:triats.id]
	}
	
	//empty create
	def edit3() {
		Triats triats=params.triatsInstanceId=="null"?new Triats().save(failOnError:true):Triats.get(params.triatsInstanceId)
		def geneAbstractInstance = new GeneAbstract()
		[geneAbstractInstance: geneAbstractInstance,triatsInstanceId:triats.id]
	}
	
	//药品谱empty
	def edit4() {
		DrugResponse triats=params.drugResponseInstanceId=="null"?new DrugResponse().save(failOnError:true):DrugResponse.get(params.drugResponseInstanceId)
		def geneAbstractInstance = new GeneAbstract()
		[geneAbstractInstance: geneAbstractInstance,drugResponseInstanceId:triats.id]
	}

	
	//药品谱edit
	def edit5() {
		DrugResponse triats=params.drugResponseInstanceId=="null"?new DrugResponse().save(failOnError:true):DrugResponse.get(params.drugResponseInstanceId)
		def geneAbstractInstance = GeneAbstract.get(params.geneAbstractInstanceId)
		[geneAbstractInstance: geneAbstractInstance,drugResponseInstanceId:triats.id]
	}
	
	//生命谱empty
	def edit6() {
		Inherited inheritedInstance=params.inheritedInstanceId=="null"?new Inherited().save(failOnError:true):Inherited.get(params.inheritedInstanceId)
		def geneAbstractInstance = new GeneAbstract()
		[geneAbstractInstance: geneAbstractInstance,inheritedInstanceId:inheritedInstance.id]
	}
	
	//生命谱edit
	def edit7() {
		Inherited triats=params.inheritedInstanceId=="null"?new Inherited().save(failOnError:true):Inherited.get(params.inheritedInstanceId)
		def geneAbstractInstance = GeneAbstract.get(params.geneAbstractInstanceId)
		[geneAbstractInstance: geneAbstractInstance,inheritedInstanceId:triats.id]
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
		if(params.drugResponseInstanceId){
			def drugResponse=DrugResponse.get(params.drugResponseInstanceId)
			drugResponse.addToGeneAbstract(geneAbstractInstance)
			drugResponse.save(failOnError:true)
        	redirect(controller:"drugResponse",action: "edit", params: [id:drugResponse.id])
			return
		}
		if(params.triatsInstanceId){
			def triatsInstance=Triats.get(params.triatsInstanceId)
			triatsInstance.addToGeneAbstract(geneAbstractInstance)
			triatsInstance.save(failOnError:true)
        	redirect(controller:"triats",action: "edit", params: [id:triatsInstance.id])
			return
		}
		if(params.inheritedInstanceId){
			def inheritedInstance=Inherited.get(params.inheritedInstanceId)
			inheritedInstance.addToGeneAbstract(geneAbstractInstance)
			inheritedInstance.save(failOnError:true)
			redirect(controller:"inherited",action: "edit", params: [id:inheritedInstance.id])
			return
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

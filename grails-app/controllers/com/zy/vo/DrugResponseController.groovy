package com.zy.vo

import org.springframework.dao.DataIntegrityViolationException

class DrugResponseController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [drugResponseInstanceList: DrugResponse.list(params), drugResponseInstanceTotal: DrugResponse.count()]
    }

    def create() {
        [drugResponseInstance: new DrugResponse(params)]
    }

    def save() {
        def drugResponseInstance = new DrugResponse(params)
        if (!drugResponseInstance.save(flush: true)) {
            render(view: "create", model: [drugResponseInstance: drugResponseInstance])
            return
        }

        flash.message = "创建成功！"
        redirect(action: "list")
    }

    def show(Long id) {
        def drugResponseInstance = DrugResponse.get(id)
        if (!drugResponseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'drugResponse.label', default: 'DrugResponse'), id])
            redirect(action: "list")
            return
        }

        [drugResponseInstance: drugResponseInstance]
    }

    def edit(Long id) {
        def drugResponseInstance = DrugResponse.get(id)
        if (!drugResponseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'drugResponse.label', default: 'DrugResponse'), id])
            redirect(action: "list")
            return
        }

        [drugResponseInstance: drugResponseInstance]
    }

    def update(Long id, Long version) {
        def drugResponseInstance = DrugResponse.get(id)
        if (!drugResponseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'drugResponse.label', default: 'DrugResponse'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (drugResponseInstance.version > version) {
                drugResponseInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'drugResponse.label', default: 'DrugResponse')] as Object[],
                          "Another user has updated this DrugResponse while you were editing")
                render(view: "edit", model: [drugResponseInstance: drugResponseInstance])
                return
            }
        }

        drugResponseInstance.properties = params

        if (!drugResponseInstance.save(flush: true)) {
            render(view: "edit", model: [drugResponseInstance: drugResponseInstance])
            return
        }

        flash.message = "更新成功！"
        redirect(action: "list")
    }

    def delete(Long id) {
        def drugResponseInstance = DrugResponse.get(id)
        if (!drugResponseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'drugResponse.label', default: 'DrugResponse'), id])
            redirect(action: "list")
            return
        }

        try {
            drugResponseInstance.delete(flush: true)
            flash.message = "删除成功！"
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'drugResponse.label', default: 'DrugResponse'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def editDesc(){
		DrugResponse drugResponse=params.drugResponseId=="null"?new DrugResponse(params).save(failOnError:true):DrugResponse.get(params.drugResponseId)
		String type=params.type
		def description
		if(type=="genetics"){
			description=drugResponse.genetics
		}else if(type=="reference"){
			description=drugResponse.reference
		}else if(type=="introduction"){
			description=drugResponse.introduction
		}else{
			println "no type"
		}
		[drugResponse:drugResponse,type:type,description:description]
	}

	def saveDesc(){
		DrugResponse drugResponse=DrugResponse.get(params.drugResponseId)
		String type=params.type
		if(type=="genetics"){
			drugResponse.genetics=params.description
		}else if(type=="reference"){
			drugResponse.reference=params.description
		}else if(type=="introduction"){
			drugResponse.introduction=params.description
		}else{
			println "no type"
		}
		drugResponse.save(failOnError:true)
		redirect(controller:"drugResponse",action:"edit",params:[id:drugResponse.id])
	}
}

package com.zy.vo

import org.springframework.dao.DataIntegrityViolationException

class SNPRelationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [SNPRelationInstanceList: SNPRelation.list(params), SNPRelationInstanceTotal: SNPRelation.count()]
    }

    def create() {
        [SNPRelationInstance: new SNPRelation(params)]
    }

    def save() {
        def SNPRelationInstance = new SNPRelation(params)
        if (!SNPRelationInstance.save(flush: true)) {
            render(view: "create", model: [SNPRelationInstance: SNPRelationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'SNPRelation.label', default: 'SNPRelation'), SNPRelationInstance.id])
        redirect(action: "show", id: SNPRelationInstance.id)
    }

    def show(Long id) {
        def SNPRelationInstance = SNPRelation.get(id)
        if (!SNPRelationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'SNPRelation.label', default: 'SNPRelation'), id])
            redirect(action: "list")
            return
        }

        [SNPRelationInstance: SNPRelationInstance]
    }

    def edit(Long id) {
        def SNPRelationInstance = SNPRelation.get(id)
        if (!SNPRelationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'SNPRelation.label', default: 'SNPRelation'), id])
            redirect(action: "list")
            return
        }

        [SNPRelationInstance: SNPRelationInstance]
    }

    def update(Long id, Long version) {
        def SNPRelationInstance = SNPRelation.get(id)
        if (!SNPRelationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'SNPRelation.label', default: 'SNPRelation'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (SNPRelationInstance.version > version) {
                SNPRelationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'SNPRelation.label', default: 'SNPRelation')] as Object[],
                          "Another user has updated this SNPRelation while you were editing")
                render(view: "edit", model: [SNPRelationInstance: SNPRelationInstance])
                return
            }
        }

        SNPRelationInstance.properties = params

        if (!SNPRelationInstance.save(flush: true)) {
            render(view: "edit", model: [SNPRelationInstance: SNPRelationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'SNPRelation.label', default: 'SNPRelation'), SNPRelationInstance.id])
        redirect(action: "show", id: SNPRelationInstance.id)
    }

    def delete(Long id) {
        def SNPRelationInstance = SNPRelation.get(id)
        if (!SNPRelationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'SNPRelation.label', default: 'SNPRelation'), id])
            redirect(action: "list")
            return
        }

        try {
            SNPRelationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'SNPRelation.label', default: 'SNPRelation'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'SNPRelation.label', default: 'SNPRelation'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def createRelation(){
		def illnessName=params.illnessName
		def username=params.username
		def geneName=params.geneName
		def description1=params.description1
		def description2=params.description2
		def illness=Illness.findByName(illnessName)
		def user=User.findByUsername(username)
		def gene=Gene.findByNameAndDescription1AndDescription2(geneName, description1, description2)
		if(!gene){
			gene=new Gene(
					name:geneName,
					description1:description1,
					description2:description2
					).save(failOnError:true)
		}
		new SNPRelation(
			user:user,
			gene:gene,
			illness:illness
			).save(failOnError:true)
	}
	
}

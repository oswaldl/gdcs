package com.zy.vo

import org.springframework.dao.DataIntegrityViolationException

class IllnessController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [illnessInstanceList: Illness.list(params), illnessInstanceTotal: Illness.count()]
    }

    def create() {
        [illnessInstance: new Illness(params)]
    }

    def save() {
        def illnessInstance = new Illness(params)
        if (!illnessInstance.save(flush: true)) {
            render(view: "create", model: [illnessInstance: illnessInstance])
            return
        }

        flash.message = "创建成功！"
        redirect(action: "list")
    }

    def show(Long id) {
        def illnessInstance = Illness.get(id)
        if (!illnessInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'illness.label', default: 'Illness'), id])
            redirect(action: "list")
            return
        }

        [illnessInstance: illnessInstance]
    }

    def edit(Long id) {
        def illnessInstance = Illness.get(id)
        if (!illnessInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'illness.label', default: 'Illness'), id])
            redirect(action: "list")
            return
        }

        [illnessInstance: illnessInstance]
    }

    def update(Long id, Long version) {
        def illnessInstance = Illness.get(id)
        if (!illnessInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'illness.label', default: 'Illness'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (illnessInstance.version > version) {
                illnessInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'illness.label', default: 'Illness')] as Object[],
                          "Another user has updated this Illness while you were editing")
                render(view: "edit", model: [illnessInstance: illnessInstance])
                return
            }
        }

        illnessInstance.properties = params

        if (!illnessInstance.save(flush: true)) {
            render(view: "edit", model: [illnessInstance: illnessInstance])
            return
        }

        flash.message = "更新成功！"
        redirect(action: "list")
    }

    def delete(Long id) {
        def illnessInstance = Illness.get(id)
        if (!illnessInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'illness.label', default: 'Illness'), id])
            redirect(action: "list")
            return
        }

        try {
            illnessInstance.delete(flush: true)
            flash.message = "删除成功！"
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'illness.label', default: 'Illness'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def getIllness(){
		def string=params.searchString
		def illnessList=new LinkedHashSet<User>()
		illnessList.addAll(Illness.findAllByNameLike("%"+string+"%"))
		illnessList.addAll(Illness.findAllByChineseNameLike("%"+string+"%"))
		[illnessInstanceList:illnessList]
	}
	
	def showDetail(){
		def illnessInstance = Illness.get(params.illnessId)
		int status=Integer.parseInt(params.status)
		User user=User.findByUsername(params.username)
		def snps=SNPRelation.findAllByIllnessAndUser(illnessInstance, user)
		int total=SNPRelation.findAllByUser(user,[sort:'id',order:'asc']).collect {
			it.illness
		}.toSet().size()
		[illnessInstance: illnessInstance,status:status,total:total,username:user.username,snps:snps]
	}
	
	def showDetailByStatus(){
		User user=User.findByUsername(params.username)
		List illnesses=new ArrayList<Illness>()
		SNPRelation.findAllByUser(user,[sort:'id',order:'asc']).collect {
			it.illness
		}.each {
			if(!illnesses.contains(it)){
				illnesses.add(it)
			}
		}
		int status=Integer.parseInt(params.status)
		def illnessInstance=illnesses.get(status)
		def snps=SNPRelation.findAllByIllnessAndUser(illnessInstance, user)
		[illnessInstance: illnessInstance,status:status,total:illnesses.size(),username:user.username,snps:snps]
	}
	
	
	
	def getRisk(Illness illness,User user){
		double sum=0
		SNPRelation.findAllByIllnessAndUser(illness, user).each {
			if(it.oddRatio){
				sum=sum+Double.valueOf(it.oddRatio)
			}
		}
		return sum
	}
	
}

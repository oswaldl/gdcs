package com.zy.vo

import org.springframework.dao.DataIntegrityViolationException

import com.zy.auth.User;

class InheritedConditionsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		def userInstanceList=User.findAllByIsAdmin(false,params)
		[userInstanceList:userInstanceList,userInstanceTotal:User.countByIsAdmin(false,params)]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [inheritedConditionsInstanceList: InheritedConditions.list(params), inheritedConditionsInstanceTotal: InheritedConditions.count()]
    }

    def create() {
        [inheritedConditionsInstance: new InheritedConditions(params)]
    }

    def save() {
        def inheritedConditionsInstance = new InheritedConditions(params)
        if (!inheritedConditionsInstance.save(flush: true)) {
            render(view: "create", model: [inheritedConditionsInstance: inheritedConditionsInstance])
            return
        }

         flash.message = "创建成功！"
        redirect(action: "showAllInheritedConditions", id: User.findByUsername(inheritedConditionsInstance.username).id)
    }

    def show(Long id) {
        def inheritedConditionsInstance = InheritedConditions.get(id)
        if (!inheritedConditionsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inheritedConditions.label', default: 'InheritedConditions'), id])
            redirect(action: "list")
            return
        }

        [inheritedConditionsInstance: inheritedConditionsInstance]
    }

    def edit(Long id) {
        def inheritedConditionsInstance = InheritedConditions.get(id)
        if (!inheritedConditionsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inheritedConditions.label', default: 'InheritedConditions'), id])
            redirect(action: "list")
            return
        }

        [inheritedConditionsInstance: inheritedConditionsInstance]
    }

    def update(Long id, Long version) {
        def inheritedConditionsInstance = InheritedConditions.get(id)
        if (!inheritedConditionsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inheritedConditions.label', default: 'InheritedConditions'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (inheritedConditionsInstance.version > version) {
                inheritedConditionsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'inheritedConditions.label', default: 'InheritedConditions')] as Object[],
                          "Another user has updated this InheritedConditions while you were editing")
                render(view: "edit", model: [inheritedConditionsInstance: inheritedConditionsInstance])
                return
            }
        }

        inheritedConditionsInstance.properties = params

        if (!inheritedConditionsInstance.save(flush: true)) {
            render(view: "edit", model: [inheritedConditionsInstance: inheritedConditionsInstance])
            return
        }

        flash.message = "更新成功！"
        redirect(action: "showAllInheritedConditions", id: User.findByUsername(inheritedConditionsInstance.username).id)
    }

    def delete(Long id) {
        def inheritedConditionsInstance = InheritedConditions.get(id)
		def userId=User.findByUsername(inheritedConditionsInstance.username).id
        if (!inheritedConditionsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inheritedConditions.label', default: 'InheritedConditions'), id])
            redirect(action: "list")
            return
        }

        try {
            inheritedConditionsInstance.delete(flush: true)
            flash.message = "删除成功！"
            redirect(action: "showAllInheritedConditions",id:userId)
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'inheritedConditions.label', default: 'InheritedConditions'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def showAllInheritedConditions(Integer max){
		User user=User.get(params.id)
		params.max = Math.min(max ?: 10, 100)
		def inheritedConditionsInstanceList=InheritedConditions.findAllByUsername(user.username,params)
		[user:user,inheritedConditionsInstanceList:inheritedConditionsInstanceList,inheritedConditionsInstanceTotal:InheritedConditions.countByUsername(user.username,params)]
	}
	
	def getUser(){
		def string=params.searchString
		def users=new LinkedHashSet<User>()
		users.addAll(User.findAllByUsernameLike("%"+string+"%"))
		users.addAll(User.findAllByChineseNameLike("%"+string+"%"))
		[userInstanceList:users]
	}
	
	def getInheritedConditions(){
		def string=params.searchString
		def user=User.findByUsername(params.username)
		def inheritedConditionsInstanceList=new LinkedHashSet<InheritedConditions>()
		inheritedConditionsInstanceList.addAll(InheritedConditions.findAllByUsernameAndNameLike(user.username,"%"+string+"%"))
		[user:user,inheritedConditionsInstanceList:inheritedConditionsInstanceList]
	}
}

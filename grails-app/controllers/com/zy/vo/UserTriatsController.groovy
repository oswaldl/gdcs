package com.zy.vo

import org.springframework.dao.DataIntegrityViolationException

import com.zy.auth.User;

class UserTriatsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		def userInstanceList=User.findAllByIsAdmin(false,params)
		[userInstanceList:userInstanceList,userInstanceTotal:User.countByIsAdmin(false,params)]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userTriatsInstanceList: UserTriats.list(params), userTriatsInstanceTotal: UserTriats.count()]
    }

    def create() {
        [userTriatsInstance: new UserTriats(params)]
    }

    def save() {
        def userTriatsInstance = new UserTriats(params)
        if (!userTriatsInstance.save(flush: true)) {
            render(view: "create", model: [userTriatsInstance: userTriatsInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'userTriats.label', default: 'UserTriats'), userTriatsInstance.id])
        redirect(action: "show", id: userTriatsInstance.id)
    }

    def show(Long id) {
        def userTriatsInstance = UserTriats.get(id)
        if (!userTriatsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userTriats.label', default: 'UserTriats'), id])
            redirect(action: "list")
            return
        }

        [userTriatsInstance: userTriatsInstance]
    }

    def edit(Long id) {
        def triats=Triats.get(params.triatsId)
		def user=User.get(params.userId)
		def userTriatsInstance=UserTriats.findByUsernameAndTriats(user.username,triats)?:new UserTriats(username:user.username,triats:triats).save(failOnError:true)

        [userTriatsInstance: userTriatsInstance]
    }

    def update(Long id, Long version) {
        def userTriatsInstance = UserTriats.get(id)
        if (!userTriatsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userTriats.label', default: 'UserTriats'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userTriatsInstance.version > version) {
                userTriatsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'userTriats.label', default: 'UserTriats')] as Object[],
                          "Another user has updated this UserTriats while you were editing")
                render(view: "edit", model: [userTriatsInstance: userTriatsInstance])
                return
            }
        }

        userTriatsInstance.properties = params

        if (!userTriatsInstance.save(flush: true)) {
            render(view: "edit", model: [userTriatsInstance: userTriatsInstance])
            return
        }

        flash.message = "更新成功！"
		def user=User.findByUsername(userTriatsInstance.username)
        redirect(action: "showAllTriats", id: user.id)
    }

    def delete(Long id) {
        def userTriatsInstance = UserTriats.get(id)
        if (!userTriatsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userTriats.label', default: 'UserTriats'), id])
            redirect(action: "list")
            return
        }

        try {
            userTriatsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'userTriats.label', default: 'UserTriats'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userTriats.label', default: 'UserTriats'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def getUser(){
		def string=params.searchString
		def users=new LinkedHashSet<User>()
		users.addAll(User.findAllByUsernameLike("%"+string+"%"))
		users.addAll(User.findAllByChineseNameLike("%"+string+"%"))
		[userInstanceList:users]
	}
	
	def showAllTriats(Integer max){
		User user=User.get(params.id)
		params.max = Math.min(max ?: 10, 100)
		def triatsList=Triats.list(params)
		[user:user,triatsList:triatsList,triatsInstanceTotal:Triats.count()]
	}
	
	def showDetail(){
		def triats = Triats.get(params.triatId)
		int status=Integer.parseInt(params.status)
		User user=User.findByUsername(params.username)
		def userTriats=UserTriats.findByTriatsAndUsername(triats, user.username)
		int total=UserTriats.findAllByUsername(user.username).collect {
			it.triats
		}.toSet().size()
		
		[userTriatsInstance: userTriats,status:status,total:total,username:user.username]
	}
	
	def showDetailByStatus(){
		User user=User.findByUsername(params.username)
		def userTriats=UserTriats.findAllByUsername(user.username).collect{
			it.triats
		}.toSet().sort{it.id}
		int status=Integer.parseInt(params.status)
		def triatsInstance=userTriats.get(status)
		def userTriatsInstance=UserTriats.findByTriatsAndUsername(triatsInstance, user.username)
		
		[userTriatsInstance: userTriatsInstance,status:status,total:userTriats.size(),username:user.username]
	}
	
}

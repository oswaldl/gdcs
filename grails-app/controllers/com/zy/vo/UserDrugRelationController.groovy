package com.zy.vo

import org.springframework.dao.DataIntegrityViolationException

import com.zy.auth.User;

class UserDrugRelationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		def userInstanceList=User.findAllByIsAdmin(false,params)
		[userInstanceList:userInstanceList,userInstanceTotal:User.countByIsAdmin(false,params)]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userDrugRelationInstanceList: UserDrugRelation.list(params), userDrugRelationInstanceTotal: UserDrugRelation.count()]
    }

    def create() {
        [userDrugRelationInstance: new UserDrugRelation(params)]
    }

    def save() {
        def userDrugRelationInstance = new UserDrugRelation(params)
        if (!userDrugRelationInstance.save(flush: true)) {
            render(view: "create", model: [userDrugRelationInstance: userDrugRelationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'userDrugRelation.label', default: 'UserDrugRelation'), userDrugRelationInstance.id])
        redirect(action: "show", id: userDrugRelationInstance.id)
    }

    def show(Long id) {
        def userDrugRelationInstance = UserDrugRelation.get(id)
        if (!userDrugRelationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userDrugRelation.label', default: 'UserDrugRelation'), id])
            redirect(action: "list")
            return
        }

        [userDrugRelationInstance: userDrugRelationInstance]
    }

    def edit() {
		def drugResponse=DrugResponse.get(params.drugResponseId)
		def user=User.get(params.userId)
		def userDrugRelationInstance=UserDrugRelation.findByUsernameAndDrugResponse(user.username,drugResponse)?:new UserDrugRelation(username:user.username,drugResponse:drugResponse).save(failOnError:true)

        [userDrugRelationInstance: userDrugRelationInstance]
    }

    def update(Long id, Long version) {
        def userDrugRelationInstance = UserDrugRelation.get(id)
        if (!userDrugRelationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userDrugRelation.label', default: 'UserDrugRelation'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userDrugRelationInstance.version > version) {
                userDrugRelationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'userDrugRelation.label', default: 'UserDrugRelation')] as Object[],
                          "Another user has updated this UserDrugRelation while you were editing")
                render(view: "edit", model: [userDrugRelationInstance: userDrugRelationInstance])
                return
            }
        }

        userDrugRelationInstance.properties = params

        if (!userDrugRelationInstance.save(flush: true)) {
            render(view: "edit", model: [userDrugRelationInstance: userDrugRelationInstance])
            return
        }

        flash.message = "更新成功！"
		def user=User.findByUsername(userDrugRelationInstance.username)
        redirect(action: "showAllDrugResponse", id: user.id)
    }

    def delete(Long id) {
        def userDrugRelationInstance = UserDrugRelation.get(id)
        if (!userDrugRelationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userDrugRelation.label', default: 'UserDrugRelation'), id])
            redirect(action: "list")
            return
        }

        try {
            userDrugRelationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'userDrugRelation.label', default: 'UserDrugRelation'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userDrugRelation.label', default: 'UserDrugRelation'), id])
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

	def showAllDrugResponse(Integer max){
		User user=User.get(params.id)
		params.max = Math.min(max ?: 10, 100)
		def drugResponseList=DrugResponse.list(params)
		[user:user,drugResponseInstanceList:drugResponseList,drugResponseInstanceTotal:DrugResponse.count()]
	}
	
	def editDesc(){
		UserDrugRelation userDrugRelation=UserDrugRelation.get(params.userDrugRelationId)
		String type=params.type
		def description
		if(type=="geneData"){
			description=userDrugRelation.geneData
		}else if(type=="oddRatio"){
			description=userDrugRelation.oddRatio
		}else if(type=="geneAbstract"){
			description=userDrugRelation.geneAbstract
		}else{
			println "no type"
		}
		[userDrugRelation:userDrugRelation,type:type,description:description]
	}
	
	def saveDesc(){
		UserDrugRelation userDrugRelation=UserDrugRelation.get(params.userDrugRelationId)
		String type=params.type
		if(type=="geneData"){
			userDrugRelation.geneData=params.description
		}else if(type=="oddRatio"){
			userDrugRelation.oddRatio=params.description
		}else if(type=="geneAbstract"){
			userDrugRelation.geneAbstract=params.description
		}else{
			println "no type"
		}
		userDrugRelation.save(failOnError:true)
		redirect(controller:"userDrugRelation",action:"edit",params:[drugResponseId:userDrugRelation.drugResponse.id,userId:User.findByUsername(userDrugRelation.username).id])
	}
	
	def showDetail(){
		def drugResponse = DrugResponse.get(params.drugResponseId)
		int status=Integer.parseInt(params.status)
		User user=User.findByUsername(params.username)
		def userDrugRelation=UserDrugRelation.findByDrugResponseAndUsername(drugResponse, user.username)
		int total=UserDrugRelation.findAllByUsername(user.username).collect {
			it.drugResponse
		}.toSet().size()
		def maps=new HashMap<String, String>()
		List lists=new ArrayList<String>()
		userDrugRelation?.drugResponse.geneAbstract.types.split(',').each {
			String key=it.split(":")[0]
			String value=it.split(":")[1]
			maps.put(key, value)
			lists.add(key)
		}
		String type=""
		SNPRelation.findAllByUser(user).collect{it.gene}.each {
			if(it.getName(it.name)==userDrugRelation?.drugResponse.geneAbstract.marker){
				type=it.getType(it.name).replaceAll(';', '')
			}
		}
		[maps:maps,lists:lists,type:type,userDrugRelationInstance: userDrugRelation,status:status,total:total,username:user.username]
	}
	
	def showDetailByStatus(){
		User user=User.findByUsername(params.username)
		def drugResponses=UserDrugRelation.findAllByUsername(user.username).collect{
			it.drugResponse
		}.toSet().sort{it.id}
		int status=Integer.parseInt(params.status)
		def drugResponseInstance=drugResponses.get(status)
		def userDrugRelationInstance=UserDrugRelation.findByDrugResponseAndUsername(drugResponseInstance, user.username)
		def maps=new HashMap<String, String>()
		List lists=new ArrayList<String>()
		userDrugRelationInstance?.drugResponse.geneAbstract.types.split(',').each {
			String key=it.split(":")[0]
			String value=it.split(":")[1]
			maps.put(key, value)
			lists.add(key)
		}
		String type=""
		SNPRelation.findAllByUser(user).collect{it.gene}.each {
			if(it.getName(it.name)==userDrugRelationInstance?.drugResponse.geneAbstract.marker){
				type=it.getType(it.name).replaceAll(';', '')
			}
		}
		[maps:maps,lists:lists,type:type,userDrugRelationInstance: userDrugRelationInstance,status:status,total:drugResponses.size(),username:user.username]
	}
}

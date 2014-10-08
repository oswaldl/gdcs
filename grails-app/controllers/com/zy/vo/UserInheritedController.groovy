package com.zy.vo

import org.springframework.dao.DataIntegrityViolationException

import com.zy.auth.User;

class UserInheritedController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userInheritedInstanceList: UserInherited.list(params), userInheritedInstanceTotal: UserInherited.count()]
    }

    def create() {
        [userInheritedInstance: new UserInherited(params)]
    }

    def save() {
        def userInheritedInstance = new UserInherited(params)
        if (!userInheritedInstance.save(flush: true)) {
            render(view: "create", model: [userInheritedInstance: userInheritedInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'userInherited.label', default: 'UserInherited'), userInheritedInstance.id])
        redirect(action: "show", id: userInheritedInstance.id)
    }

    def show(Long id) {
        def userInheritedInstance = UserInherited.get(id)
        if (!userInheritedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userInherited.label', default: 'UserInherited'), id])
            redirect(action: "list")
            return
        }

        [userInheritedInstance: userInheritedInstance]
    }

    def edit(Long id) {
        def userInheritedInstance = UserInherited.get(id)
        if (!userInheritedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userInherited.label', default: 'UserInherited'), id])
            redirect(action: "list")
            return
        }

        [userInheritedInstance: userInheritedInstance]
    }

    def update(Long id, Long version) {
        def userInheritedInstance = UserInherited.get(id)
        if (!userInheritedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userInherited.label', default: 'UserInherited'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userInheritedInstance.version > version) {
                userInheritedInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'userInherited.label', default: 'UserInherited')] as Object[],
                          "Another user has updated this UserInherited while you were editing")
                render(view: "edit", model: [userInheritedInstance: userInheritedInstance])
                return
            }
        }

        userInheritedInstance.properties = params

        if (!userInheritedInstance.save(flush: true)) {
            render(view: "edit", model: [userInheritedInstance: userInheritedInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'userInherited.label', default: 'UserInherited'), userInheritedInstance.id])
        redirect(action: "show", id: userInheritedInstance.id)
    }

    def delete(Long id) {
        def userInheritedInstance = UserInherited.get(id)
        if (!userInheritedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userInherited.label', default: 'UserInherited'), id])
            redirect(action: "list")
            return
        }

        try {
            userInheritedInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'userInherited.label', default: 'UserInherited'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userInherited.label', default: 'UserInherited'), id])
            redirect(action: "show", id: id)
        }
    }
	
	//详细展示
	def showDetail(){
		def inherited = Inherited.get(params.inheritedId)
		int status=Integer.parseInt(params.status)
		User user=User.findByUsername(params.username)
		def userInherited=UserInherited.findByInheritedAndUsername(inherited, user.username)
		int total=UserInherited.findAllByUsername(user.username).collect {
			it.inherited
		}.toSet().size()
		
		def map1=new HashMap<String, Map>()
		def map2=new HashMap<String, List>()
		userInherited?.inherited?.geneAbstract?.each {
			def maps=new HashMap<String, String>()
			List lists=new ArrayList<String>()
			it?.types?.split(",").each {type0->
				String key=type0.split(":")[0]
				String value=type0.split(":")[1]
				maps.put(key, value)
				lists.add(key)
			}
			map1.put(it.name, maps)
			map2.put(it.name, lists)
		}
		
		def map3=new HashMap<String, String>()
		userInherited?.inherited?.geneAbstract?.each {
			String type=""
			SNPRelation.findAllByUser(user).collect{it.gene}.each {gene->
				if(gene.getName(gene.name)==it?.marker){
					type=gene.getType(gene.name).replaceAll(';', '')
				}
			}
			map3.put(it.name, type)
		}
		
		//技术报告
		List lis=new ArrayList<String>()
		if(userInherited?.inherited.oddRatio!=''&&userInherited.inherited.oddRatio!=null){
			userInherited?.inherited?.oddRatio.split(";").each {
				int index1=it.indexOf("(")
				String geneName=it.substring(0, index1)
				Gene gene=Gene.findByNameLike(geneName+"(%")
				String types=it.substring(index1+1, it.indexOf(")"))
				String type=""
				types.split(",").each {typeCon->
					if(typeCon.split(":")[0]==gene.getType(gene.name).replace(";", "")){
						type=typeCon.split(":")[1]
					}
				}
				String spn=geneName+","+gene.getType(gene.name)+","+type
				lis.add(spn)
			}
		}
		
		[lis:lis,map1:map1,map2:map2,map3:map3,userInheritedInstance: userInherited,status:status,total:total,username:user.username]
	}
	
	def showDetailByStatus(){
		User user=User.findByUsername(params.username)
		def userInheriteds=UserInherited.findAllByUsername(user.username).collect{
			it.inherited
		}.toSet().sort{it.id}
		int status=Integer.parseInt(params.status)
		def inherited=userInheriteds.get(status)
		def userInheritedInstance=UserInherited.findByInheritedAndUsername(inherited, user.username)
		
		def map1=new HashMap<String, Map>()
		def map2=new HashMap<String, List>()
		userInheritedInstance?.inherited?.geneAbstract?.each {
			def maps=new HashMap<String, String>()
			List lists=new ArrayList<String>()
			it?.types?.split(",").each {type0->
				String key=type0.split(":")[0]
				String value=type0.split(":")[1]
				maps.put(key, value)
				lists.add(key)
			}
			map1.put(it.name, maps)
			map2.put(it.name, lists)
		}
		def map3=new HashMap<String, String>()
		userInheritedInstance?.inherited?.geneAbstract.each {
			String type=""
			SNPRelation.findAllByUser(user).collect{it.gene}.each {gene->
				if(gene.getName(gene.name)==it?.marker){
					type=gene.getType(gene.name).replaceAll(';', '')
				}
			}
			map3.put(it.name, type)
		}
		
		//技术报告
		List lis=new ArrayList<String>()
		if(userInheritedInstance?.inherited.oddRatio!=''&&userInheritedInstance.inherited.oddRatio!=null){
			userInheritedInstance?.inherited?.oddRatio.split(";").each {
				int index1=it.indexOf("(")
				String geneName=it.substring(0, index1)
				Gene gene=Gene.findByNameLike(geneName+"(%")
				String types=it.substring(index1+1, it.indexOf(")"))
				String type=""
				types.split(",").each {typeCon->
					if(typeCon.split(":")[0]==gene.getType(gene.name).replace(";", "")){
						type=typeCon.split(":")[1]
					}
				}
				String spn=geneName+","+gene.getType(gene.name)+","+type
				lis.add(spn)
			}
		}
		
		[lis:lis,map1:map1,map2:map2,map3:map3,userInheritedInstance: userInheritedInstance,status:status,total:userInheriteds.size(),username:user.username]
	}
	
}

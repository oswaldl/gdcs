package com.zy.vo

import org.springframework.dao.DataIntegrityViolationException

import com.zy.auth.User

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
	//展示单个病例
	def showIllness(){
		def illnessInstance = Illness.get(params.illnessId)
		User user=User.findByUsername(params.username)
		def snps=SNPRelation.findAllByIllnessAndUser(illnessInstance, user)
		[illnessInstance: illnessInstance,username:user.username,snps:snps,risk:getRisk(illnessInstance,user)]
	}
	
	//通过名字模糊查询病例
	def getIllness(){
		def string=params.searchString
		def illnessList=new LinkedHashSet<Illness>()
		illnessList.addAll(Illness.findAllByNameLike("%"+string+"%"))
		illnessList.addAll(Illness.findAllByChineseNameLike("%"+string+"%"))
		[illnessInstanceList:illnessList]
	}
	//显示病例详细，通过列表查找过来的
	def showDetail(){
		def illnessInstance = Illness.get(params.illnessId)
		int status=Integer.parseInt(params.status)
		User user=User.findByUsername(params.username)
		def snps=SNPRelation.findAllByIllnessAndUser(illnessInstance, user)
		int total=SNPRelation.findAllByUser(user).collect {
			it.illness
		}.toSet().size()
		[illnessInstance: illnessInstance,status:status,total:total,username:user.username,snps:snps,risk:getRisk(illnessInstance,user)]
	}
	//显示病例详细，通过上一个下一个查找过来
	def showDetailByStatus(){
		User user=User.findByUsername(params.username)
		def illnesses=SNPRelation.findAllByUser(user).collect {
			it.illness
		}.toSet().sort{it.id}
		int status=Integer.parseInt(params.status)
		def illnessInstance=illnesses.get(status)
		def snps=SNPRelation.findAllByIllnessAndUser(illnessInstance, user)
		[illnessInstance: illnessInstance,status:status,total:illnesses.size(),username:user.username,snps:snps,risk:getRisk(illnessInstance,user)]
	}
	//获得风险等级
	def getRisk(Illness illness,User user){
		double sum=0
		SNPRelation.findAllByIllnessAndUser(illness, user).each {
			if(it.oddRatio){
				sum=sum+Double.valueOf(it.oddRatio)
			}
		}
		double averageRisk=illness.getRisk()
		double risk=(double)Math.round(sum*averageRisk*100)/100
		return risk
	}
	//获得所有高风险病例
	def showHighAll(){
		Map<Illness, Double> map=new HashMap<Illness, Double>()
		List illnesses=new ArrayList<Illness>()
		User user=User.findByUsername(params.username)
		SNPRelation.findAllByUser(user).collect {
			it.illness
		}.toSet().sort{it.getMagnitude()}.each {
			if(RiskRank.getHighRisk(getRisk(it,user)-it.getRisk())){
				map.put(it, getRisk(it,user))
				illnesses.add(it)
			}
		}
		[illnesses:illnesses,map:map,username:user.username]
	}
	//获得所有低风险病例
	def showLowAll(){
		Map<Illness, Double> map=new HashMap<Illness, Double>()
		List illnesses=new ArrayList<Illness>()
		User user=User.findByUsername(params.username)
		SNPRelation.findAllByUser(user).collect {
			it.illness
		}.toSet().sort{it.getMagnitude()}.each {
			if(RiskRank.getLowRisk(getRisk(it,user)-it.getRisk())){
				map.put(it, getRisk(it,user))
				illnesses.add(it)
			}
		}
		[illnesses:illnesses,map:map,username:user.username]
	}
	//获得一般风险病例
	def showNormalAll(){
		Map<Illness, Double> map=new HashMap<Illness, Double>()
		List illnesses=new ArrayList<Illness>()
		User user=User.findByUsername(params.username)
		SNPRelation.findAllByUser(user).collect {
			it.illness
		}.toSet().sort{it.getMagnitude()}.each {
			if(RiskRank.getNormalRisk(getRisk(it,user)-it.getRisk())){
				map.put(it, getRisk(it,user))
				illnesses.add(it)
			}
		}
		[illnesses:illnesses,map:map,username:user.username]
	}

}

package com.zy.vo

import org.springframework.dao.DataIntegrityViolationException

class RiskRankController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        [riskRankInstance: RiskRank.findAll().get(0)]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [riskRankInstanceList: RiskRank.list(params), riskRankInstanceTotal: RiskRank.count()]
    }

    def create() {
        [riskRankInstance: new RiskRank(params)]
    }

    def save() {
        def riskRankInstance = new RiskRank(params)
        if (!riskRankInstance.save(flush: true)) {
            render(view: "create", model: [riskRankInstance: riskRankInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'riskRank.label', default: 'RiskRank'), riskRankInstance.id])
        redirect(action: "show", id: riskRankInstance.id)
    }

    def show(Long id) {
        def riskRankInstance = RiskRank.get(id)
        if (!riskRankInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'riskRank.label', default: 'RiskRank'), id])
            redirect(action: "list")
            return
        }

        [riskRankInstance: riskRankInstance]
    }

    def edit(Long id) {
        def riskRankInstance = RiskRank.get(id)
        if (!riskRankInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'riskRank.label', default: 'RiskRank'), id])
            redirect(action: "list")
            return
        }

        [riskRankInstance: riskRankInstance]
    }

    def update(Long id, Long version) {
        def riskRankInstance = RiskRank.get(id)
        if (!riskRankInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'riskRank.label', default: 'RiskRank'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (riskRankInstance.version > version) {
                riskRankInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'riskRank.label', default: 'RiskRank')] as Object[],
                          "Another user has updated this RiskRank while you were editing")
                render(view: "edit", model: [riskRankInstance: riskRankInstance])
                return
            }
        }

        riskRankInstance.high=Double.valueOf(params.high)
        riskRankInstance.low=Double.valueOf(params.low)

        if (!riskRankInstance.save(flush: true)) {
            render(view: "edit", model: [riskRankInstance: riskRankInstance])
            return
        }

        flash.message = "更新成功！"
        redirect(action: "index")
    }

    def delete(Long id) {
        def riskRankInstance = RiskRank.get(id)
        if (!riskRankInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'riskRank.label', default: 'RiskRank'), id])
            redirect(action: "list")
            return
        }

        try {
            riskRankInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'riskRank.label', default: 'RiskRank'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'riskRank.label', default: 'RiskRank'), id])
            redirect(action: "show", id: id)
        }
    }
}

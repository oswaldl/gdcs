package com.zy.vo

import org.springframework.dao.DataIntegrityViolationException

class CrawlRecordController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [crawlRecordInstanceList: CrawlRecord.list(params), crawlRecordInstanceTotal: CrawlRecord.count()]
    }

    def create() {
        [crawlRecordInstance: new CrawlRecord(params)]
    }

    def save() {
        def crawlRecordInstance = new CrawlRecord(params)
        if (!crawlRecordInstance.save(flush: true)) {
            render(view: "create", model: [crawlRecordInstance: crawlRecordInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'crawlRecord.label', default: 'CrawlRecord'), crawlRecordInstance.id])
        redirect(action: "show", id: crawlRecordInstance.id)
    }

    def show(Long id) {
        def crawlRecordInstance = CrawlRecord.get(id)
        if (!crawlRecordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'crawlRecord.label', default: 'CrawlRecord'), id])
            redirect(action: "list")
            return
        }

        [crawlRecordInstance: crawlRecordInstance]
    }

    def edit(Long id) {
        def crawlRecordInstance = CrawlRecord.get(id)
        if (!crawlRecordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'crawlRecord.label', default: 'CrawlRecord'), id])
            redirect(action: "list")
            return
        }

        [crawlRecordInstance: crawlRecordInstance]
    }

    def update(Long id, Long version) {
        def crawlRecordInstance = CrawlRecord.get(id)
        if (!crawlRecordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'crawlRecord.label', default: 'CrawlRecord'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (crawlRecordInstance.version > version) {
                crawlRecordInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'crawlRecord.label', default: 'CrawlRecord')] as Object[],
                          "Another user has updated this CrawlRecord while you were editing")
                render(view: "edit", model: [crawlRecordInstance: crawlRecordInstance])
                return
            }
        }

        crawlRecordInstance.properties = params

        if (!crawlRecordInstance.save(flush: true)) {
            render(view: "edit", model: [crawlRecordInstance: crawlRecordInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'crawlRecord.label', default: 'CrawlRecord'), crawlRecordInstance.id])
        redirect(action: "show", id: crawlRecordInstance.id)
    }

    def delete(Long id) {
        def crawlRecordInstance = CrawlRecord.get(id)
        if (!crawlRecordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'crawlRecord.label', default: 'CrawlRecord'), id])
            redirect(action: "list")
            return
        }

        try {
            crawlRecordInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'crawlRecord.label', default: 'CrawlRecord'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'crawlRecord.label', default: 'CrawlRecord'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def createCrawlRecord(){
//		def username=map.get("username")
//		def url1=map.get("url1")
//		def url2=map.get("url2")
		def username=params.username
		def url1=params.url1
		def url2=params.url2
		println "username:"+username.getClass()+"-url1:"+url1.getClass()+"-url2:"+url2.getClass()
		if(!CrawlRecord.findByUsernameAndUrl1AndUrl2(username, url1, url2)){
			new CrawlRecord(
				username:username,
				url1:url1,
				url2:url2
				).save(failOnError:true)
		}
	}
	
	def testSave(){
		CrawlRecord.create("username", "url1", "url2")
	}
}

package com.zy.system

import com.zy.auth.User;

class ConsoleController {
	def springSecurityService
	def myPdfService
	
    def index() {
		User user=springSecurityService.getCurrentUser()
		if(!user.isAdmin){
			redirect(controller:"showResult",action:"index")
			return 
		}
	}
	
	/**
	 * params.url
	 * params.filename
	 * @return
	 */
	def export2Pdf(){
		try{
			byte[] b
			def baseUri = request.scheme + "://" + request.serverName + ":" + request.serverPort + grailsAttributes.getApplicationUri(request)
			def content = g.include(controller:'showResult', action:'index', id:'gd')
			b = myPdfService.buildPdfFromString(content.readAsString(), baseUri + (params.url ?: ""))
			
			
			//这里是下载的方式，可以修改为文件的方式，而且写入可以是多个的
			response.setContentType("application/pdf")
			response.setHeader("Content-disposition", "attachment; filename=" + (params.filename ?: "document.pdf"))
			response.setContentLength(b.length)
			response.getOutputStream().write(b)
		}
		catch (Throwable e) {
			println "there was a problem with PDF generation ${e}"
			//if(params.template) render(template:params.template)
			if(params.pdfController) redirect(controller:params.pdfController, action:params.pdfAction, params:params)
			else redirect(uri:params.url + '?' + request.getQueryString())
		}
	}
}

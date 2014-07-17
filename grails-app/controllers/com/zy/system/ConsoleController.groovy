package com.zy.system

import java.nio.ByteBuffer

import com.zy.auth.User

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
			def content = g.include(controller:'showResult', action:'index')
			b = myPdfService.buildPdfFromString(content.readAsString(), baseUri + (params.url ?: ""))
			
			
			//这里是下载的方式
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
	
	/**
	 * 写文件方式
	 * @return
	 */
	def write2Pdf(){
		try{
			
			def baseUri = request.scheme + "://" + request.serverName + ":" + request.serverPort + grailsAttributes.getApplicationUri(request)
			def content = g.include(controller:'showResult', action:'index')
			byte[] b1 = myPdfService.buildPdfFromString(content.readAsString(), baseUri + (params.url ?: ""))
			File file1 = new File((params.filepath ?: "/root//Documents/document1.pdf"));
			file1<<b1
			
			//尝试第二个页面，这里用测试页面
			content = g.include(controller:'pdf', action:'demo2')
			byte[] b2 = myPdfService.buildPdfFromString(content.readAsString(), baseUri + (params.url ?: ""))
			File file2 = new File((params.filepath ?: "/root//Documents/document2.pdf"));
			file2<<b2
			
			
			render "please check "+file1.getPath()
		}
		catch (Throwable e) {
			println "there was a problem with PDF generation ${e}"
			//if(params.template) render(template:params.template)
			if(params.pdfController) redirect(controller:params.pdfController, action:params.pdfAction, params:params)
			else redirect(uri:params.url + '?' + request.getQueryString())
		}
	}
}

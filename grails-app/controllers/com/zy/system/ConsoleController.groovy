package com.zy.system

import com.lowagie.text.Document
import com.lowagie.text.pdf.PdfCopy
import com.lowagie.text.pdf.PdfImportedPage
import com.lowagie.text.pdf.PdfReader
import com.zy.auth.User
import com.zy.vo.SNPRelation
import com.zy.vo.UserDrugRelation
import com.zy.vo.UserTriats
import org.apache.log4j.Logger;

class ConsoleController {
	def springSecurityService
	def myPdfService
	Logger logger = Logger.getLogger(getClass());
	
	/**
	 * 既然要写死，就不要放在方法里面
	 */
	//生成的单个pdf存放路径，合并后会被删除
	String filePath="C:/Documents"
	//合并后的pdf
	String resultPDF="C:/Documents/MergeFile/temp.pdf"
	
	
    def index() {
		User user=springSecurityService.getCurrentUser()
		if(!user.isAdmin){
			redirect(controller:"showResult",action:"index")
			return 
		}
	}
	
	def fileUpload(){}
	
	def upload={
		//myFile对应表单中input type=“file”的name值
		def f = request.getFile("myFile");
		//判断是否等到文件
		if(!f.empty){
			//获得原始的文件名
			String fileName=f.getOriginalFilename();
			//获得文件的大小（默认单位是B）和类型
			println(new Date().toString()+"--name:"+fileName+";size:"+(f.size/1024)+"kb;type:"+f.contentType);
			//文件要保存在哪个目录
			String filePath="C:/evn/apache-tomcat-7.0.54/webapps/";
			
			//开始写入
			f.transferTo(new File(filePath+fileName));
			
			render("上传成功！");
	    }else {
		  	render("上传失败！");
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
			logger.error("error!", e)
			//if(params.template) render(template:params.template)
			if(params.pdfController) redirect(controller:params.pdfController, action:params.pdfAction, params:params)
			else redirect(uri:params.url + '?' + request.getQueryString())
		}
	}
	
	
	/**
	 * 写文件方式
	 * @return
	 */
	@Deprecated
	def write2Pdf(){
		try{
			
			def baseUri = request.scheme + "://" + request.serverName + ":" + request.serverPort + grailsAttributes.getApplicationUri(request)
			def content = g.include(controller:'showResult', action:'index',params:[username:"mike"])
			def contentStr= content.readAsString()
			byte[] b1 = myPdfService.buildPdfFromString(contentStr, baseUri + (params.url ?: ""))
			File file1 = new File((params.filepath ?: "D:/Documents/document1.pdf"));
			file1<<b1
			
			//尝试第二个页面，这里用测试页面
			content = g.include(controller:'pdf', action:'demo2')
			byte[] b2 = myPdfService.buildPdfFromString(content.readAsString(), baseUri + (params.url ?: ""))
			File file2 = new File((params.filepath ?: "D:/Documents/document2.pdf"));
			file2<<b2
			
			//合并下载文件
			mergePDF()
		}catch (Throwable e) {
			logger.error("error!", e)
			//if(params.template) render(template:params.template)
			if(params.pdfController) redirect(controller:params.pdfController, action:params.pdfAction, params:params)
			else redirect(uri:params.url + '?' + request.getQueryString())
		}
	}
	
	//删除filePath文件夹中生成的pdf
	def delPDF(String filePath){
		File root = new File(filePath);
		File[] files = root.listFiles();
		for (File file : files) {
			if (!file.isDirectory()) {
				//file为pdf文件
				file.delete()
			}
		}
	}
	
	//合并文件夹filePath中的所有pdf，生成新的一个pdf（D:/Documents/MergeFile/temp.pdf），删除所有的单个pdf，下载
	private boolean mergePDF(){
		List<String> lis=new ArrayList<String>()
		File root = new File(filePath);
		File[] files = root.listFiles();
		
		
		for (File file : files) {
			if (!file.isDirectory()) {
				//file为pdf文件
				if(file.getPath().endsWith(".pdf"))
					lis.add(file.getPath())
			}
		}
		
		List<String> list3 = lis.toArray(new String[lis.size()])
		Collections.sort(list3, new Comparator<String>() {
			@Override
			public int compare(String o1, String o2) {
				return o1.compareTo(o2);
			}
		});
		
		boolean b=mergePdfFiles(list3)
		return b
		
	}
	
	//合并pdf，根据文件路径合并
	private boolean mergePdfFiles(List<String> files) {
		boolean retValue = false;
		Document document = null;
		try {
			document = new Document(new PdfReader(files.get(0)).getPageSize(1));
			PdfCopy copy = new PdfCopy(document, new FileOutputStream(resultPDF));
			document.open();
			for (int i = 0; i < files.size(); i++) {
				PdfReader reader = new PdfReader(files.get(i));
				int n = reader.getNumberOfPages();
				for (int j = 1; j <= n; j++) {
					document.newPage();
					PdfImportedPage page = copy.getImportedPage(reader, j);
					copy.addPage(page);
				}
			}
			retValue = true;
		} catch (Exception e) {
			logger.error("error!", e)
		} finally {
			if(document!=null){
				document.close();
			}
			
		}
		return retValue;
	}
	
	
	
	
	//下载完整的PDF,参数username要下载的用户名
	def downloadPdf(){
		User user=User.findByUsername(params.username)
		
		if(!user){
			render "no such user "+params.username
			return;
		}
		
		try{
			generateSinglePdfs(user);
			
			println "trying to merge pdf..."
			//合并pdf
			boolean b=mergePDF()
			
			//删除生成的单个pdf
			delPDF(filePath)
			
			//合并成功就下载
			if(b){
				response.setHeader("Content-disposition", "attachment; filename=gdcs.pdf")
				response.contentType = "application/x-rarx-rar-compressed"
				
				def out = response.outputStream
				InputStream inputStream = new FileInputStream(resultPDF)
				byte[] buffer = new byte[1024]
				int j = -1
				while ((j = inputStream.read(buffer)) != -1) {
				out.write(buffer, 0, j)
				}
				out.flush()
				out.close()
				inputStream.close()
				
			}else{
				render "失败"
			}
		}catch (Throwable e) {
			logger.error("error!", e)
			if(params.pdfController) {
				println "error:"+params.pdfController
				redirect(controller:params.pdfController, action:params.pdfAction, params:params)
			}else if(params.url) {
				println "url:"+params.url
				redirect(uri:params.url + '?' + request.getQueryString())
			}
			else {
				render "there was a problem with PDF generation ${e}"
			}
		}
		
	}
	
	/**
	 * 生成许多单个pdf文件
	 * @param user
	 */
	private void generateSinglePdfs(def user){
		//先生成多个单个的pdf，然后在合并，合并完成后将单个的全部删除
		def baseUri = request.scheme + "://" + request.serverName + ":" + request.serverPort + grailsAttributes.getApplicationUri(request)
		
		def content
		int i=0
		byte[] b2
		File file2
		
		//首页
		content = g.include(controller:'showResult', action:'index',params:[username:user.username,inPDF:true])
		byte[] b1 = myPdfService.buildPdfFromString(content.readAsString(), baseUri + (params.url ?: ""))
		File file1 = new File(filePath+"/documentA0.pdf");
		file1<<b1
		
		
		//病例页面
		def illnesses=SNPRelation.findAllByUser(user).collect {
			it.illness
		}.toSet().sort{it.id}
		
		
		//高风险
		content = g.include(controller:'illness', action:'showHighAll',params:[illnessId:illnesses.get(i).id,username:user.username,inPDF:true])
		b2 = myPdfService.buildPdfFromString(content.readAsString(), baseUri + (params.url ?: ""))
		file2 = new File(filePath+"/documentA1.pdf");
		file2<<b2
		
		//低风险
		content = g.include(controller:'illness', action:'showLowAll',params:[illnessId:illnesses.get(i).id,username:user.username,inPDF:true])
		b2 = myPdfService.buildPdfFromString(content.readAsString(), baseUri + (params.url ?: ""))
		file2 = new File(filePath+"/documentA2.pdf");
		file2<<b2
		
		//一般风险
		content = g.include(controller:'illness', action:'showNormalAll',params:[illnessId:illnesses.get(i).id,username:user.username,inPDF:true])
		b2 = myPdfService.buildPdfFromString(content.readAsString(), baseUri + (params.url ?: ""))
		file2 = new File(filePath+"/documentA3.pdf");
		file2<<b2
		
		
		
		//病例
		for(i=0;i<illnesses.size();i++){
			content = g.include(controller:'illness', action:'showIllness',params:[illnessId:illnesses.get(i).id,username:user.username,inPDF:true])
			b2 = myPdfService.buildPdfFromString(content.readAsString(), baseUri + (params.url ?: ""))
			file2 = new File(filePath+"/documentB"+i+".pdf");
			file2<<b2
		}
		
		//show pic
		content = g.include(controller:'userDrugRelation', action:'showPic')
		b2 = myPdfService.buildPdfFromString(content.readAsString(), baseUri + (params.url ?: ""))
		file2 = new File(filePath+"/documentB"+i+".pdf");
		file2<<b2
		
		//药物页面
		def drugResponses=UserDrugRelation.findAllByUsername(user.username).collect{
			it.drugResponse
		}.toSet().sort{it.id}
		for(i=0;i<drugResponses.size();i++){
			println "in drug..."+i
			content = g.include(controller:'userDrugRelation', action:'showDetail',params:[drugResponseId:drugResponses.get(i).id,username:user.username,status:"0",inPDF:true])
			b2 = myPdfService.buildPdfFromString(content.readAsString(), baseUri + (params.url ?: ""))
			file2 = new File(filePath+"/documentC"+i+".pdf");
			file2<<b2
		}
		
		//show pic
		content = g.include(controller:'userTriats', action:'showPic')
		b2 = myPdfService.buildPdfFromString(content.readAsString(), baseUri + (params.url ?: ""))
		file2 = new File(filePath+"/documentC"+i+".pdf");
		file2<<b2
		
		//个性普页面
		def userTriats=UserTriats.findAllByUsername(user.username).collect{
			it.triats
		}.toSet().sort{it.id}
		for(i = 0;i<userTriats.size();i++){
			println "in userTriats..."+i
			content = g.include(controller:'userTriats', action:'showDetail',params:[triatId:userTriats.get(i).id,username:user.username,status:"0",inPDF:true])
			b2 = myPdfService.buildPdfFromString(content.readAsString(), baseUri + (params.url ?: ""))
			file2 = new File(filePath+"/documentD"+i+".pdf");
			file2<<b2
		}
		
		//测试使用
//		for(;i<2;i++){
//			content = g.include(controller:'illness', action:'showIllness',params:[illnessId:illnesses.get(i).id,username:user.username,inPDF:true])
//			b2 = myPdfService.buildPdfFromString(content.readAsString(), baseUri + (params.url ?: ""))
//			file2 = new File(filePath+"/document"+i+".pdf");
//			file2<<b2
//		}
	}
	
	
}

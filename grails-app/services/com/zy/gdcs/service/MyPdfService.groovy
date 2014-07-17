package com.zy.gdcs.service

import org.xhtmlrenderer.pdf.ITextRenderer

import com.lowagie.text.pdf.BaseFont

class MyPdfService {
	
	byte[] buildPdf(url) {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ITextRenderer renderer = new ITextRenderer();
		try {

			// step 3 解决中文支持
			org.xhtmlrenderer.pdf.ITextFontResolver fontResolver = renderer
					.getFontResolver();
			fontResolver.addFont("file:/root/Downloads/simsun.ttc", BaseFont.IDENTITY_H,
					BaseFont.NOT_EMBEDDED);


			renderer.setDocument(url);
			renderer.layout();
			renderer.createPDF(baos);
			byte[] b = baos.toByteArray();
			return b
		}
		catch (Throwable e) {
			log.error e
		}
	}
	
	byte[] buildPdfFromString(content, baseUri) {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ITextRenderer renderer = new ITextRenderer();
		try {
  
			// step 3 解决中文支持
			org.xhtmlrenderer.pdf.ITextFontResolver fontResolver = renderer
					.getFontResolver();
			fontResolver.addFont("file:/root/Downloads/simsun.ttc", BaseFont.IDENTITY_H,
					BaseFont.NOT_EMBEDDED);
  
			renderer.setDocumentFromString(content, baseUri);
			renderer.layout();
			renderer.createPDF(baos);
			byte[] b = baos.toByteArray();
			return b
		}
		catch (Throwable e) {
			log.error e
		}
	}
}

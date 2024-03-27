package kh.finalpro.project.collegian.controller;

import java.io.IOException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import com.lowagie.text.DocumentException;

import kh.finalpro.project.collegian.model.dto.Certificate;
import kh.finalpro.project.collegian.model.service.CertificateService;
//import org.xhtmlrenderer.extend.FontResolver;
//import org.xhtmlrenderer.pdf.ITextRenderer;
//import org.xhtmlrenderer.pdf.ITextFontResolver;
//import com.lowagie.text.pdf.BaseFont;
//import kh.finalpro.project.collegian.model.dto.Task;
//import kh.finalpro.project.common.util.Util;
//import com.itextpdf.html2pdf.ConverterProperties;
//import com.itextpdf.html2pdf.attach.impl.layout.HtmlPageBreak;
//import com.itextpdf.io.font.FontProgram;
//import com.itextpdf.io.font.FontProgramFactory;
//import com.itextpdf.kernel.geom.PageSize;
//import com.itextpdf.kernel.pdf.PdfDocument;
//import com.itextpdf.kernel.pdf.PdfWriter;
//import com.itextpdf.layout.Document;
//import com.itextpdf.layout.element.AreaBreak;
//import com.itextpdf.layout.element.IBlockElement;
//import com.itextpdf.layout.element.IElement;
//import com.itextpdf.layout.font.FontProvider;
//import com.itextpdf.layout.property.AreaBreakType;
//import javax.servlet.http.HttpServletRequest;
//import java.io.File;
//import java.net.URLEncoder;
//import java.util.List;
import kh.finalpro.project.collegian.model.service.CollegianService;
import kh.finalpro.project.main.model.dto.Member;


// 증명서 컨트롤러
@Controller
@RequestMapping("/collegian")
@SessionAttributes("loginMember")
public class CertificateController {
	
	
	@Autowired
	private CertificateService service;
	
	
	@GetMapping("/certificate/{no:[1-5]{1}}")
	public String generatePdf( HttpSession session
			,@PathVariable("no") int no
			,@SessionAttribute Member loginMember
			,Model model
			,@RequestParam(value="upNo", required = false, defaultValue = "0") int upNo) throws IOException, DocumentException{
		
		Certificate certificate = null;
		
		certificate = service.certificateAction(loginMember,session,no,upNo);
		
		
		model.addAttribute("certificate",certificate);
		
		return "/collegian/studentIDPage";
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/* 유틸 class로 이동
	 * private void convertHtmlToPdf(String htmlContent, HttpSession session, String
	 * originPdfName) throws IOException, DocumentException {
	 * 
	 * 
	 * Document document = null;
	 * 
	 * Task task = new Task();
	 * 
	 * String staticPath = session.getServletContext().getRealPath("/resources"); //
	 * 리소스 고정 경로 얻어옴
	 * 
	 * // Set Font File normalFont = new File(staticPath + "/fonts" +
	 * "/NanumBarunGothic.ttf"); File boldFont = new File(staticPath + "/fonts" +
	 * "/NanumGothicBold.ttf");
	 * 
	 * //String originPdfName = "testorigin";
	 * 
	 * task.setFileName(originPdfName); // 파일 원본명
	 * 
	 * String pdfName = Util.fileRename(originPdfName); // 파일명 변환
	 * 
	 * task.setFileRename(pdfName); // 변환명 세팅
	 * 
	 * String downloadPath =
	 * session.getServletContext().getRealPath("/resources/files/backup");
	 * 
	 * String baseUrl =
	 * session.getServletContext().getRealPath("/resources/files/");
	 * 
	 * // Set Pdf Info pdfName = URLEncoder.encode(pdfName, "UTF-8");
	 * 
	 * // 1. Check already Pdf File File pdfFile = new File(downloadPath + "/" +
	 * pdfName + ".pdf");
	 * 
	 * if(pdfFile.exists()) pdfFile.delete();
	 * 
	 * // 2. Set Font ConverterProperties properties = new ConverterProperties();
	 * FontProvider fontProvider = new FontProvider(); FontProgram fontProgram =
	 * FontProgramFactory.createFont(normalFont.getAbsolutePath()); FontProgram
	 * boldFontProgram = FontProgramFactory.createFont(boldFont.getAbsolutePath());
	 * 
	 * fontProvider.addFont(fontProgram); fontProvider.addFont(boldFontProgram);
	 * properties.setFontProvider(fontProvider); properties.setBaseUri(baseUrl);
	 * 
	 * // 3. Set Pdf Page Size List<IElement> elements =
	 * HtmlConverter.convertToElements(htmlContent, properties);
	 * com.itextpdf.kernel.pdf.PdfDocument pdfDoc = new PdfDocument(new
	 * PdfWriter(pdfFile)); document = new Document(pdfDoc);
	 * 
	 * pdfDoc.setDefaultPageSize(PageSize.A4);
	 * 
	 * document.setMargins(50, 50, 50, 50);
	 * 
	 * for (IElement element : elements) { if (element instanceof HtmlPageBreak) {
	 * document.add(new AreaBreak(AreaBreakType.LAST_PAGE)); } else {
	 * document.add((IBlockElement) element); } }
	 * 
	 * document.close();
	 * 
	 * }
	 */
            
	
}


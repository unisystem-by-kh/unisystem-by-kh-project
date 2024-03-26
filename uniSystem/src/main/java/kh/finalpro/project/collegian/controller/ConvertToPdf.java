package kh.finalpro.project.collegian.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Base64;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;
import org.xhtmlrenderer.extend.FontResolver;
import org.xhtmlrenderer.pdf.ITextRenderer;
import org.xhtmlrenderer.pdf.ITextFontResolver;

import com.lowagie.text.DocumentException;
import com.lowagie.text.pdf.BaseFont;




import com.itextpdf.html2pdf.ConverterProperties;
import com.itextpdf.html2pdf.HtmlConverter;
import com.itextpdf.html2pdf.attach.impl.layout.HtmlPageBreak;
import com.itextpdf.io.font.FontProgram;
import com.itextpdf.io.font.FontProgramFactory;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.AreaBreak;
import com.itextpdf.layout.element.IBlockElement;
import com.itextpdf.layout.element.IElement;
import com.itextpdf.layout.font.FontProvider;
import com.itextpdf.layout.property.AreaBreakType;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.net.URLEncoder;
import java.util.List;



@Controller
public class ConvertToPdf {
	
	@Autowired
	private  TemplateEngine templateEngine;
	
	
	@GetMapping("/testPdf")
	public void generatePdf(HttpServletResponse response , HttpSession session ) throws IOException, DocumentException{
		
		// HTML 생성
        Context context = new Context();
        context.setVariable("name", "차준형");
        context.setVariable("memberNo", "17-73037996");
        String htmlContent = templateEngine.process("pdfTemplate", context);

        // HTML을 PDF로 변환
        //byte[] pdfBytes = convertHtmlToPdf(htmlContent,session);
        
        Document document = convertHtmlToPdf(htmlContent,session);
        

        // HTTP 응답에 PDF 전송
        //response.setContentType("application/pdf");
        //response.setHeader("Content-Disposition", "attachment; filename=\"output.pdf\"");
        //response.setContentLength(pdfBytes.length);
        //response.getOutputStream().write(document); 
        
		
	}
	
	private Document convertHtmlToPdf(String htmlContent, HttpSession session) throws IOException, DocumentException {
		try (ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {
			
//			ITextRenderer renderer = new ITextRenderer();
//			
//			String path = session.getServletContext().getRealPath("/resources/fonts/NanumBarunGothic.ttf");
//            
//            // 폰트 설정
//            ITextFontResolver resolver = renderer.getFontResolver();
//            Resource resource = new ClassPathResource(path);
//            
//            byte[] fontBytes = org.springframework.util.StreamUtils.copyToByteArray(resource.getInputStream());
//            String fontBase64 = Base64.getEncoder().encodeToString(fontBytes);
//            resolver.addFont("data:font/truetype;base64," + fontBase64, true);
//
//            renderer.setDocumentFromString(htmlContent);
//            
//            renderer.layout();
//            
//            renderer.createPDF(outputStream);
//            
//            return outputStream.toByteArray();
			
			
			Document document = null;
			
			String staticPath = session.getServletContext().getRealPath("/resources");
					
			// Set Font
	        File normalFont = new File(staticPath + "/fonts" + "/NanumBarunGothic.ttf");
	        File boldFont = new File(staticPath + "/fonts" + "/NanumBarunGothic.ttf");
	        
	        String pdfName = "test";
	        
	        String downloadPath = session.getServletContext().getRealPath("/resources/files");
	        
	        String baseUrl = session.getServletContext().getRealPath("/resources/files");
	        
	        // Set Pdf Info
	        String originPdfName = "testorigin";
	        pdfName = URLEncoder.encode(pdfName, "UTF-8");

	        // 1. Check already Pdf File
	        File pdfFile = new File(downloadPath + "/" + pdfName + ".pdf");

	        if(pdfFile.exists()) pdfFile.delete();

	        // 2. Set Font
	        ConverterProperties properties = new ConverterProperties();
	        FontProvider fontProvider = new FontProvider();
	        FontProgram fontProgram = FontProgramFactory.createFont(normalFont.getAbsolutePath());
	        FontProgram boldFontProgram = FontProgramFactory.createFont(boldFont.getAbsolutePath());

	        fontProvider.addFont(fontProgram);
	        fontProvider.addFont(boldFontProgram);
	        properties.setFontProvider(fontProvider);
	        properties.setBaseUri(baseUrl);

	        // 3. Set Pdf Page Size
	        List<IElement> elements = HtmlConverter.convertToElements(htmlContent, properties);
	        com.itextpdf.kernel.pdf.PdfDocument pdfDoc = new PdfDocument(new PdfWriter(pdfFile));
	        document = new Document(pdfDoc);

	        pdfDoc.setDefaultPageSize(PageSize.A4);

	        document.setMargins(50, 50, 50, 50);

	        for (IElement element : elements) {
	            if (element instanceof HtmlPageBreak) {
	                document.add(new AreaBreak(AreaBreakType.LAST_PAGE));
	            }
	            else {
	                document.add((IBlockElement) element);
	            }
	        }

	        document.close();
	        
	        return document;
	    }		
            
	}
}


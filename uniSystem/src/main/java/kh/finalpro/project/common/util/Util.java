package kh.finalpro.project.common.util;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.itextpdf.html2pdf.ConverterProperties;
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
import com.lowagie.text.DocumentException;
import com.itextpdf.html2pdf.HtmlConverter;

import kh.finalpro.project.collegian.model.dto.Task;

public class Util {
		
	// Cross Site Scripting(XSS) 방지 처리
	// - 웹 애플리케이션에서 발생하는 취약점
	// - 권한이 없는 사용자가 사이트에 스크립트를 작성하는 것
	public static String XSSHandling(String content) {

		// 스크립트나 마크업 언어에서 기호나 기능을 나타내는 문자를 변경 처리

		// & - &amp;
		// < - &lt;
		// > - &gt;
		// " - &quot;

		content = content.replaceAll("&", "&amp;");
		content = content.replaceAll("<", "&lt;");
		content = content.replaceAll(">", "&gt;");
		content = content.replaceAll("\"", "&quot;");

		return content;
	}

	// 파일명 변경 메소드
	public static String fileRename(String originFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));

		int ranNum = (int) (Math.random() * 100000); // 5자리 랜덤 숫자 생성

		String str = "_" + String.format("%05d", ranNum);

		String ext = originFileName.substring(originFileName.lastIndexOf("."));

		return date + str + ext;
	}
	
	
	
	// HTML -> PDF 변환 메소드
	public static String convertHtmlToPdf(String htmlContent, HttpSession session, String originPdfName, String baseUrl) throws IOException, DocumentException {
		
		Document document = null;
		
		Task task = new Task();
		
		String staticPath = session.getServletContext().getRealPath("/resources"); // 리소스 고정 경로 얻어옴
				
		// Set Font
        File normalFont = new File(staticPath + "/fonts" + "/NanumBarunGothic.ttf");
        File boldFont = new File(staticPath + "/fonts" + "/NanumGothicBold.ttf");
        
        
        task.setFileName(originPdfName); // 파일 원본명
        
        String pdfName = Util.fileRename(originPdfName); // 파일명 변환
        
        task.setFileRename(pdfName); // 변환명 세팅
        
        
        String downloadPath = baseUrl; // 저장 경로
        
        // Set Pdf Info
        pdfName = URLEncoder.encode(pdfName, "UTF-8");

        // 1. Check already Pdf File
        File pdfFile = new File(downloadPath+ pdfName);

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
        
        return pdfName;
        
    }		

}
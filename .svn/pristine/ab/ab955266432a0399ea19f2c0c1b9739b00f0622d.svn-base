package los.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import los.board.service.IBoardService;
import los.board.service.IBoardServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

@Component("downloadView")
public class FileDownloadView extends AbstractView {
	//컨트롤러 메서드
	//mav.addObject("downloadFile", downloadFile");
	//renderMergedOutputModel(Map<String, Object>) 으로 전달.	
	@Autowired
	private IBoardService service;
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> map,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		File downloadFile = (File) map.get("downloadFile");
			String fileName = new String(downloadFile.getName().getBytes("utf-8"), "8859_1");		
			response.setContentType("application/octet-stream");
			response.setContentLength((int) downloadFile.length());
			fileName = fileName.substring(0, fileName.lastIndexOf("_")) + "." + fileName.split("\\.")[1];
			//다운로드창 출력
			
			response.setHeader("Content-Disposition", "attachment;filename="+fileName);
			
			BufferedInputStream fin = null;
			BufferedOutputStream fout = null;
			
				try{
					byte[] buffer = new byte[2048];
					
					fin = new BufferedInputStream(new FileInputStream(downloadFile));		
					fout = new BufferedOutputStream(response.getOutputStream());
					
					int read= -1;		
					while((read=fin.read(buffer))!=-1){
						fout.write(buffer);
					}
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					fin.close();
					fout.close();
				}
			}
	
	
}

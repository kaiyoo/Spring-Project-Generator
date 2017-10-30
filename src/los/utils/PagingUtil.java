package los.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;

public class PagingUtil {
	private int currentPage;		// 페이징 처리를 위한 대상 페이지
	private int totalCount;			// 전체 게시글 갯수
	private int totalPage;			// 전체 페이징 갯수
	private int blockCount;			// 페이지당 출력될 게시글 갯수
	private int blockPage;			// 페이지당 출력될 네비게이션 메뉴 갯수
	private int startCount;			// 페이지 내 게시글 시작번호 
	private int endCount;			// 페이지 내 게시글 종료번호

	// 이전 | 1 | 2 | 3 | 4 | 5 | 다음
	private int startPage;			// 페이지 네비게이션 메뉴의 시작 페이지 번호
	private int endPage;			// 페이지 네비게이션 메뉴의 종료 페이지 번호

	private String param = "";
	private String pageVariableName;
	private StringBuffer pageHtml = new StringBuffer();
	
	public PagingUtil(int currentPage, int totalCount, 
			int blockCount, int blockPage, HttpServletRequest request) {

		this.totalCount = totalCount;
		this.blockCount = blockCount;
		this.blockPage = blockPage;
		this.currentPage = currentPage;
		
		// totalCount : 101
		// blockCount : 10
		// 		=> totalPage : 11
		this.totalPage = (int) Math.ceil((double)this.totalCount / (double)this.blockCount);
		
		if(this.totalCount == 0) {
			this.totalCount = 1;
		}
		
		// 해당 페이지에 출력될 게시글의 시작|종료 게시글 번호
		this.startCount = this.totalCount - (this.currentPage - 1) * this.blockCount;
		this.endCount = this.startCount - this.blockCount + 1;
		
		if(this.endCount < 0) {
			this.endCount = 1;
		}
		// 1클릭시 boardList.jsp?currentPage=1
		// 1클릭시 boardList.jsp?currentPage=2
		// 이전 | 1 | 2 | 3 | 4 | 5 | 다음  <page1 ~ page5>
		// 이전 | 6 | 7 | 8 | 9 | 10 | 다음 <page6 ~ page10>
		this.startPage = ((this.currentPage - 1) / this.blockPage * this.blockPage) + 1;
		this.endPage = this.startPage + this.blockPage - 1;
		
		if(this.endPage > this.totalPage) {
			this.endPage = this.totalPage;
		}
		
		// boardList.jsp
		// boardList.jsp?search_keycode=[ALL|TITLE|CONTENT]&search_keyword=값
		// boardList.jsp?currentPage=2
		// boardList.jsp?currentPage=2&search_keycode=[ALL|TITLE|CONTENT]&search_keyword=값
		String requestUri = request.getRequestURI();
		if(StringUtils.isBlank(pageVariableName)) {
			this.pageVariableName = "currentPage";
		}
		
		Enumeration<String> paramEnums = request.getParameterNames();
		
		while(paramEnums.hasMoreElements()) {
			// currentpage | search_keycode | search_keyword
			String name = paramEnums.nextElement();
			if(!this.pageVariableName.equals(name)) {
				String[] values = request.getParameterValues(name);
				for(String value : values) {
					try {
						// search_keycode=ALL&search_keyword=값&
						this.param += name + "=" + URLEncoder.encode(value, "UTF-8") + "&";
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
				}
			}
		}
		
		// 이전 | 
//		if((this.currentPage - 1) != 0) {
//			// boardList.jsp?currentPage=2&search_keycode=ALL&search_keyword=값&currentpage=2
//			this.pageHtml.append("&nbsp;<a href=\"" + requestUri + "?" + this.param + 
//												this.pageVariableName + "="	+ (this.currentPage - 1) + "\">" +
//												"<img src=\"" + request.getContextPath() + "/image/btn_back01.gif\"></a>&nbsp;");
//		} else {
//			this.pageHtml.append("&nbsp;<img src=\"" + request.getContextPath() + "/image/btn_back01.gif\">&nbsp;");
//		}
		//---------------------------
//		if(this.totalPage > this.blockPage) {
//			if(this.currentPage > this.blockPage) {	
//				// boardList.jsp?currentPage=2&search_keycode=ALL&search_keyword=값&currentpage=2
//				this.pageHtml.append("&nbsp;<a href=\"" + requestUri + "?" + this.param + 
//						this.pageVariableName + "="	+ (this.currentPage - this.blockPage) + "\">" +
//						"[이전]</a>&nbsp;");
//			} 
//		}
		if(this.totalPage > this.blockPage) {
			if(this.currentPage > this.blockPage) {	
				// boardList.jsp?currentPage=2&search_keycode=ALL&search_keyword=값&currentpage=2
				this.pageHtml.append("<li><a href=\"" + requestUri + "?" + this.param + 
						this.pageVariableName + "="	+ (this.currentPage - this.blockPage) + "\">" +
						"&laquo;</a></li>");
			} 
		}
			
		// blockPage 1|2|3|4|5
		for(int i = this.startPage; i <= this.endPage; i++) {
			if(this.currentPage == i) {
				this.pageHtml.append("<li class=\"active\"><a href=\"#\">" + i + "</a></li>");
			} else {
				this.pageHtml.append("<li><a href=\"" + requestUri + "?" + this.param + 
												this.pageVariableName + "=" + i + "\">" + i + "</a></li>");
			}
//			if(i != this.endPage) {
//				this.pageHtml.append("|&nbsp;");
//			}
		}
		
//		this.pageHtml.append("|&nbsp;");
		
		// | 다음 
//		if(this.currentPage < this.totalPage) {
//			// boardList.jsp?currentPage=2&search_keycode=ALL&search_keyword=값&currentpage=2
//			this.pageHtml.append("&nbsp;<a href=\"" + requestUri + "?" + this.param + 
//												this.pageVariableName + "="	+ (this.currentPage + 1) + "\">" +
//												"<img src=\"" + request.getContextPath() + "/image/btn_next01.gif\"></a>&nbsp;");
//		} else {
//			this.pageHtml.append("&nbsp;<img src=\"" + request.getContextPath() + "/image/btn_next01.gif\">&nbsp;");
//		}
		if(this.totalPage > this.blockPage) {
			if(this.currentPage < (this.totalPage - 5)) {
				this.pageHtml.append("<li><a href=\"" + requestUri + "?" + this.param + 
						this.pageVariableName + "="	+ ((this.currentPage + this.blockPage) > this.totalPage ? this.totalPage : (this.currentPage + this.blockPage))+ "\">" +
						"&raquo;</a></li>");
			} 
		}
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public int getStartCount() {
		return startCount;
	}

	public int getEndCount() {
		return endCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public String getParam() {
		return param;
	}

	public String getPageVariableName() {
		return pageVariableName;
	}

	public StringBuffer getPageHtml() {
		return pageHtml;
	}
	
}

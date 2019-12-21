package pack.utility;

import org.springframework.stereotype.Component;
/*
	페이징 처리를 위한 클래스입니다.
	필요한 추가적인 변수는 멤버변수로 선언하세요.
	
	멤버 변수 설명
	1. page => 현재 페이지
	2. start => DB에서 가져올 때 사용하는 limit 시작 값
	3. length => DB에서 가져올 때 사용하는 limit 길이
	4. pageLength => 게시글 하단에 뿌려질 목록 길이
	5. totalPage => 전체 페이지 수
	6. startPage => 게시글 하단의 시작값
	7. endPage => 게시글 하단의 마지막 값
	8. pageNum => DB의 num이 아닌 사용자에게 보여주기 위한 정렬값
	9. totalRows => 전체 행 수
	10. currentBlock => 게시글 하단의 현재 블럭
	11. totalBlock => 게시글 하단의 전체 블럭
	
	꼭 세팅해줘야할 것들 (메서드를 이용하시면 알아서 세팅됩니다)
	page
	length
	pageLength
	totalRows
*/
@Component
public class Pagination {
	private int page,start,length,pageLength,totalPage,startPage,endPage,pageNum,totalRows,currentBlock,totalBlock;
	
	private String b_cno;
	
	private String b_num;
	
	private String m_num;
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int page,int length) {
		this.start = (page - 1) * length;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public int getPageLength() {
		return pageLength;
	}

	public void setPageLength(int pageLength) {
		this.pageLength = pageLength;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalRows,int length) {
		int totalPage = totalRows % length == 0 ? totalRows / length : totalRows / length + 1;
		if (totalPage == 0) {
			totalPage = 1;
		}
		this.totalPage = totalPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int currentBlock,int pageLength) {
		this.startPage = 1 + (currentBlock - 1) * pageLength;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int currentBlock,int pageLength) {
		int endPage = pageLength + (currentBlock - 1) * pageLength;
		if (currentBlock == totalBlock) {
			endPage = totalPage;
		}
		this.endPage = endPage;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int totalRows,int page,int length) {
		this.pageNum = totalRows + (page-1)*(-length);
	}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public int getCurrentBlock() {
		return currentBlock;
	}

	public void setCurrentBlock(int page,int pageLength) {
		this.currentBlock = page % pageLength == 0 ? page / pageLength : page / pageLength + 1;
	}

	public int getTotalBlock() {
		return totalBlock;
	}

	public void setTotalBlock(int totalPage,int pageLength) {
		this.totalBlock = totalPage % pageLength == 0 ? totalPage / pageLength : totalPage / pageLength + 1;
	}

	public String getB_cno() {
		return b_cno;
	}

	public void setB_cno(String b_cno) {
		this.b_cno = b_cno;
	}
	
	public String getB_num() {
		return b_num;
	}

	public void setB_num(String b_num) {
		this.b_num = b_num;
	}

	public String getM_num() {
		return m_num;
	}

	public void setM_num(String m_num) {
		this.m_num = m_num;
	}

	public void paginationSetting(int page,int length,int pageLength,int totalRows) {
		setPage(page);
		setLength(length);
		setStart(page,length);
		setTotalRows(totalRows);
		setPageNum(totalRows,page,length);
		setTotalPage(totalRows,length);
		setCurrentBlock(page,pageLength);
		setTotalBlock(totalPage,pageLength);
		setStartPage(currentBlock,pageLength);
		setEndPage(currentBlock,pageLength);
	}
	
}

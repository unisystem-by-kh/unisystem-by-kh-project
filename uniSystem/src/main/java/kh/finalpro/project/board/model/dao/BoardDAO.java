package kh.finalpro.project.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalpro.project.board.model.dto.Board;
import kh.finalpro.project.board.model.dto.BoardFile;
import kh.finalpro.project.board.model.dto.Pagination;
import kh.finalpro.project.main.model.dto.Member;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;



	// -----------------------게시판 목록 조회------------------------------------

	/** 게시판 목록 조회 (공지사항, 자유게시판, 1:1 문의, 학과공지, 자료실)
	 * @param pagination
	 * @param categoryNo
	 * @return boardList
	 */
	public List<Board> selectBoardList(Pagination pagination, int categoryNo) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		
		RowBounds rowBounds;
		
		if(categoryNo == 1 || categoryNo == 5) {
			rowBounds = new RowBounds(offset, pagination.getLimit()+5); // 공지사항, 자료실
		}else {
			rowBounds = new RowBounds(offset, pagination.getLimit()); // 자유게시판, 1:1 문의, 학과공지
		}

		return sqlSession.selectList("boardMapper.selectBoardList", categoryNo, rowBounds); // 공지사항, 자료실

  	}

	// ---------------------------------------------------------------------

	// ---------------------게시판 목록 조회(검색)----------------------------

	/** 게시판 목록 검색
	 * @param pagination
	 * @param paramMap
	 * @return boardList
	 */
	public List<Board> selelctBoardList(Pagination pagination, Map<String, Object> paramMap) {

		// 1) offset 계산
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		// 2) RowBounds 객체 생성
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		

		return sqlSession.selectList("boardMapper.selectBoardList_search", paramMap, rowBounds); // 전체
	}

	// ----------------------------게시판 카운트(다 있어야 함)-----------------------------
	/**
	 * 자유 게시판의 게시글 삭제 되지 않은 게시글 수 조회
	 * @param boardCode
	 * @return listCount
	 */
	public int getListCount(int categoryNo) {
		return sqlSession.selectOne("boardMapper.getListCount", categoryNo);
	}
	/** 자유 게시판의 게시글 수 조회(검색)
	 * @param paramMap
	 * @return listCount
	 */
	public int getListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("boardMapper.getListCount_search", paramMap);
	}
	/** 1:1문의 검색 게시글 갯수 조회
	 * @param paramMap
	 * @return
	 */
	public int getListCountInquiry(Map<String, Object> paramMap) {
		return sqlSession.selectOne("boardMapper.getListCount_inquiry", paramMap);
	}
	// ---------------------------------------------------------------------

	// ----------------------------게시판 상세 조회-----------------------------

	/** 자유게시판 상세 조회
	 * @param map
	 * @return map
	 */
	public Board selectFreeBoard(Map<String, Object> map) {
		return sqlSession.selectOne("boardMapper.selectFreeBoard" , map);
	}

	/** 1:1문의 상세 조회
	 * @param map
	 * @return board
	 */
	public Board selectInquiryBoard(Map<String, Object> map) {
		return sqlSession.selectOne("boardMapper.selectInquiryBoard", map);
	}


	// ----------------------------------------------------------------------------



	/** 게시판 종류 목록 조회 DAO
	 * @return boardTypeList
	 */
	public List<Map<String, Object>> selectCategory() {
		return sqlSession.selectList("boardMapper.selectCategory");
	}

	

	/** 자유게시판 게시글 조회수 증가
	 * @param boardNo
	 * @return result
	 */
	public int updateReadCount(int boardNo) {
		return sqlSession.update("boardMapper.updateReadCount" , boardNo);
	}


	public List<String> selectFileList(int boardNo) {
		return sqlSession.selectList("boardMapper.selectImageListAll", boardNo);
	}

	

	
	
	
	
	
	/** 1:1문의 작성
	 * @param board
	 * @return boardNo
	 */
	public int inquiryBoardWrite(Board board) {
		
		int result = sqlSession.insert("boardMapper.inquiryBoardWrite", board);
		
		if(result > 0) {
			result = board.getBoardNo();
		}
		
		return result;
	}

	/** 1:1문의 파일 업로드
	 * @param uploadList
	 * @return
	 */
	public int insertInquiryFile(List<BoardFile> uploadList) {
		return sqlSession.insert("boardMapper.insertInquiryFile", uploadList);
	}

	/** 게시글에 존재하는 파일 조회
	 * @param boardNo
	 * @return boardFile
	 */
	public List<BoardFile> selectBoardFile(int boardNo) {
		return sqlSession.selectList("boardMapper.selectBoardFile", boardNo);
	}

	/** 자료실 상세
	 * @param boardNo
	 * @return board
	 */
	public Board boardDataDetail(int boardNo) {
		return sqlSession.selectOne("boardMapper.boardDataDetail", boardNo);
	}

	/** 1:1문의 게시글 삭제
	 * @param boardNo
	 * @return
	 */
	public int inquiryBoardDelete(int boardNo) {
		System.out.println(boardNo);
		return sqlSession.update("boardMapper.inquiryBoardDelete", boardNo);
	}

	/** 1:1문의 게시글 수정
	 * @param board
	 * @return
	 */
	public int inquiryBoardUpdate(Board board) {
		return sqlSession.update("boardMapper.inquiryBoardUpdate", board);
	}

	/** 1:1문의 파일 삭제
	 * @param deleteMap
	 * @return
	 */
	public int inquiryFileDelete(Map<String, Object> deleteMap) {
		return sqlSession.delete("boardMapper.inquiryBoardDelete", deleteMap);
	}

	/** 1:1문의 파일 수정
	 * @param img
	 * @return
	 */
	public int inquiryFileUpdate(BoardFile img) {
		return sqlSession.update("boardMapper.inquiryFileUpdate", img);
	}

	/** 1:1문의 파일 삽입
	 * @param img
	 * @return
	 */
	public int inquiryFileInsert(BoardFile img) {
		return sqlSession.insert("boardMapper.inquiryFileInsert", img);
	}

	
	
	

	/** 공지사항 상세페이지
	 * @param map
	 * @return board
	 */
	public Board noticeDetailBoard(Map<String, Object> map) {
		return sqlSession.selectOne("boardMapper.noticeDetailBoard", map);
	}

	/** 공지사항 작성 페이지
	 * @param board
	 * @return
	 */
	public int noticeboardInsert(Board board) {
		int result = sqlSession.insert("boardMapper.noticeboardInsert", board);
		
		// 삽입 성공 시
		if(result > 0) result = board.getBoardNo();
		return result;
	}
	
	/** 공지사항 파일리스트
	 * @param uploadList
	 * @return
	 */
	public int noticeBoardFile(List<BoardFile> uploadList) {
		return sqlSession.insert("boardMapper.insertFileList", uploadList);
	}

	/** 1:1문의 비밀번호 확인
	 * @param map
	 * @return
	 */
	public int boardCheck(Map<String, Object> map) {
		return sqlSession.selectOne("boardMapper.boardCheck", map);
	}

	/** 학과공지 파일 업로드
	 * @param uploadList
	 * @return
	 */
	public int insertDepartmentFile(List<BoardFile> uploadList1) {
		return sqlSession.insert("boardMapper.insertDepartmentFile", uploadList1);
	}

	/** 학과공지 이미지 업로드
	 * @param uploadList2
	 * @return 
	 */
	public int insertDepartmentImage(List<BoardFile> uploadList2) {
		return sqlSession.insert("boardMapper.insertDepartmentImage", uploadList2);
	}

 	/** 학과공지 수정 
	 * @param board
	 * @return
	 */
	public int departmentBoardUpdate(Board board) {
		return sqlSession.update("boardMapper.updateDepartmentBoard", board);
	}

	public List<Member> selectMemberList(Member loginMember) {
		return sqlSession.selectList("memberMapper.selectMemberList", loginMember);
	}


	public int inquiryImageUpdate(BoardFile img2) {
		return sqlSession.update("boardMapper.inquiryImageUpdate", img2);
	}

	public int inquiryImageInsert(BoardFile img2) {
		return sqlSession.insert("boardMapper.inquiryImageInsert", img2);

	}


	}


	/** 자유게시판 수정
	 * @param board
	 * @return 
	 */
	public int freeBoardUpdate(Board board) {
		System.out.println(board);
		return sqlSession.update("boardMapper.updateFreeBoardList", board);
	}

	public int freeBoardDelete(int boardNo) {
		return sqlSession.delete("boardMapper.freeBoardDelete", boardNo);

	}

	public int freeFileDelete(Map<String, Object> deleteMap) {
		return sqlSession.delete("boardMapper.freeFileDelete", deleteMap);
	}

	public int freeFileUpdate(BoardFile img) {
		return sqlSession.update("boardMapper.freeFileUpdate", img);
	}

	public int freeFileInsert(BoardFile img) {
		return sqlSession.insert("boardMapper.freeFileInsert", img);
	}
	

	

	
}

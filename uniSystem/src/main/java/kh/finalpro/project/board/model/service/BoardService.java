package kh.finalpro.project.board.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileUploadException;
import org.springframework.web.multipart.MultipartFile;

import kh.finalpro.project.board.model.dto.Board;
import kh.finalpro.project.board.model.dto.BoardFile;
import kh.finalpro.project.main.model.dto.Member;

/**
 * @author user1
 *
 */
public interface BoardService {

	
	/** 게시판 종류 목록 조회 Service
	 * @return List 
	 */
	List<Map<String, Object>> selectCategory();
	
	
	/**
	 * 게시판 목록
	 * @param boardCode
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selelctBoardList(int categoryNo, int cp);

	
	/** 자유게시판 목록(검색)
	 * @param paramMap
	 * @param cp
	 * @return map
	 */
	Map<String, Object> searchFreeBoardList(Map<String, Object> paramMap, int cp);


	/** 1 : 1 문의 목록(검색)
	 * @param paramMap
	 * @param cp
	 * @return
	 */
	Map<String, Object> selectinquiryBoardList(Map<String, Object> paramMap, int cp);


	/** 자유게시판 상세 목록 조회
	 * @param map
	 * @return freeBoard
	 */
	Board selectFreeBoard(Map<String, Object> map);


	/** 자유게시판 조회수 증가
	 * @param boardNo
	 * @return result
	 */
	int updateReadCount(int boardNo);

	
	/** DB에 있는 이미지(파일) 목록 조회
	 * @return dbImageList
	 */
	List<String> selectFileList(int boardNo);

	

	/** 1:1문의 상세페이지
	 * @param map
	 * @return board
	 */
	Board selectInquiryBoard(Map<String, Object> map);
  
	
	
	/** 1:1문의 작성
	 * @param board
	 * @param file
	 * @param webPath
	 * @param filePath
	 * @return
	 */
	int inquiryBoardWrite(Board board, List<MultipartFile> file, String webPath, String filePath) throws IllegalStateException, IOException;
	
	

	/** 공지사항 목록 검색
	 * @param paramMap
	 * @param cp
	 * @return boardList
	 */
	Map<String, Object> selelctBoardList(Map<String, Object> paramMap, int cp);


	/** 1:1문의 게시글 삭제
	 * @param boardNo
	 * @return
	 */
	int inquiryBoardDelete(int boardNo);

 
	/** 1:1문의 게시글 수정
	 * @param board
	 * @param file
	 * @param webPath
	 * @param filePath
	 * @param deleteList
	 * @return
	 */
	int inquiryBoardUpdate(Board board, List<MultipartFile> file, String webPath, String filePath, String deleteList) throws IllegalStateException, IOException;


	/** 자료실 상세
	 * @param boardNo
	 * @return board
	 */
	Board boardDataDetail(int boardNo);


	/** 게시글에 존재하는 파일
	 * @param boardNo
	 * @return boardFile
	 */
	List<BoardFile> selectBoardFile(int boardNo);


	/** 공지사항 상세조회 
	 * @param map
	 * @return board
	 */
	Board noticeDetailBoard(Map<String, Object> map);


	/** 공지사항 작성 페이지
	 * @param board
	 * @param files
	 * @param webPath
	 * @param filePath
	 * @return boardNo
	 */
	int noticeboardWrite(Board board, List<MultipartFile> files, String webPath, String filePath)throws IllegalStateException, IOException;
	
  
  
	/** 자유게시판 수정
	 * @param board
	 * @param images
	 * @param webPath
	 * @param filePath
	 * @return boardNo
	 * @param deleteList
	 * @return rowCount
	 */
	int freeBoardUpdate(Board board, List<MultipartFile> file, String webPath, String filePath, String deleteList) throws IllegalStateException, IOException;


	int boardCheck(Map<String, Object> map);


	/** 학과공지 작성 페이지
	 * @param board
	 * @param file
	 * @param images
	 * @param webPath
	 * @param filePath
	 * @return boardNo
	 */
	int departmentBoardInsert(Board board, List<MultipartFile> file, List<MultipartFile> images, String webPath,
			String filePath) throws IllegalStateException, IOException;

 
	/** 학과공지 수정
	 * @param board
	 * @param file
	 * @param webPath
	 * @param filePath
	 * @param images
	 * @return
	 */
	int departmentBoardUpdate(Board board, List<MultipartFile> file, String webPath, String filePath,
			List<MultipartFile> images)throws IllegalStateException, IOException;


	List<Member> selectMemberList(Member loginMember);


	int freeBoardDelete(int boardNo);


	List<Board> selectMainBoard();


	/** 공지사항 수정
	 * @param board
	 * @param file
	 * @param webPath
	 * @param filePath
	 * @param deleteList
	 * @return
	 */
	int noticeBoardUpdate(Board board, List<MultipartFile> file, String webPath, String filePath, String deleteList) throws IllegalStateException, IOException;


	/** 공지사항 게시물 삭제
	 * @param boardNo
	 * @return
	 */
	int noticeBoardDelete(int boardNo);







}

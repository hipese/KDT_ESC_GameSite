package controller;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

//import dto.FilesDTO;
import constants.Constants;
import dao.BoardDAO;
import dao.FilesDAO;
import dao.MembersDAO;
//import dao.FilesDAO;
import dao.ReplyDAO;
import dto.BoardDTO;
import dto.FilesDTO;
import dto.MembersDTO;
import dto.ReplyDTO;

@WebServlet("*.board")
public class BoardController extends HttpServlet {
	MembersDAO mdao=MembersDAO.getInstance();
	BoardDAO dao = BoardDAO.getInstance();
	ReplyDAO rdao = ReplyDAO.getInstance();
	FilesDAO fdao = FilesDAO.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf8");
		request.setCharacterEncoding("utf8");
		
		String cmd = request.getRequestURI();
		System.out.println("요청 URI:" + cmd);
		Gson gson=new Gson();
		try {
			if (cmd.equals("/write.board")) {
				Timestamp date = new Timestamp(System.currentTimeMillis());
				int view_count = 0;
				PrintWriter pw = response.getWriter();

//				파일 첨부 기능
				System.out.println("Realpath : " + request.getServletContext().getRealPath(""));
				String uploadPath = request.getServletContext().getRealPath("files");
				File filePath = new File(uploadPath);
				if (!filePath.exists()) {
					filePath.mkdir();
				} // 파일을 업로드 할 폴더 생성
				int maxSize = 1024 * 1024 * 10; // 업로드 파일 최대 사이즈 10mb 제한

//
				MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "utf8",
						new DefaultFileRenamePolicy());

				Enumeration<String> fileNames = multi.getFileNames();

				String writer = (String) request.getSession().getAttribute("loginID");
				String title = multi.getParameter("title");
				String contents = multi.getParameter("contents");
				
				System.out.println(title+" : "+contents);
			
				int parentseq = dao.writeWord(new BoardDTO(0, writer, title, contents, date, view_count, 0, 0));

				while (fileNames.hasMoreElements()) { // ResultSet의 next()와 같은 역할
					String fileName = fileNames.nextElement();

					if (multi.getFile(fileName) != null) {

						String ori_name = multi.getOriginalFileName(fileName); // file : input type="file"의 name
						String sys_name = multi.getFilesystemName(fileName); // file : input type="file"의 name
						FilesDTO dto = new FilesDTO(0, ori_name, sys_name, parentseq);
						fdao.insert(dto);
						pw.append("/files/"+sys_name);
						System.out.println("파일 저장 완료");
					}
				}

				System.out.println("전송된 데이터: " + writer + " ," + title + " ," + contents + " ,");

				System.out.println("파일의 부모 seq값:" + parentseq);

				List<BoardDTO> boardlist = dao.getBoardList();

				request.getSession().setAttribute("boardlist", boardlist);

			} else if (cmd.equals("/showContents.board")) {
				
				String searchText = request.getParameter("searchText");
				int seq = Integer.parseInt(request.getParameter("seq"));
				
				
//				댓글에 현제 페이지를 저장하는 로직
				String cpageParam = request.getParameter("cpage");
				
				System.out.println("cpageParam의 값"+cpageParam);
				int replynaviseq;

				if (cpageParam == null) {
					replynaviseq=1;
				}else {
					replynaviseq = Integer.parseInt(cpageParam);
				}
				
				System.out.println("replynaviseq의 값"+replynaviseq);
				
				boolean isWriterCheck;
				System.out.println("클릭한 번호:  " + seq);

				List<FilesDTO> innerFiles = fdao.selectAll(seq);
				System.out.println("검색한 해당 문서에 존재하는 파일수: " + innerFiles.size());

				BoardDTO mydto = dao.showContents(seq);
				String login = (String) request.getSession().getAttribute("loginID");
				
				System.out.println("작성자: " + mydto.getWriter());
				System.out.println("현재 아이디: " + login);
				System.out.println("검색한 문자열: " + searchText);

				dao.upView_Count(mydto.getSeq());
				
				if(login==null) {
					
				}
				
				if (login.equals(mydto.getWriter())) {
					isWriterCheck = true;
					System.out.println("작성자와 일치한 아이디입니다.");
				} else {
					isWriterCheck = false;
					System.out.println("작성자와 일치하지 않은 아이디입니다.");
				}
				
				
//				댓글 리스트 추출
				List<ReplyDTO> replyList = rdao.selectReply(seq);
//				댓글이 해당 부모인지 확인하는 변수
				boolean isParentseq = rdao.isReplyExist(seq);
				
				

				
				System.out.println("로그인한 놈 아이디임?:"+isWriterCheck);
				System.out.println("댓글이 존재하는가?: "+isParentseq);
				
				request.setAttribute("isParentseq", isParentseq);
				request.setAttribute("replyList", replyList);
				request.setAttribute("selectboard", mydto);
				
				request.setAttribute("replynaviseq", replynaviseq);
				
				// 게시판을 작성한 주인의 여부
				request.setAttribute("isWriterCheck", isWriterCheck);
				request.setAttribute("searchText", searchText);
				request.setAttribute("innerFiles", innerFiles);
				request.setAttribute("seq", seq);
			
				request.getRequestDispatcher("/board/showContents.jsp").forward(request, response);

			} else if (cmd.equals("/showBoardList.board")) {
				
				String login = (String) request.getSession().getAttribute("loginID");
				
				System.out.println("아이디"+login);
				String searchText = null;
				String cpage = request.getParameter("cpage");
				searchText = request.getParameter("searchText");
			
				List<BoardDTO> boardlist = null;
				int currentPage = cpage == null ? 1 : Integer.parseInt(cpage);
				int totalRecordCount = 0;
				
				MembersDTO loginmember= mdao.mypage(login);

				boolean isExistText = dao.isExistTest(searchText);
				System.out.println("검색한 문자: " + searchText);
				System.out.println("문자열이 존재해?: " + isExistText);

				if (searchText == null || !isExistText) {
					boardlist = dao.selectBy(currentPage * Constants.RECORD_COUNT_PER_PAGE - 9,
							currentPage * Constants.RECORD_COUNT_PER_PAGE);
					totalRecordCount = dao.getRecordCount();
				} else {
					boardlist = dao.searchContents(searchText, currentPage * Constants.RECORD_COUNT_PER_PAGE - 9,
							currentPage * Constants.RECORD_COUNT_PER_PAGE);
					totalRecordCount = dao.getSearchRecordCount(searchText);
				}
				System.out.println("출력할 목록의 개수: " + totalRecordCount);


				System.out.println("현재 페이지 확인: " + currentPage);
				System.out.println(boardlist.size());
				
				
				request.getSession().setAttribute("latesPageNum", currentPage);
				request.setAttribute("boardlist", boardlist);
				request.setAttribute("loginmember", loginmember);
				request.setAttribute("recordTotalCount", totalRecordCount);
				request.setAttribute("recordCountPerPge", Constants.RECORD_COUNT_PER_PAGE);
				request.setAttribute("NaviCountPerPage", Constants.NAVI_COUNT_PER_PAGE);
				request.setAttribute("searchText", searchText);
				request.setAttribute("isExistText", isExistText);
				request.getRequestDispatcher("/board/board.jsp").forward(request, response);

			} else if (cmd.equals("/updateContents.board")) {
				String title = request.getParameter("title");
				String contents = request.getParameter("Contents");
				String seq = request.getParameter("seq");
				String writer = (String) request.getSession().getAttribute("loginID");

				dao.updateContents(seq, title, contents);
				response.sendRedirect("/showboardlist.board");
			} else if (cmd.equals("/deleteContents.board")) {
				
//				파일을 삭제하는 기능도 같이 넣어야 한다.
				int seq = Integer.parseInt(request.getParameter("seq"));
				int parentseq = (int) request.getSession().getAttribute("latesPageNum");
				System.out.println("삭제할려는 번호: " + seq);

				System.out.println("부모의 번호: " + parentseq);
				System.out.println("번호나옴?");
				
				dao.deleteContents(seq);

				response.sendRedirect("/showBoardList.board?cpage=" + parentseq);

			} else if (cmd.equals("/download.board")) {
				String ori_name = request.getParameter("oriname");
				String sys_name = request.getParameter("sysname");
				String filePath = request.getServletContext().getRealPath("files");

				System.out.println(filePath + "\\" + sys_name);

//            	인코딩 전환 과정
				ori_name = new String(ori_name.getBytes("utf8"), "ISO-8859-1");

				response.setHeader("Content-Disposition", "attachment; filename=" + ori_name);

				File targetFile = new File(filePath + "/" + sys_name);

				byte[] fileContents = new byte[(int) targetFile.length()];
				
				try(DataInputStream dis=new DataInputStream(new FileInputStream(targetFile));
	            		ServletOutputStream sos=response.getOutputStream();	){
	            		dis.readFully(fileContents);// 하드 디스크에 있는 파일 내용을 모두 byte[]로 복사
	            		sos.write(fileContents);
	            		sos.flush();
	            	}

			}else if (cmd.equals("/like.board")) {
				int seq = Integer.parseInt(request.getParameter("contentId"));
				dao.like(seq);
				
			}else if (cmd.equals("/dislike.board")) {
				int seq = Integer.parseInt(request.getParameter("contentId"));
				dao.dislike(seq);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.html");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}


}

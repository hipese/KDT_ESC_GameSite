package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

import constants.Constants;
import dao.ReplyDAO;
import dto.ReplyDTO;


@WebServlet("*.reply")
public class ReplyController extends HttpServlet {
	
	ReplyDAO dao = ReplyDAO.getInstance();
	Gson gson = new GsonBuilder().registerTypeAdapter(Timestamp.class, new JsonSerializer<Timestamp>() {
		private final SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh:mm:ss");
		
		@Override
		public JsonElement serialize(Timestamp arg0, Type arg1, JsonSerializationContext arg2) {
			
			return new JsonPrimitive(sdf.format(arg0));
		}
	}).create();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf8");
		request.setCharacterEncoding("utf8");

		String cmd = request.getRequestURI();
		PrintWriter printwriter = response.getWriter();
		System.out.println("요청된 URI: " + cmd);

		try {
			if (cmd.equals("/writeReply.reply")) {

				String writer = (String) request.getSession().getAttribute("loginID");
				String replyContents = request.getParameter("replyContents");
				Timestamp date = new Timestamp(System.currentTimeMillis());
				int parentSeq = Integer.parseInt(request.getParameter("parent_seq"));

				dao.writeReply(new ReplyDTO(0, writer, replyContents, date, parentSeq));
				response.sendRedirect("/showContents.board?seq=" + parentSeq);
			} else if (cmd.equals("/delete.reply")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				String parent_seq = request.getParameter("parent_seq");

				System.out.println("seq는 뭐야?: " + seq);
				System.out.println("parent_seq는 뭐야?: " + parent_seq);
				dao.deleteReply(seq);
				
				response.sendRedirect("/showReplyList.reply?seq="+Integer.parseInt(parent_seq));
//				printwriter.append(parent_seq);
			} else if (cmd.equals("/update.reply")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				String replyContents = request.getParameter("contents");

				System.out.println("전송받은 replyseq: " + seq);
				System.out.println("전송받은 replyContents: " + replyContents);

				dao.upDateContents(seq, replyContents);

				String parent_seq = request.getParameter("parent_seq");
				response.sendRedirect("/showReplyList.reply?seq=" + Integer.parseInt(parent_seq));
				
			} else if (cmd.equals("/showReplyList.reply")) { //댓글 리스트를 불러오는 서블릿 
				
				int seq = Integer.parseInt(request.getParameter("seq"));
				System.out.println("부모의 번호: " + seq);
				
				
				List<ReplyDTO> replyList = dao.selectReply(seq);
				
				printwriter.append(gson.toJson(replyList));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.html");
		}

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}

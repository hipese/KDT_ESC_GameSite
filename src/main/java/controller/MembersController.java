package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import commons.EncryptionUtils;
import dao.MembersDAO;
import dto.MembersDTO;

@WebServlet("*.members")
public class MembersController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI();
		MembersDAO dao = MembersDAO.getInstance();
		Long currentTime = System.currentTimeMillis();
		System.out.println(cmd);
		try {
			if(cmd.equals("/Membership.members")) { // 회원가입 페이지로 이동
				response.sendRedirect("/member.jsp");
			}
			else if(cmd.equals("/AcceptLogin.members")) { // 회원가입 후 index.jsp로 이동
				request.setCharacterEncoding("UTF-8");
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				String shapw = EncryptionUtils.getSHA512(pw);
				String name = request.getParameter("name");
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");
				String zipcode = request.getParameter("zipcode");
				String address1 = request.getParameter("address1");
				String address2 = request.getParameter("address2");
				Timestamp regdate = new Timestamp(currentTime);
				dao.insert(new MembersDTO(id, shapw, name, phone, email, zipcode, address1, address2, regdate));
				response.sendRedirect("/index.jsp");
			}
			else if(cmd.equals("/idcheck.members")){ // 아이디 중복체크 ajax
				Gson gson = new Gson();
				String id = request.getParameter("id");
				Boolean result = dao.isIdExist(new MembersDTO(id));
				String json = gson.toJson(result);
				PrintWriter pw = response.getWriter();
				pw.append(json);
			}
			else if(cmd.equals("/login.members")){
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				pw = EncryptionUtils.getSHA512(pw);
				boolean success = dao.login(id, pw);
				if(success) {
					request.getSession().setAttribute("loginID",id);
				}
				response.sendRedirect("/index.jsp"); // 로그인시 어디로 이동할지
			}

			else if(cmd.equals("/logout.members")) {
				request.getSession().invalidate();
				response.sendRedirect("/index.jsp"); // 로그아웃시 어디로 이동할지
			}
		} catch (Exception e) {
			response.sendRedirect("/error.html");
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.CarCrashDAO;
import dao.JumpkingDAO;


@WebServlet("*.game")
public class GameController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public GameController() { super(); }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf8");

		String cmd = request.getRequestURI();
		System.out.println(cmd);
		try {
			if (cmd.equals("/CarCrashStart.game")) {
			    String loginID = request.getParameter("loginID");
			    String gameURL = "/game/CarCrash/carcrash.jsp?loginID=" + loginID;
			    PrintWriter pw = response.getWriter();
			    pw.append(gameURL);
			}else if(cmd.equals("/CarCrashGameOver.game")) {
				Gson gson = new Gson();
				CarCrashDAO dao = CarCrashDAO.getInstance();
				String loginID = request.getParameter("loginID");
				int score = Integer.parseInt(request.getParameter("score"));
				int result = dao.writeGameResult(loginID,score);
				PrintWriter pw = response.getWriter();
				pw.append(gson.toJson(result));
			}
		}catch(Exception e) {
			response.sendRedirect("/error.html");
			e.printStackTrace();
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

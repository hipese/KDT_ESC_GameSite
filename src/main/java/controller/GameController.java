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
import dao.DinoGameDAO;
import dao.JumpkingDAO;
import dao.RoadOfSamuraiDAO;
import dao.SkeletonSurvivorDAO;



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
			}else if(cmd.equals("/SkeletonSurvivorStart.game")) {
				String loginID = request.getParameter("loginID");
			    String gameURL = "/game/SkeletonSurvivor/skeletonsurvivor.jsp?loginID=" + loginID;
			    PrintWriter pw = response.getWriter();
			    pw.append(gameURL);
			}else if(cmd.equals("/SkeletonSurvivorGameOver.game")) {
				Gson gson = new Gson();
				SkeletonSurvivorDAO dao = SkeletonSurvivorDAO.getInstance();
				String loginID = request.getParameter("loginID");
				int score = Integer.parseInt(request.getParameter("score"));
				int result = dao.writeGameResult(loginID,score);
				PrintWriter pw = response.getWriter();
				pw.append(gson.toJson(result));
			}else if(cmd.equals("/DinoGameStart.game")) {
				String loginID = request.getParameter("loginID");
			    String gameURL = "/game/DinoGame/dinogame.jsp?loginID=" + loginID;
			    PrintWriter pw = response.getWriter();
			    pw.append(gameURL);
			}else if(cmd.equals("/DinoGameOver.game")) {
				Gson gson = new Gson();
				DinoGameDAO dao = DinoGameDAO.getInstance();
				String loginID = request.getParameter("loginID");
				int score = Integer.parseInt(request.getParameter("score"));
				int result = dao.writeGameResult(loginID,score);
				PrintWriter pw = response.getWriter();
				pw.append(gson.toJson(result));
			}else if(cmd.equals("/JumpkingStart.game")) {
				String loginID = request.getParameter("loginID");
			    String gameURL = "/game/JumpKing/jumpking.jsp?loginID=" + loginID;
			    PrintWriter pw = response.getWriter();
			    pw.append(gameURL);
			}else if(cmd.equals("/JumpkingGameOver.game")) {
				Gson gson = new Gson();
				JumpkingDAO dao = JumpkingDAO.getInstance();
				String loginID = request.getParameter("loginID");
				int score = (int)Double.parseDouble(request.getParameter("score"));
				int result = dao.writeGameResult(loginID,score);
				PrintWriter pw = response.getWriter();
				pw.append(gson.toJson(result));
			}else if(cmd.equals("/RoadOfSamuraiStart.game")) {
				String loginID = request.getParameter("loginID");
			    String gameURL = "/game/RoadOfSamurai/roadofsamurai.jsp?loginID=" + loginID;
			    PrintWriter pw = response.getWriter();
			    pw.append(gameURL);
			}else if(cmd.equals("/RoadOfSamuraiGameOver.game")) {
				Gson gson = new Gson();
				RoadOfSamuraiDAO dao = RoadOfSamuraiDAO.getInstance();
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

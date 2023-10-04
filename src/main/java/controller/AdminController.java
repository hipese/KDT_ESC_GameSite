package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.AdminDAO;
import dao.CarCrashDAO;
import dao.DinoGameDAO;
import dao.GameInfoDAO;
import dao.JumpkingDAO;
import dao.MembersDAO;
import dao.RaiseDragonDAO;
import dao.RoadOfSamuraiDAO;
import dao.SkeletonSurvivorDAO;
import dto.GameInfoDTO;
import dto.MembersDTO;


@WebServlet("*.admin")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public AdminController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI();
		System.out.println(cmd);

		MembersDAO mdao = MembersDAO.getInstance();
		AdminDAO adao = AdminDAO.getInstance();
		
		try {
			if(cmd.equals("/returnToAdmin.admin")) {
				String id = (String) request.getSession().getAttribute("loginID");
				MembersDTO dto = mdao.mypage(id);
				if(dto.isAdmin()){
					Gson gson = new Gson();
					CarCrashDAO ccdao = CarCrashDAO.getInstance();
					DinoGameDAO dgdao = DinoGameDAO.getInstance();
					JumpkingDAO jkdao = JumpkingDAO.getInstance();
					RaiseDragonDAO rddao = RaiseDragonDAO.getInstance();
					RoadOfSamuraiDAO rsdao = RoadOfSamuraiDAO.getInstance();
					SkeletonSurvivorDAO ssdao = SkeletonSurvivorDAO.getInstance();
					
					GameInfoDAO gamesdao = GameInfoDAO.getInstance();
					List<GameInfoDTO> gamesDataList =
							gamesdao.getGamesInfo(
									new GameInfoDTO("CarCrash",ccdao.countWeekPlay(),ccdao.countTodayPlay(),ccdao.countAllPlays()),
									new GameInfoDTO("DinoGame",dgdao.countWeekPlay(),dgdao.countTodayPlay(),dgdao.countAllPlays()),
									new GameInfoDTO("Jumpking",jkdao.countWeekPlay(),jkdao.countTodayPlay(),jkdao.countAllPlays()),
									new GameInfoDTO("RaiseDragon",rddao.countWeekPlay(),rddao.countTodayPlay(),rddao.countAllPlays()),
									new GameInfoDTO("RoadOfSamurai",rsdao.countWeekPlay(),rsdao.countTodayPlay(),rsdao.countAllPlays()),
									new GameInfoDTO("SkeletonSurvivor",ssdao.countWeekPlay(),ssdao.countTodayPlay(),ssdao.countAllPlays()));
					String gamesDataJson = gson.toJson(gamesDataList);
					request.setAttribute("gamesData", gamesDataJson);
					request.getRequestDispatcher("/admin/admin.jsp").forward(request,response);
				}
			} else if(cmd.equals("/userManage.admin")) {
				List<String> list = mdao.notBannedList();
				List<String> banlist = mdao.isBannedList();
				request.setAttribute("list", list);
				request.setAttribute("banlist",banlist);
				request.getRequestDispatcher("/admin/userManage.jsp").forward(request,response);
			} else if(cmd.equals("/userInfo.admin")) {
				String id = request.getParameter("id");
				MembersDTO dto = mdao.mypage(id);
				boolean isbanned = adao.isBan(id);
				String sys_name = dto.getProfile();
				request.setAttribute("sys_name", sys_name);
				request.setAttribute("dto", dto);
				request.setAttribute("isbanned", isbanned);
				request.getRequestDispatcher("/admin/userInfo.jsp").forward(request,response);
			} else if(cmd.equals("/isuserban.admin")) {
				String loginID = request.getParameter("loginID");
				boolean isTrue = adao.isBan(loginID);
				if(isTrue) {
					PrintWriter check = response.getWriter();
					check.append("true");
				}
				else {
					PrintWriter check = response.getWriter();
					check.append("false");
				}
			} else if(cmd.equals("/userban.admin")) {
				String id = request.getParameter("id");
				int isTrue = adao.userBan(id);
				if(isTrue>=1) {
					PrintWriter check = response.getWriter();
					check.append("true");
				}
			} else if(cmd.equals("/userbancancel.admin")) { 
				String id = request.getParameter("id");
				int isTrue = adao.userBancancel(id);
				if(isTrue>=1) {
					PrintWriter check = response.getWriter();
					check.append("true");
				}
			} 
			
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.html");
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

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
		MembersDAO dao = MembersDAO.getInstance();
		
		try {
			if(cmd.equals("/returnToAdmin.admin")) {
				String id = (String) request.getSession().getAttribute("loginID");
				MembersDTO dto = dao.mypage(id);
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
					request.getRequestDispatcher("/admin.jsp").forward(request,response);
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

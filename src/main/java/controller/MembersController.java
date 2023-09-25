package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import commons.EmailService;
import commons.EncryptionUtils;
import dao.MembersDAO;
import dto.FilesDTO;
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
            dao.insert(new MembersDTO(id, shapw, name, phone, email, zipcode, address1, address2, regdate,"0"));
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
            String url = request.getParameter("url");
            String scroll = request.getParameter("scroll");
            request.getSession().setAttribute("scrollPosition", scroll);
            pw = EncryptionUtils.getSHA512(pw);
            boolean success = dao.login(id, pw);
            if(success) {
               request.getSession().setAttribute("loginID",id);
               MembersDTO dto = dao.mypage(id);
               request.setAttribute("name",dto.getName());
               request.setAttribute("email",dto.getEmail());
               request.setAttribute("sys_name", dto.getProfile());
               request.getRequestDispatcher("/index.jsp").forward(request,response);
            }else {
               response.sendRedirect(url);
            }
         }
         else if(cmd.equals("/logout.members")) {
            request.getSession().invalidate();
            response.sendRedirect("/index.jsp"); // 로그아웃시 어디로 이동할지
         }
         else if(cmd.equals("/mypage.members")) {
            String id = (String)request.getSession().getAttribute("loginID");
            MembersDTO dto = dao.mypage(id);
            request.setAttribute("dto", dto);
            String filePath = request.getServletContext().getRealPath("files");
            //dto에서 프로필 이름 가져오기
            String sys_name = dto.getProfile();
            request.setAttribute("filePath", filePath);
            request.setAttribute("sys_name", sys_name);
            System.out.println(filePath + "/" + sys_name);
            
            request.getRequestDispatcher("/myPage.jsp").forward(request,response);
         } else if (cmd.equals("/update.members")) {
            String id = (String)request.getSession().getAttribute("loginID");
            MembersDTO dto = dao.mypage(id);
            String sys_name = dto.getProfile();
            
            request.getRequestDispatcher("/updateMyPage.jsp").forward(request,response);
         } else if (cmd.equals("/updateComplete.members")) {
            request.setCharacterEncoding("UTF-8");
            String uploadPath = request.getServletContext().getRealPath("files");
            File filesPath = new File(uploadPath);
            if(!filesPath.exists()) {
               filesPath.mkdir();
            }
            int maxSize = 1024 * 1024 * 10; //10mb
            MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "utf8", new DefaultFileRenamePolicy());
            String id = (String)request.getSession().getAttribute("loginID");
            String name = multi.getParameter("name");
            String phone1 = multi.getParameter("phone1");
            String phone2 = multi.getParameter("phone2");
            String phone = "010"+phone1 + phone2;
            String email1 = multi.getParameter("email1");
            String email2 = multi.getParameter("email2");
            String email = email1 + "@" + email2;
            String zipcode = multi.getParameter("zipcode");
            String address1 = multi.getParameter("address1");
            String address2 = multi.getParameter("address2");
            String address = address1 + " " +address2;
            String address3 = multi.getParameter("address3");
            
            System.out.println("RealPath : "+request.getServletContext().getRealPath(""));

            Enumeration<String> fileNames = multi.getFileNames();
            while(fileNames.hasMoreElements()) { // resultset의 next같은 것
               String fileName = fileNames.nextElement();
               
               if(multi.getFile(fileName) != null) {
                  String ori_name = multi.getOriginalFileName(fileName);
                  String sys_name = multi.getFilesystemName(fileName);
                  dao.uploadProfile(ori_name,id);
               }
               
            }
            
            dao.update(id, name, phone, email, zipcode, address, address3);
            MembersDTO dto = dao.mypage(id);
            request.setAttribute("dto", dto);
            request.getRequestDispatcher("/mypage.members").forward(request, response);
         } else if(cmd.equals("/updateBack.members")) {
            String id = (String)request.getSession().getAttribute("loginID");
            MembersDTO dto = dao.mypage(id);
            request.setAttribute("name",dto.getName());
            request.setAttribute("email",dto.getEmail());
            request.setAttribute("sys_name", dto.getProfile());
            request.getRequestDispatcher("/index.jsp").forward(request,response);
         } else if(cmd.equals("/findMemberId.members")) {
            Gson gson = new Gson();
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String foundId = dao.findId(email, name);
            String json = gson.toJson(foundId);
            PrintWriter pw = response.getWriter();
            pw.append(json);
            
         } else if(cmd.equals("/tempPwRelease.members")) {
            EmailService es = new EmailService();
            Gson gson = new Gson();
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String id = request.getParameter("id");
            PrintWriter pw = response.getWriter();
            if(dao.tempPwCondition(id, email, name)) {
               int result = dao.updateTempPw(es.sendEmail(email), id, email, name);
               String json = gson.toJson(result);
               pw.append(json);
            }else {
               String json = gson.toJson(null);
               pw.append(json);
            }
         } else if(cmd.equals("/delete.members")) {
            response.sendRedirect("/deleteMembers.jsp");
         } else if(cmd.equals("/deleteComplete.members")) {
            String id = request.getParameter("id");
            String id2 = (String)request.getSession().getAttribute("loginID");
            String pw = request.getParameter("pw");
            pw = EncryptionUtils.getSHA512(pw);
            boolean success = dao.login(id, pw);
            response.setCharacterEncoding("UTF-8");
            if(success && id.equals(id2)) {
               PrintWriter check = response.getWriter();
               check.append("정말로 탈퇴하시겠습니까?");
            } else {
               PrintWriter check = response.getWriter();
               check.append("아이디 또는 비밀번호를 다시 확인해주세요.");
            }
         } else if(cmd.equals("/realDelete.members")) {
            String id = (String)request.getSession().getAttribute("loginID");
            dao.delete(id);
            request.getSession().invalidate();
            response.sendRedirect("/index.jsp");
         } else if(cmd.equals("/changePW.members")) {
            response.sendRedirect("/changePW.jsp");
         } else if(cmd.equals("/changeCompletePW.members")) {
            String id1 = request.getParameter("id");
            String pw1 = request.getParameter("pw1");
            String pw2 = request.getParameter("pw2");
            pw1 = EncryptionUtils.getSHA512(pw1);
            pw2 = EncryptionUtils.getSHA512(pw2);
            boolean success = dao.login(id1, pw1);
            String id2 = (String)request.getSession().getAttribute("loginID");
            response.setCharacterEncoding("UTF-8");
            if(success && id1.equals(id2)) {
               dao.changePW(pw1,pw2);
               PrintWriter check = response.getWriter();
               check.append("");
            } else {
               PrintWriter check = response.getWriter();
               check.append("아이디 또는 비밀번호를 다시 확인해주세요.");
            }
         } else if(cmd.equals("/scrollout.members")){
            request.getSession().removeAttribute("scrollPosition");
            Gson gson = new Gson();
            String action = request.getParameter("action");
            String json = gson.toJson(action);
            PrintWriter pw = response.getWriter();
            pw.append(json);
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
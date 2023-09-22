package controller;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.FilesDAO;
import dto.FilesDTO;

@WebServlet("*.file")
public class FileController extends HttpServlet {
	FilesDAO dao = FilesDAO.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf8");

		String cmd = request.getRequestURI();
		System.out.println(cmd);
		try {
			if (cmd.equals("/download.file")) {

				String sys_name = request.getParameter("sysname");
				String filePath = request.getServletContext().getRealPath("files");
				String ori_name = request.getParameter("oriname");

				System.out.println(filePath + "\\" + sys_name);

//	               인코딩 전환 과정
				ori_name = new String(ori_name.getBytes("utf8"), "ISO-8859-1");

				response.setHeader("Content-Disposition", "attachment; filename=" + ori_name);

				File targetFile = new File(filePath + "/" + sys_name);

				byte[] fileContents = new byte[(int) targetFile.length()];

				try (DataInputStream dis = new DataInputStream(new FileInputStream(targetFile));
						ServletOutputStream sos = response.getOutputStream();) {
					dis.readFully(fileContents);// 하드 디스크에 있는 파일 내용을 모두 byte[]로 복사
					sos.write(fileContents);
					sos.flush();

				}

			} else if (cmd.equals("/upload.file")) {
				PrintWriter pw = response.getWriter();
				String uploadPath = request.getServletContext().getRealPath("files");
				System.out.println(uploadPath);
				File filesPath = new File(uploadPath);
				if (!filesPath.exists()) {
					filesPath.mkdir();
				} // 파일을 업로드 할 폴더 생성
				int maxSize = 1024 * 1024 * 10; // 업로드 파일 최대 사이즈 10mb 제한

				MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "utf8",
						new DefaultFileRenamePolicy());

				Enumeration<String> fileNames = multi.getFileNames();
				while (fileNames.hasMoreElements()) { // ResultSet의 next()와 같은 역할
					String fileName = fileNames.nextElement();

					if (multi.getFile(fileName) != null) {

						String ori_name = multi.getOriginalFileName(fileName); // file : input type="file"의 name
						String sys_name = multi.getFilesystemName(fileName); // file : input type="file"의 name
						FilesDTO dto = new FilesDTO(0, ori_name, sys_name, 1);
						dao.insert(dto);
						pw.append("/files/" + sys_name);
					}
				}
				System.out.println("저장성공");
			}  
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("/error.html");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

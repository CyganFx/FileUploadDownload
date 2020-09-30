package Servlets;

import dao.FileDao;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "Servlets.FileDownloadServlet")
public class FileDownloadServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try (PrintWriter out = response.getWriter()) {
            FileDao fileDao = new FileDao();
            Classes.File file = fileDao.getFileByFileName(request.getParameter("filename"));
            String path = file.getPath();
            File dwFile = new File(path);
            if (dwFile.exists()) {
                response.setContentType("application/octet-stream");
                response.setContentLength((int) dwFile.length());
                String hkey = "Content-Disposition";
                String hvalue = String.format("attachment; filename=\"%s\"", dwFile.getName());
                response.setHeader(hkey, hvalue);
                FileInputStream in = new FileInputStream(dwFile);
                int i;
                while ((i = in.read()) != -1) {
                    out.write(i);
                }
                in.close();
                out.close();
            } else {
                out.println("Sorry, file not found...");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        System.out.println("Browser thinks you're on " + getServletName() + " page");
    }
}

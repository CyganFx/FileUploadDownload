package Servlets;

import Classes.Dao;
import dao.FileDao;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "Servlets.FileDeleteServlet")
public class FileDeleteServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Dao dao = new Dao();
        HttpSession session = request.getSession();
        int id = Integer.parseInt(request.getParameter("fileid"));
        String fileName = request.getParameter("filename");
        out.print(id);
        FileDao fileDao = new FileDao();
        Classes.File file = null;
        try {
            file = fileDao.getFileByFileName(fileName);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        File dwFile = new File(file.getPath());
        if (!dwFile.isDirectory()) {
            dwFile.delete();
            if (dao.fileDelete(id, file.getFileName())) {
                out.println("<center><h1>Image Deleted Succesfully......</h1></center>");
                out.println("<center><a href='main.jsp'>Get Back</a></center>");
            } else {
                out.println("<center> File was not deleted from database, strange... </center>");
            }
        }
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        System.out.println("Browser thinks you're on " + getServletName() + " page");
    }
}


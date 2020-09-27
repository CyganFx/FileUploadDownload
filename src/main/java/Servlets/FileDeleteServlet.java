package Servlets;

import Classes.Dao;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Servlets.FileDeleteServlet")
public class FileDeleteServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Dao dao = new Dao();
        HttpSession session = request.getSession();
        int id = (int) session.getAttribute("id");
        String fileName = request.getParameter("filename");
        String path = getServletContext().getRealPath("/" + FileUploadServlet.UPLOAD_DIR + File.separator + fileName);
        File dwFile = new File(path);
        if (!dwFile.isDirectory()) {
            dwFile.delete();
            if (dao.fileDelete(id, FileUploadServlet.UPLOAD_DIR + File.separator + fileName)) {
                out.println("<center><h1>Image Deleted Succesfully......</h1></center>");
                out.println("<center><a href='display.jsp?id=" + id + "'>Get Back</a></center>");
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


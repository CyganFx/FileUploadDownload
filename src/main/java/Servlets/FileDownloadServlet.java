package Servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

//Not done yet
@WebServlet(name = "Servlets.FileDownloadServlet")
public class FileDownloadServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter out = response.getWriter();
//        String name = request.getParameter("filename");
//        out.println(name);
//        try(PrintWriter out =response.getWriter()) {
//            String name = request.getParameter("filename");
//            String path = getServletContext().getRealPath("/" + "files" + File.separator+name);
//            File dwFile = new File(path);
//                    if(dwFile.exists()) {
//                        response.setContentType("application/octet-stream");
//                        response.setContentLength((int)dwFile.length());
//                        String hkey = "Content-Disposition";
//                        String hvalue = String.format("attachment; filename=\"%s\"", dwFile.getName());
//                        response.setHeader(hkey,hvalue);
//                        FileInputStream in = new FileInputStream(dwFile);
//                        int i;
//                        while((i=in.read())!=-1) {
//                            out.write(i);
//                        }
//                        in.close();
//                        out.close();
//                    }
//                    else {
//                        out.println("Sorry, file not found...");
//                    }
//        }

    }
}

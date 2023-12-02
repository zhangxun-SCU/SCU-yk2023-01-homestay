package homestay.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import homestay.service.UploadService;

import org.json.JSONObject;

@WebServlet("/upload_file")
public class UploadServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 检测是否为多媒体上传
        JSONObject resJson = new JSONObject();
        UploadService service = new UploadService();
        service.upload(req, resp, resJson, "avatar");
        resp.setContentType("application/json; charset=UTF-8");
        resp.getWriter().println(resJson);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.getWriter().println("11");
    }
}

package homestay.servlet;

import homestay.dao.Data;
import homestay.service.CommentService;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/order_comment")
public class CommentServlet extends HttpServlet {
    private Data data = null;

    private void showDebug(String function, String message) {
        String log = "[CommentServlet]" + function + message;
        System.out.println(log);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {
            data = Data.getPageParameters(request, response);
            JSONObject json = new JSONObject();
            CommentService commentService = new CommentService();
            String action = data.getParam().getString("action");
            if (action.equals("update_comment")) {
                commentService.updateComment(data, json);
            } else if (action.equals("get_comment")) {
                commentService.getComment(data, json);
            } else {
                json.put("resCode", "C0001");
            }
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().println(json);
        } catch (JSONException | SQLException | IOException e) {
            throw new RuntimeException(e);
        }

    }
}

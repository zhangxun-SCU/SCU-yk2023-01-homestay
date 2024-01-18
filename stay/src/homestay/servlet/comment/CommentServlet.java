package homestay.servlet.comment;

import homestay.dao.Data;
import homestay.service.comment.RoomCommentService;
import homestay.service.comment.SpecialtyCommentService;
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
            String type = data.getParam().getString("type");
            if (type.equals("specialty")) {
                dispatchSpecialtyAction(data, json);
            } else if (type.equals("room")) {
                dispatchRoomAction(data, json);
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

    private void dispatchSpecialtyAction(Data data, JSONObject json) throws JSONException, SQLException {
        SpecialtyCommentService specialtyCommentService = new SpecialtyCommentService();
        String action = data.getParam().getString("action");
        if (action.equals("update_comment")) {
            specialtyCommentService.updateComment(data, json);
        } else if (action.equals("get_comment")) {
            specialtyCommentService.getComment(data, json);
        } else {
            json.put("resCode", "CS001");
        }
    }

    private void dispatchRoomAction(Data data, JSONObject json) throws JSONException, SQLException {
        RoomCommentService roomCommentService = new RoomCommentService();
        String action = data.getParam().getString("action");
        if (action.equals("update_comment")) {
            roomCommentService.updateComment(data, json);
        } else if (action.equals("get_comment")) {
            roomCommentService.getComment(data, json);
        } else {
            json.put("resCode", "CR001");
        }
    }
}

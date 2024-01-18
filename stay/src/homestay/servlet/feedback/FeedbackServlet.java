package homestay.servlet.feedback;

import homestay.dao.Data;
import homestay.service.feedback.FeedbackService;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/feedback")
public class FeedbackServlet extends HttpServlet {
    Data data = null;

    private void showDebug(String function, String message) {
        String log = "[FeedbackServlet]" + function + message;
        System.out.println(log);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.sendRedirect("./Feedback/feedback.jsp");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FeedbackService feedbackService = new FeedbackService();
        try {
            data = Data.getPageParameters(request, response);
            JSONObject json = new JSONObject();
            String action = data.getParam().getString("action");
            if (action.equals("get_feedback")) {
                feedbackService.getFeedback(data, json);
            } else if (action.equals("reply_feedback")) {
                feedbackService.updateFeedback(data, json);
            } else if (action.equals("add_feedback")) {
                FeedbackService.addFeedback(data, json);
            } else if (action.equals("delete_feedback")) {
                showDebug("[doPost]", action);
                FeedbackService.deleteFeedback(data, json);
            } else {
                json.put("resCode", "F0001");
            }
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().println(json);
        } catch (JSONException | SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

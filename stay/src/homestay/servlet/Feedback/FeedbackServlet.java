package homestay.servlet.Feedback;
import homestay.dao.Data;
import homestay.service.Feedback.FeedbackService;
import homestay.service.seller.SpecialtyService;
import org.json.JSONException;
import org.json.JSONObject;
import java.io.*;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/feedback")
public class FeedbackServlet extends HttpServlet{
    Data data=null;
    private void showDebug(String function, String message) {
        String log = "[FeedbackServlet]" + function + message;
        System.out.println(log);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.sendRedirect("./seller/goods_page.jsp");
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            data = Data.getPageParameters(request, response);
            JSONObject json = new JSONObject();
            String actionType = data.getParam().getString("actionType");
            showDebug("[doPost]", "actionType: " + actionType);
            if (actionType.equals("feedback")) {
                dispatchFeedbackAction(request, response, json);
            } else {
                json.put("resCode", "G0001");
                json.put("Information", "错误操作");
            }
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().println(json);
        } catch (JSONException | SQLException e) {
            e.printStackTrace();
        }
    }
    private void dispatchFeedbackAction(HttpServletRequest request, HttpServletResponse response, JSONObject json) throws JSONException, IOException, SQLException {
        SpecialtyService specialtyService = new SpecialtyService();
        String action = data.getParam().getString("action");
        showDebug("[dispatchFeedbackAction]", "action: " + action);
        if (action.equals("add_feedback")) {
            FeedbackService.addFeedback(data, json);
        } else if (action.equals("delete_feedback")) {
            FeedbackService.deleteFeedback(data, json);
        } else if(action.equals("get_feedback")){
            FeedbackService.getFeedback(data,json);
        }else {
            json.put("resCode", "GS001");
            json.put("Information", "反馈错误操作");
        }
    }
}

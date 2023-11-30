package homestay.servlet;

import homestay.dao.Data;
import homestay.service.SpecialtyService;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/seller")
public class GoodsServlet extends HttpServlet {
    private Data data = null;

    private void showDebug(String function, String message) {
        String log = "[GoodsServlet]" + function + message;
        System.out.println(log);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.sendRedirect("./seller/goods_page.html");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            data = Data.getPageParameters(request, response);
            JSONObject json = new JSONObject();
            String actionType = data.getParam().getString("actionType");
            showDebug("[doPost]", "actionType: " + actionType);
            if (actionType.equals("specialty")) {
                dispatchSpecialtyAction(request, response, json);
            } else if (actionType.equals("homestay")) {
                dispatchHomestayAction(request, response, json);
            }
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().println(json);
        } catch (JSONException | SQLException e) {
            e.printStackTrace();
        }
    }

    private void dispatchSpecialtyAction(HttpServletRequest request, HttpServletResponse response, JSONObject json) throws JSONException, IOException, SQLException {
        SpecialtyService specialtyService = new SpecialtyService();
        String action = data.getParam().getString("action");
        showDebug("[dispatchSpecialtyAction]", "action: " + action);
        if (action.equals("add_specialty")) {
            specialtyService.addSpecialty(data, json);
        } else if (action.equals("get_specialty")) {
            specialtyService.getSpecialty(data, json);
        } else if (action.equals("delete_specialty")) {
            specialtyService.deleteSpecialty(data, json);
        }
    }

    private void dispatchHomestayAction(HttpServletRequest request, HttpServletResponse response, JSONObject json) {

    }
}

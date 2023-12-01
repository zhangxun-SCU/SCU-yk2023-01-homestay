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

@WebServlet("/goods/page")
public class GoodsServlet extends HttpServlet {
    private Data data = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.sendRedirect("../seller/goods_page.html");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            data = Data.getPageParameters(request, response);
            String actionType = data.getParam().getString("actionType");
            JSONObject json = new JSONObject();
            if (actionType.equals("specialty")) {
                dispatchSpecialtyAction(request, response, json);
            } else if (actionType.equals("homestay")) {
                dispatchHomestayAction(request, response, json);
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    private void dispatchSpecialtyAction(HttpServletRequest request, HttpServletResponse response, JSONObject json) throws JSONException {
        SpecialtyService specialtyService = new SpecialtyService();
        String action = data.getParam().getString("action");
        if (action.equals("add_specialty")) {
            specialtyService.addSpecialty(data, json);
        }
    }

    private void dispatchHomestayAction(HttpServletRequest request, HttpServletResponse response, JSONObject json) {

    }
}

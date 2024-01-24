package homestay.servlet.seller;

import homestay.dao.Data;
import homestay.service.seller.ExportService;
import homestay.service.seller.HomestayService;
import homestay.service.seller.RoomService;
import homestay.service.seller.SpecialtyService;
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
        response.sendRedirect("./seller/goods_page.jsp");
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
            } else if (actionType.equals("room")) {
                dispatchRoomAction(request, response, json);
            } else if (actionType.equals("export")) {
                ExportService exportService = new ExportService();
                exportService.exportData(data, json);
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
        } else if (action.equals("modify_specialty")) {
            specialtyService.modifySpecialty(data, json);
        } else if (action.equals("get_statistics")) {
            specialtyService.getStatistics(data, json);
        } else {
            json.put("resCode", "GS001");
            json.put("Information", "特产错误操作");
        }
    }

    private void dispatchHomestayAction(HttpServletRequest request, HttpServletResponse response, JSONObject json) throws JSONException, IOException, SQLException {
        HomestayService homestayService = new HomestayService();
        String action = data.getParam().getString("action");
        showDebug("[dispatchHomestayAction]", "action: " + action);
        if (action.equals("add_homestay")) {
            homestayService.addHomestay(data, json);
        } else if (action.equals("get_homestay")) {
            homestayService.getHomestay(data, json);
        } else if (action.equals("delete_homestay")) {
            homestayService.deleteHomestay(data, json);
        } else if (action.equals("modify_homestay")) {
            homestayService.modifyHomestay(data, json);
        } else if (action.equals("get_locations")) {
            homestayService.getLocations(data, json);
        } else if (action.equals("get_statistics")) {
            homestayService.getStatistics(data, json);
        } else {
            json.put("resCode", "GH001");
            json.put("Information", "民宿错误操作");
        }
    }

    private void dispatchRoomAction(HttpServletRequest request, HttpServletResponse response, JSONObject json) throws JSONException, IOException, SQLException {
        RoomService roomService = new RoomService();
        String action = data.getParam().getString("action");
        showDebug("[dispatchRoomAction]", "action: " + action);
        if (action.equals("add_room")) {
            roomService.addRoom(data, json);
        } else if (action.equals("get_room")) {
            roomService.getRoom(data, json);
        } else if (action.equals("delete_room")) {
            roomService.deleteRoom(data, json);
        } else if (action.equals("modify_room")) {
            roomService.modifyRoom(data, json);
        } else {
            json.put("resCode", "GR001");
            json.put("Information", "房间错误操作");
        }
    }
}

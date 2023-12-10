package homestay.servlet.market;

import homestay.dao.Data;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

@WebServlet("/getTime")
public class GetTime  extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            Data data= Data.getPageParameters(req,resp);
            Date time=new Date();
            String create_time=(new SimpleDateFormat("yyyy-MM-dd")).format(time);
            LocalDate januaryFirst = LocalDate.parse(create_time);
            LocalDate januarySecond = januaryFirst.plusDays(1);
//            String create_time2=(new SimpleDateFormat("yyyy-MM-dd")).format(januarySecond);
            String create_time3=januarySecond.toString();
            System.out.println(create_time);
            System.out.println(create_time3);
            System.out.println(create_time3);
            JSONObject json=new JSONObject();
            json.put("today",create_time);
            json.put("tomorrow",create_time3);
            resp.setContentType("application/json; charset=UTF-8");
            resp.getWriter().println(json);
        } catch (JSONException e) {

            e.printStackTrace();
        }

    }}

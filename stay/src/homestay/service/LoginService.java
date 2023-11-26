package homestay.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import homestay.dao.Data;
import homestay.dao.UserDao;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

public class LoginService {
    // main service functionality
    public Boolean checkLogin(Data data, JSONObject resJson) throws JSONException, SQLException {
        UserDao dao = new UserDao();
        String id = data.getParam().getString("id");
        String inputPassword = data.getParam().getString("password");
        JSONObject userAccountInfo = dao.queryUserById(id);
        String realPassword = userAccountInfo.has("user_password")
                ? userAccountInfo.getString("user_password") : null;
        if(realPassword == null) {
            // 没有此用户
            resJson.put("resCode", "L0002");
            resJson.put("resInfo", "user does not exist");
            return false;
        }
        if(realPassword.equals(inputPassword)) {
            // 密码正确
            // 返回数据
            userAccountInfo.remove("user_password");
            resJson.put("resCode", "00000");
            resJson.put("resInfo", "success");
            return true;
        }
        System.out.println("real passwd: " + userAccountInfo.getString("user_password"));
        resJson.put("resCode", "L0001");
        resJson.put("resInfo", "error: password incorrect");
        return false;
    }
}

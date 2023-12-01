package homestay.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import homestay.dao.Data;
import homestay.dao.UserDao;
import homestay.utils.JwtUtil;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.HashMap;

public class LoginService {
    // main service functionality
    public Boolean checkLogin(Data data, String serverCode, JSONObject resJson) throws JSONException, SQLException {
        UserDao dao = new UserDao();
        String id = data.getParam().getString("id");
        String inputPassword = data.getParam().getString("password");
        JSONObject userAccountInfo = dao.queryUserById(id);
        String realPassword = userAccountInfo.has("user_password")
                ? userAccountInfo.getString("user_password") : null;
        if(realPassword == null) {
            // 没有此用户
            resJson.put("resCode", "L0002");
            resJson.put("loginInfo", "error: user does not exist");
            return false;
        }
        if(!realPassword.equals(inputPassword)) {
            // 密码错误
            resJson.put("resCode", "L0001");
            resJson.put("loginInfo", "error: password incorrect");
            return false;
        }
        System.out.println("real passwd: " + userAccountInfo.getString("user_password"));
        userAccountInfo.remove("user_password");
        resJson.put("resCode", "00000");
        resJson.put("loginInfo", "success");
        HashMap<String, Object> claims = new HashMap<String, Object>();
        claims.put("id", id);
        resJson.put("token", JwtUtil.generateJwt(claims));
        return true;
    }
}

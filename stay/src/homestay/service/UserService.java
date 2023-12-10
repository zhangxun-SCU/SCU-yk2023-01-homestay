package homestay.service;

import homestay.dao.Data;
import homestay.dao.UserDao;
import homestay.entity.User;
import homestay.utils.EmailUtil;
import homestay.utils.UserUtil;
import org.apache.commons.mail.EmailException;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.Random;

public class UserService {

    public boolean register(Data data, JSONObject resJson) throws JSONException, SQLException {
        UserDao dao = new UserDao();
        // 取数据
        String id = data.getParam().getString("id");
        String email = data.getParam().getString("email");
        // 检查重复id
        User attemptUser = dao.queryUserById(id);
        if(attemptUser.id != null){
           // 存在相同id
            resJson.put("resCode", "R0001");
            resJson.put("registerInfo", "error: duplicate usernames");
           return false;
        }
        User attemptUserEmail = dao.queryUserByKey("email", email);
        if(attemptUserEmail.email != null) {
            // 已经有账号了
            resJson.put("resCode", "R0002");
            resJson.put("registerInfo", "error: account already exists");
            return false;
        }
        dao.addUser(data);
        resJson.put("resCode", "00000");
        resJson.put("registerInfo", "success");
        return true;
    }

    public void modifyUserInfo(Data data, JSONObject resJson) throws JSONException, SQLException {
        UserDao dao = new UserDao();
        String email = data.getParam().getString("email");
        // 检查是否存在
        User attemptUser = dao.queryUserByKey("email", email);
        if(attemptUser.email == null) {
            // 不存在此用户
            resJson.put("resCode", "S0001");
            resJson.put("resetInfo", "user does not exist");
            return;
        }
        // 修改
        dao.modifyUserInfo(data);
        resJson.put("resCode", "00000");
        resJson.put("resetInfo", "success");
    }

    public void modifyUserAvatar(HttpServletRequest req, HttpServletResponse resp, List<String> urls, JSONObject resJson) throws JSONException {
        UserDao dao = new UserDao();
        String id = UserUtil.getUserId(req);
        dao.updateByKey(id, "avatar", urls.get(0));
        resJson.put("resCode", "00000");
        resJson.put("resetInfo", "success");
    }
}

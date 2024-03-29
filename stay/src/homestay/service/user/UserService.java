package homestay.service.user;

import homestay.bean.UserBean;
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
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
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

    public void exportProfile(Data data, JSONObject resJson) throws JSONException, SQLException {
        File txtFile = new File("D:\\upload\\export\\profile.txt");
        resJson.put("url", "/upload/export/profile.txt");
        UserDao userDao = new UserDao();
        User user = userDao.queryUserById(data.getParam().getString("userId"));
        JSONObject json = new JSONObject();
        json.put("ID", user.id);
        json.put("avatar_url", user.avatarURL);
        json.put("permission", user.permission);
        json.put("email", user.email);
        try {
            if(!txtFile.exists()) {
                txtFile.createNewFile();
            }
            BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(txtFile.getAbsoluteFile()));
            bufferedWriter.write(json.toString());
            bufferedWriter.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void exportAllUsers(Data data, JSONObject resJson) throws JSONException {
        File jsonFile = new File("D:\\upload\\export\\allUsers.json");
        resJson.put("url", "/upload/export/allUsers.json");
        List<UserBean> allUsers = UserDao.getAllUsers();
        JSONObject json = new JSONObject();
        List<HashMap<String, String>> jsonList = new ArrayList<>();
        for(UserBean user: allUsers) {
            HashMap<String, String> userJson = new HashMap<>();
            userJson.put("userId", user.getUser_id());
            userJson.put("email", user.getEmail());
            userJson.put("permission", user.getPermission());
            jsonList.add(userJson);
        }
        json.put("users", jsonList);
        try {
            if(!jsonFile.exists()) {
                jsonFile.createNewFile();
            }
            BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(jsonFile.getAbsoluteFile()));
            bufferedWriter.write(json.toString());
            bufferedWriter.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void permissionStatistics(Data data, JSONObject resJson) throws SQLException, JSONException {
        UserDao userDao = new UserDao();
       List<HashMap<String, Integer>> res = userDao.queryPermissionStatistics();
        resJson.put("data", res);
    }
    public List<UserBean> getAllUsers() {

        UserDao userDao=  new UserDao();
        return userDao.getAllUsers();
    }

    public void addNewUser(UserBean user) {
        UserDao userDao=  new UserDao();
        userDao.addNewUser(user);
    }

    public void deleteUserById(String user_id) {
        UserDao userDao=  new UserDao();
        userDao.deleteUserById(user_id);
    }

    public UserBean getUserById(String user_id) {
        UserDao userDao=  new UserDao();
        return  userDao.getUserById(user_id);
    }

    public void updateUserById(UserBean user) {
        UserDao userDao=  new UserDao();
        userDao.updateUserById(user);
    }

    public List<UserBean> searchUsersByUserId(String searchUserId) {
        UserDao userDao=  new UserDao();
        return userDao.searchUsersByUserId(searchUserId);
    }
}

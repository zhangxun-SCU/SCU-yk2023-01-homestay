package homestay.dao;

import homestay.entity.User;
import homestay.utils.Config;
import homestay.utils.UserUtil;
import org.json.JSONException;
import org.json.JSONObject;

import javax.jws.soap.SOAPBinding;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class UserDao {

    public User queryUserById(String id) throws SQLException, JSONException {
        User user = new User();
        String sql = "SELECT * FROM user_account WHERE user_id='" + id + "'";
        System.out.println("queryUserById sql: " + sql);
        DB db = new DB("group1");
        ResultSet rs = db.executeQuery(sql);
        while (rs.next()) {
            user.id = rs.getString("user_id");
            user.password = rs.getString("user_password");
            user.email = rs.getString("email");
            user.priority =  rs.getString("priority");
            user.permission = rs.getString("permission");
            user.avatarURL = rs.getString("avatar");
        }
        rs.close();
        db.close();
        return user;
    }

    public User queryUserByKey(String key, String value) throws SQLException, JSONException {
        User user = new User();
        String sql = "SELECT * FROM user_account WHERE " +  key + "='" + value + "'";
        System.out.println("queryUserByKey sql: " + sql);
        DB db = new DB("group1");
        ResultSet rs = db.executeQuery(sql);
        while (rs.next()) {
            user.id = rs.getString("user_id");
            user.password = rs.getString("user_password");
            user.email = rs.getString("email");
            user.priority =  rs.getString("priority");
            user.permission = rs.getString("permission");
            user.avatarURL = rs.getString("avatar");
        }
        rs.close();
        db.close();
        return user;
    }

    public void addUser(Data data) throws JSONException {
        String sql = "INSERT INTO user_account(user_id,user_password,email,avatar)";
        String id = data.getParam().getString("id");
        String email = data.getParam().getString("email");
        String password = UserUtil.encrypt(data.getParam().getString("password"));
        java.util.Date date = new Date();//获得当前时间
        Timestamp createTime = new Timestamp(date.getTime());//将时间转换成Timestamp类型，便于存入到mysql数据库中
        sql += "VALUES('" + id + "','" + password + "','" + email + "','" + Config.getInstance().getString("default.avatar.url") +"');";
        System.out.println("addUser sql: " + sql);
        DB db = new DB("group1");
        db.executeUpdate(sql);
        db.close();
    }

    public void modifyUserInfo(Data data) throws JSONException {
        java.util.Date date = new Date();//获得当前时间
        Timestamp modifyTime = new Timestamp(date.getTime());//将时间转换成Timestamp类型，便于存入到mysql数据库中
        String id = data.getParam().has("resetId") ? data.getParam().getString("reset_id") : null;
        String email = data.getParam().getString("email");
        String password = UserUtil.encrypt(data.getParam().has("resetPassword") ? data.getParam().getString("resetPassword") : null);
        String sql = "UPDATE user_account";
        boolean firstModify = true;
        if(id != null) {
            // reset id
            if(firstModify) {
                sql += " SET user_id='" + id + "'";
                firstModify = false;
            } else {
                sql += " ,user_id='" + id + "'";
            }
        }
        if(password != null) {
            if(firstModify) {
                sql += " SET user_password='" + password + "'";
                firstModify = false;
            } else {
                sql += " ,user_password='" + password + "'";
            }
        }
        sql += " WHERE email='" + email + "'";
        System.out.println("modify user info sql: " + sql);
        DB db = new DB("group1");
        db.executeUpdate(sql);
        db.close();
    }

    public void updateByKey(String userId, String key, String value) {
        String sql = "UPDATE user_account";
        if(value != null) {
            sql += " SET " + key + "='" + value + "'";
        }
        sql += " WHERE user_id='" + userId + "'";
        System.out.println(sql);
        DB db = new DB("group1");
        db.executeUpdate(sql);
        db.close();
    }
}

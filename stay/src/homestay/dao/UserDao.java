package homestay.dao;

import org.json.JSONException;
import org.json.JSONObject;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

public class UserDao {

    public JSONObject queryUserById(String id) throws SQLException, JSONException {
        JSONObject obj = new JSONObject();
        String sql = "SELECT * FROM user_account WHERE user_id='" + id + "'";
        System.out.println("queryUserById sql: " + sql);
        DB db = new DB("group1");
        ResultSet rs = db.executeQuery(sql);
        while (rs.next()) {
            obj.put("user_id", rs.getString("user_id"));
            obj.put("user_password", rs.getString("user_password"));
            obj.put("email", rs.getString("email"));
            obj.put("priority", rs.getString("priority"));
        }
        rs.close();
        db.close();
        return obj;
    }

    public void addUser(Data data) throws JSONException {
        String sql = "INSERT INTO user_account(user_id,user_password,email)";
        String id = data.getParam().getString("id");
        String email = data.getParam().getString("email");
        String password = data.getParam().getString("password");
        sql += "VALUES('" + id + "','" + email + "','" + password + "');";
        System.out.println("addUser sql: " + sql);
        DB db = new DB("group1");
        db.executeUpdate(sql);
        db.close();
    }
}

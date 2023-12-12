package homestay.dao;

import homestay.entity.User;
import homestay.utils.Config;
import homestay.utils.UserUtil;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import homestay.bean.UserBean;

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
    public static List<UserBean> getAllUsers() {
        JSONObject obj = new JSONObject();
        String sql = "SELECT * FROM user_account ";
        System.out.println("queryUserByKey sql: " + sql);
        List<UserBean> result=new ArrayList<>();
        DB db = new DB("group1");
        try {
            ResultSet rs = db.executeQuery(sql);
            while (rs.next()) {
                UserBean  user = new UserBean ();
                user.setUser_id(rs.getString("user_id"));
                user.setUser_password(rs.getString("user_password"));
                user.setEmail(rs.getString("email"));
                user.setPermission(rs.getString("permission"));
                user.setPriority(rs.getString("priority"));
                result.add(user);
            }
            rs.close();
            db.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    public void addNewUser(UserBean user) {
        JSONObject obj = new JSONObject();
        String sql = "INSERT INTO user_account (user_id, user_password, email, permission,priority) VALUES (?, ?, ?, ?,?)";
        System.out.println("addNewUser sql: " + sql);
        DB db = new DB("group1");

        try {
            // 使用 PreparedStatement 防止 SQL 注入
            java.sql.PreparedStatement preparedStatement = db.getConnection().prepareStatement(sql);

            // 为 SQL 查询中的参数设置值
            preparedStatement.setString(1, user.getUser_id());
            preparedStatement.setString(2, user.getUser_password());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getPermission());
            preparedStatement.setString(5, user.getPriority());
            // 执行 SQL 查询
            preparedStatement.executeUpdate();

            // 关闭资源
            preparedStatement.close();
            db.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public void deleteUserById(String userId) {
        JSONObject obj = new JSONObject();
        String sql = "DELETE FROM user_account WHERE user_id = ?";
        System.out.println("deleteUserById sql: " + sql);
        DB db = new DB("group1");

        try {
            // 使用 PreparedStatement 防止 SQL 注入
            java.sql.PreparedStatement preparedStatement = db.getConnection().prepareStatement(sql);

            // 为 SQL 查询中的参数设置值
            preparedStatement.setString(1, userId);

            // 执行 SQL 查询
            int rowsAffected = preparedStatement.executeUpdate();

            // 根据影响的行数判断是否成功删除用户
            if (rowsAffected > 0) {
                System.out.println("User with ID " + userId + " deleted successfully.");
            } else {
                System.out.println("User with ID " + userId + " not found or deletion failed.");
            }

            // 关闭资源
            preparedStatement.close();
            db.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public UserBean getUserById(String userId) {
        // 创建一个空的 User 对象，用于存储查询结果
        UserBean user = new UserBean();

        // SQL 查询语句，从名为 "user_account" 的表中选择所有列的数据
        String sql = "SELECT * FROM user_account WHERE user_id = ?";
        System.out.println("getUserById sql: " + sql);

        // 创建一个数据库连接对象
        DB db = new DB("group1");

        try {
            // 使用 PreparedStatement 防止 SQL 注入
            java.sql.PreparedStatement preparedStatement = db.getConnection().prepareStatement(sql);

            // 为 SQL 查询中的参数设置值
            preparedStatement.setString(1, userId);

            // 执行 SQL 查询，并获取结果集
            ResultSet rs = preparedStatement.executeQuery();

            // 检查是否有结果
            if (rs.next()) {
                // 从结果集中获取当前行的每个列的值，并设置到 User 对象中
                user.setUser_id(rs.getString("user_id"));
                user.setUser_password(rs.getString("user_password"));
                user.setEmail(rs.getString("email"));
                user.setPermission(rs.getString("permission"));
                user.setPriority(rs.getString("priority"));
            }

            // 关闭结果集和数据库连接
            rs.close();
            preparedStatement.close();
            db.close();

        } catch (SQLException e) {
            // 处理可能发生的 SQL 异常，将其转换为运行时异常抛出
            throw new RuntimeException(e);
        }

        // 返回包含用户信息的 User 对象
        return user;
    }

    public void updateUserById(UserBean user) {
        String sql = "UPDATE user_account SET user_password = ?, email = ?, permission = ?, priority = ? WHERE user_id = ?";
        DB db = new DB("group1");

        try {
            // 使用 PreparedStatement 防止 SQL 注入
            java.sql.PreparedStatement preparedStatement = db.getConnection().prepareStatement(sql);

            // 设置密码参数
            preparedStatement.setString(1, (user.getUser_password() != null) ? user.getUser_password() : "defaultPassword");

            // 设置email参数，如果为null，则使用默认值
            preparedStatement.setString(2, (user.getEmail() != null) ? user.getEmail() : "defaultEmail");

            // 设置其他参数
            preparedStatement.setString(3, user.getPermission());
            preparedStatement.setString(4, user.getPriority());
            preparedStatement.setString(5, user.getUser_id());
            System.out.println("updateUserById sql: " + sql);
            // 执行 SQL 查询
            preparedStatement.executeUpdate();

            // 关闭资源
            preparedStatement.close();
            db.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public List<UserBean> searchUsersByUserId(String searchUserId) {
        // 创建一个空的 User 列表，用于存储查询结果
        List<UserBean> users = new ArrayList<>();

        // SQL 查询语句，从名为 "user_account" 的表中选择所有列的数据
        String sql = "SELECT * FROM user_account WHERE user_id LIKE ?";
        System.out.println("searchUsersByUserId sql: " + sql);

        // 创建一个数据库连接对象
        DB db = new DB("group1");

        try {
            // 使用 PreparedStatement 防止 SQL 注入
            java.sql.PreparedStatement preparedStatement = db.getConnection().prepareStatement(sql);

            // 为 SQL 查询中的参数设置值
            preparedStatement.setString(1, "%" + searchUserId + "%");

            // 执行 SQL 查询，并获取结果集
            ResultSet rs = preparedStatement.executeQuery();

            // 遍历结果集
            while (rs.next()) {
                // 创建一个新的 User 对象，用于存储当前行的每个列的值
                UserBean user = new UserBean();
                user.setUser_id(rs.getString("user_id"));
                user.setUser_password(rs.getString("user_password"));
                user.setEmail(rs.getString("email"));
                user.setPermission(rs.getString("permission"));
                user.setPriority(rs.getString("priority"));

                // 将用户添加到列表中
                users.add(user);
            }

            // 关闭结果集和数据库连接
            rs.close();
            preparedStatement.close();
            db.close();

        } catch (SQLException e) {
            // 处理可能发生的 SQL 异常，将其转换为运行时异常抛出
            throw new RuntimeException(e);
        }

        // 返回包含用户信息的 User 列表
        return users;
    }
}

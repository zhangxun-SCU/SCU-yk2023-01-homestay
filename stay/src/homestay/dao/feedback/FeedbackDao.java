package homestay.dao.feedback;

import homestay.dao.DB;
import homestay.dao.Data;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

public class FeedbackDao {
    private void showDebug(String function, String message) {
        String log = "[FeedbackDao]" + function + message;
        System.out.println(log);
    }

    public void getAllFeedback(Data data, JSONObject json) throws SQLException, JSONException {
        String resCode = "00000";
        String info = "success";
        DB db = new DB("group1");
        // 两表联查，获取用户头像以及feedback信息，按照feedback发布时间降序排列
        String sql = "Select feedback.*, user_account.avatar " +
                "From feedback Join user_account " +
                "On feedback.user_id=user_account.user_id";
        if (data.getParam().has("order")) {
            String order = data.getParam().getString("order");
            sql += " Order By feedback.create_time " + order;
        }
        showDebug("[getFeedback]", "sql: " + sql);
        ResultSet res = db.executeQuery(sql);
        ResultSetMetaData resMetaData = res.getMetaData();
        int fieldCount = resMetaData.getColumnCount();
        List feedbackList = new ArrayList();
        while (res.next()) {
            Map feedback = new HashMap();
            for (int i = 0; i < fieldCount; i++) {
                String key = resMetaData.getColumnName(i + 1);
                String value = res.getString(key);
                feedback.put(key, value);
                showDebug("[getAllFeedback]", key + ": " + value);
            }
            feedbackList.add(feedback);
        }
        res.close();
        db.close();
        json.put("resCode", resCode);
        json.put("getFeedbackInfo", info);
        json.put("feedbackList", feedbackList);
    }

    public void getFeedbackById(String fid, JSONObject json) throws SQLException, JSONException {
        DB db = new DB("group1");
        String resCode = "00000";
        String info = "success";
        String sql = "Select * From feedback Where fid='" + fid + "'";
        ResultSet res = db.executeQuery(sql);
        ResultSetMetaData resMetaData = res.getMetaData();
        int fieldCount = resMetaData.getColumnCount();
        List feedbackList = new ArrayList();
        while (res.next()) {
            Map feedback = new HashMap();
            for (int i = 0; i < fieldCount; i++) {
                String key = resMetaData.getColumnName(i + 1);
                String value = res.getString(key);
                feedback.put(key, value);
                showDebug("[getFeedbackById]", key + ": " + value);
            }
            feedbackList.add(feedback);
        }
        res.close();
        db.close();
        json.put("resCode", resCode);
        json.put("getFeedbackInfo", info);
        json.put("feedbackList", feedbackList);
    }

    public void replyFeedback(String fid, String reply, JSONObject json) throws JSONException {
        DB db = new DB("group1");
        String resCode = "00000";
        String info = "success";
        try {
            String sql = "Update feedback Set reply='" + reply + "' Where fid='" + fid + "'";
            db.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
            resCode = "F0002";
            info = "找不到反馈信息";
        }
        db.close();
        json.put("resCode", resCode);
        json.put("replyFeedbackInfo", info);
    }

    private boolean checkParamValid(JSONObject param, String field) throws JSONException {
        boolean ok = false;
        ok = param.has(field) && param.getString(field) != null && !param.getString(field).isEmpty() && !param.getString(field).equals("undefined") && !param.getString(field).equals("null");
        return ok;
    }

    /*添加反馈*/
    public void addFeedback(Data data, JSONObject json) throws JSONException, SQLException {
        //构造sql语句，根据传递过来的条件参数
        String fid = "F" + Long.toString(new Date().getTime());
        String user_id = data.getParam().has("user_id") ? data.getParam().getString("user_id") : null;
        String feedback = data.getParam().has("feedback") ? data.getParam().getString("feedback") : null;
        String create_time = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date());
        if (user_id != null) {
//            String sql = "insert into feedback(fid, user_id, feedback, create_time)";
//            sql = sql + " values('" + user_id + "'";
//            sql = sql + " ,'" + feedback + "','" + create_time + "')";
            String sql = String.format(
                    "Insert Into feedback(fid, user_id, feedback, create_time) Values('%s', '%s', '%s', '%s')",
                    fid,
                    user_id,
                    feedback,
                    create_time
            );
            System.out.println(sql);
            data.getParam().put("sql", sql);
            updateRecord(data, json);
        }
    }

    /*删除反馈*/
    public void deleteFeedback(Data data, JSONObject json) throws JSONException, SQLException {
        //构造sql语句，根据传递过来的条件参数
        String fid = data.getParam().has("fid") ? data.getParam().getString("fid") : null;
        if (fid != null) {
            String sql = "delete from feedback where fid='" + fid + "'";
            data.getParam().put("sql", sql);
            updateRecord(data, json);
        }
    }

    public void getDeviceRecord(Data data, JSONObject json) throws JSONException, SQLException {
        //构造sql语句，根据传递过来的查询条件参数
        String sql = createGetRecordSql(data);            //构造sql语句，根据传递过来的查询条件参数
        data.getParam().put("sql", sql);
        queryRecord(data, json);
    }

    private void updateRecord(Data data, JSONObject json) throws JSONException, SQLException {
        /*--------------------获取变量 开始--------------------*/
        JSONObject param = data.getParam();
        int resultCode = 0;
        String resultMsg = "ok";
        /*--------------------获取变量 完毕--------------------*/
        /*--------------------数据操作 开始--------------------*/
        DB updateDb = new DB("group1");
        String sql = data.getParam().getString("sql");
        showDebug("[updateRecord]", "sql: " + sql);
        updateDb.executeUpdate(sql);
        updateDb.close();
        /*--------------------数据操作 结束--------------------*/
        /*--------------------返回数据 开始--------------------*/
        json.put("result_msg", resultMsg);                                                            //如果发生错误就设置成"error"等
        json.put("result_code", resultCode);                                                        //返回0表示正常，不等于0就表示有错误产生，错误代码
        /*--------------------返回数据 结束--------------------*/
    }

    private void queryRecord(Data data, JSONObject json) throws JSONException, SQLException {
        /*--------------------获取变量 开始--------------------*/
        String resultMsg = "ok";
        int resultCode = 0;
        List jsonList = new ArrayList();
        List jsonName = new ArrayList();
        /*--------------------获取变量 完毕--------------------*/
        /*--------------------数据操作 开始--------------------*/
        DB queryDb = new DB("group1");
        String sql = data.getParam().getString("sql");
        showDebug("[queryRecord]", "构造的SQL语句是：" + sql);
        try {
            ResultSet rs = queryDb.executeQuery(sql);
            ResultSetMetaData rsmd = rs.getMetaData();
            int fieldCount = rsmd.getColumnCount();
            while (rs.next()) {
                Map map = new HashMap();
                for (int i = 0; i < fieldCount; i++) {
                    map.put(rsmd.getColumnName(i + 1), rs.getString(rsmd.getColumnName(i + 1)));
                }
                jsonList.add(map);
            }
            rs.close();
            // 记录表头信息
            for (int i = 0; i < fieldCount; i++) {
                String columnLabel = rsmd.getColumnLabel(i + 1);
                jsonName.add(columnLabel);
            }
        } catch (Exception e) {
            e.printStackTrace();
            showDebug("[queryRecord]", "查询数据库出现错误：" + sql);
            resultCode = 10;
            resultMsg = "查询数据库出现错误！" + e.getMessage();
        }
        queryDb.close();
        /*--------------------数据操作 结束--------------------*/
        /*--------------------返回数据 开始--------------------*/
        json.put("aaData", jsonList);
        json.put("aaFieldName", jsonName);
        json.put("result_msg", resultMsg);                                                            //如果发生错误就设置成"error"等
        json.put("result_code", resultCode);                                                        //返回0表示正常，不等于0就表示有错误产生，错误代码
        /*--------------------返回数据 结束--------------------*/
    }

    private String createGetRecordSql(Data data) throws JSONException {
        JSONObject param = data.getParam();
        String sql = "select * from feedback";
        String fid = data.getParam().has("fid") ? data.getParam().getString("fid") : null;
        if (fid != null && (!fid.isEmpty())) {
            sql = sql + " where fid=" + fid;
        }
        String user_id = data.getParam().has("user_id") ? data.getParam().getString("user_id") : null;
        if (user_id != null && (!user_id.isEmpty())) {
            if (sql.indexOf("where") > -1) {
                sql = sql + " and user_id like '%" + user_id + "%'";
            } else {
                sql = sql + " where user_id like '%" + user_id + "%'";
            }
        }
        return sql;
    }
}

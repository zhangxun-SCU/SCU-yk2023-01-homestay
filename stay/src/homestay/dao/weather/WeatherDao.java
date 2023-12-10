package homestay.dao;

import org.json.JSONException;
import org.json.JSONObject;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

public class WeatherDao {
    private void showDebug(String msg) {
    System.out.println("[" + (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date()) + "][homestay/dao/DB]" + msg);
}

    private boolean checkParamValid(JSONObject param, String field) throws JSONException {
        boolean ok = false;
        ok = param.has(field) && param.getString(field) != null && !param.getString(field).isEmpty() && !param.getString(field).equals("undefined") && !param.getString(field).equals("null");
        return ok;
    }

    /*添加记录*/
    public void addDeviceRecord(Data data, JSONObject json) throws JSONException, SQLException {
        //构造sql语句，根据传递过来的条件参数
        String create_id = data.getParam().has("create_id") ? data.getParam().getString("create_id") : null;
        String city = data.getParam().has("city") ? data.getParam().getString("city") : null;
        String temperature = data.getParam().has("temperature") ? data.getParam().getString("temperature") : null;
        String weather_type = data.getParam().has("weather_type") ? data.getParam().getString("weather_type") : null;
        String creator = data.getParam().has("creator") ? data.getParam().getString("creator") : null;
        String wind = data.getParam().has("wind") ? data.getParam().getString("wind") : null;
        String humidity = data.getParam().has("humidity") ? data.getParam().getString("humidity") : null;
        String create_time = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date());
        if (create_id != null && city!= null) {
            String sql = "insert into weather(city, temperature, weather_type, wind,create_id,creator,create_time,humidity)";
            sql = sql + " values('" + city + "'";
            sql = sql + " ,'" + temperature + "','" + weather_type + "','" + wind + "','" + create_id + "','" + creator + "','" + create_time+ "','" + humidity+ "')";
            data.getParam().put("sql", sql);
            updateRecord(data, json);
        }
    }

    /*删除记录*/
    public void deleteDeviceRecord(Data data, JSONObject json) throws JSONException, SQLException {
        //构造sql语句，根据传递过来的条件参数
        String id = data.getParam().has("id") ? data.getParam().getString("id") : null;
        if (id != null) {
            String sql = "delete from weather_file where id=" + data.getParam().getString("id");
            data.getParam().put("sql", sql);
            updateRecord(data, json);
        }
    }

    /*修改记录*/
    public void modifyDeviceRecord(Data data, JSONObject json) throws JSONException, SQLException {
        //构造sql语句，根据传递过来的条件参数
        String id = data.getParam().has("id") ? data.getParam().getString("id") : null;
        String city = data.getParam().has("city") ? data.getParam().getString("city") : null;
        String temperature = data.getParam().has("temperature") ? data.getParam().getString("temperature") : null;
        String weather_type = data.getParam().has("weather_type") ? data.getParam().getString("weather_type") : null;
        String creator = data.getParam().has("creator") ? data.getParam().getString("creator") : null;
        String wind = data.getParam().has("wind") ? data.getParam().getString("wind") : null;
        String humidity = data.getParam().has("humidity") ? data.getParam().getString("humidity") : null;
        String create_time = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date());
        if (id != null) {
            String sql = "update weather";
            sql = sql + " set =city'" + city + "'";
            sql = sql + " ,temperature='" + temperature + "'";
            sql = sql + " ,weather_type='" + weather_type + "'";
            sql = sql + " ,creator='" + creator + "'";
            sql = sql + " ,wind='" + wind + "'";
            sql = sql + " ,humidity='" + humidity+ "'";
            sql = sql + " where id=" + id;
            data.getParam().put("sql",sql);
            updateRecord(data,json);
        }
    }

    /*查询记录*/
    public void getDeviceRecord(Data data, JSONObject json) throws JSONException, SQLException {
        //构造sql语句，根据传递过来的查询条件参数
        String sql = createGetRecordSql(data);            //构造sql语句，根据传递过来的查询条件参数
        data.getParam().put("sql", sql);
        queryRecord(data, json);
    }

    /*
     * 这是一个样板的函数，可以拷贝做修改用
     */
    private void updateRecord(Data data, JSONObject json) throws JSONException, SQLException {
        /*--------------------获取变量 开始--------------------*/
        JSONObject param = data.getParam();
        int resultCode = 0;
        String resultMsg = "ok";
        /*--------------------获取变量 完毕--------------------*/
        /*--------------------数据操作 开始--------------------*/
        DB updateDb = new DB("group1");
        String sql = data.getParam().getString("sql");
        showDebug("[updateRecord]" + sql);
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
        showDebug("[queryRecord]构造的SQL语句是：" + sql);
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
            showDebug("[queryRecord]查询数据库出现错误：" + sql);
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
        JSONObject param=data.getParam();
        String sql="select * from weather_file";
        String id=data.getParam().has("id")?data.getParam().getString("id"):null;
        if(id!=null && (! id.isEmpty())){
            sql=sql+" where id="+id;
        }
        String deviceId=data.getParam().has("device_id")?data.getParam().getString("device_id"):null;
        if(deviceId!=null && (! deviceId.isEmpty())){
            if(sql.indexOf("where")>-1){
                sql=sql+" and device_id like '%"+deviceId+"%'";
            }else{
                sql=sql+" where device_id like '%"+deviceId+"%'";
            }
        }
        String deviceName=data.getParam().has("device_name")?data.getParam().getString("device_name"):null;
        if(deviceName!=null && (! deviceName.isEmpty())){
            if(sql.indexOf("where")>-1){
                sql=sql+" and device_name like '%"+deviceName+"%'";
            }else{
                sql=sql+" where device_name like '%"+deviceName+"%'";
            }
        }
        return sql;
    }
}

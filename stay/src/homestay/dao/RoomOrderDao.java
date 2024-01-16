package homestay.dao;

import org.json.JSONException;
import org.json.JSONObject;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

public class RoomOrderDao {
    public void showDebug(String msg){
        System.out.println("["+(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date())+"][device/dao/Db]"+msg);
    }
    private boolean checkParamValid(JSONObject param, String field) throws JSONException {
        boolean ok=false;
        ok=param.has(field) && param.getString(field)!=null && !param.getString(field).isEmpty() && !param.getString(field).equals("undefined") && !param.getString(field).equals("null");
        return ok;
    }
    /*添加记录*/
    public void addDeviceRecord(Data data, JSONObject json) throws JSONException, SQLException {
        //构造sql语句，根据传递过来的条件参数
        String deviceId=data.getParam().has("device_id")?data.getParam().getString("device_id"):null;
        String deviceName=data.getParam().has("device_name")?data.getParam().getString("device_name"):null;
        String deviceType=data.getParam().has("device_type")?data.getParam().getString("device_type"):null;
        String createTime=(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date());
        if(deviceId!=null && deviceName!=null){
            String sql="insert into device_file(device_id,device_name,device_type,used_tag,creator_id,creator,create_time)";
            sql=sql+" values('"+deviceId+"'";
            sql=sql+" ,'"+deviceName+"','"+deviceType+"',1,'20220000000000001','student','"+createTime+"')";
            data.getParam().put("sql",sql);
            updateRecord(data,json);
        }
    }
    /*删除记录*/
    public void deleteDeviceRecord(Data data, JSONObject json) throws JSONException, SQLException{
        //构造sql语句，根据传递过来的条件参数
        String good_id=data.getParam().has("good_id")?data.getParam().getString("good_id"):null;
        if(good_id!=null){
            String sql="delete from deal_order where good_id='"+ data.getParam().getString("good_id")+"'";
            data.getParam().put("sql",sql);
            updateRecord(data,json);
        }
    }
    public void deleteDeviceRecordSeller(Data data, JSONObject json) throws JSONException, SQLException{
        //构造sql语句，根据传递过来的条件参数
        String id=data.getParam().has("order_id")?data.getParam().getString("order_id"):null;
        if(id!=null){
            String sql="delete from specialty_order where order_id='"+ data.getParam().getString("order_id")+"'";
            data.getParam().put("sql",sql);
            updateRecord(data,json);
        }
    }
    public void payRoomOrderRecord(Data data, JSONObject json) throws JSONException, SQLException{
        //构造sql语句，根据传递过来的条件参数
        String good_id=data.getParam().has("good_id")?data.getParam().getString("good_id"):null;
        int status=1;
        if(good_id!=null){
            String sql="update deal_order set order_status="+status+" where good_id='"+good_id+"'";
            data.getParam().put("sql",sql);
            updateRecord(data,json);
            showDebug("[paySpecialtyOrder]构造的SQL语句是：" + sql);
        }
    }
    /*修改记录*/
    public void modifyDeviceRecord(Data data, JSONObject json) throws JSONException, SQLException{
        //构造sql语句，根据传递过来的条件参数
        String good_id=data.getParam().has("good_id")?data.getParam().getString("good_id"):null;
        String price=data.getParam().has("price")?data.getParam().getString("price"):null;
        if(good_id!=null){
            String sql="update deal_order";
            //sql=sql+" set order_id='"+order_id+"'";
            //sql=sql+" ,specialty_name='"+specialty_name+"'";
            sql=sql+" set price="+price;
            sql=sql+" where good_id='"+good_id+"'";
            data.getParam().put("sql",sql);
            updateRecord(data,json);
            showDebug("[modifyDeviceRecord]构造的SQL语句是：" + sql);
        }
//        if(specialty_name!=null){
//            String sql="update specialty";
//            sql=sql+" set specialty_name='"+specialty_name+"'";
//            sql=sql+" where specialty_id='"+good_id+"'";
//            data.getParam().put("sql",sql);
//            updateRecord(data,json);
//            showDebug("[modifyDeviceRecord]构造的SQL语句是：" + sql);
//        }
    }
    /*查询记录*/
    public void getOrderRecord(Data data, JSONObject json) throws JSONException, SQLException{
        //构造sql语句，根据传递过来的查询条件参数
        String sql=createGetRecordSql(data);			//构造sql语句，根据传递过来的查询条件参数
        data.getParam().put("sql",sql);
        queryRecord(data,json);
    }
    public void getOrderRecordSeller(Data data, JSONObject json) throws JSONException, SQLException{
        //构造sql语句，根据传递过来的查询条件参数
        String sql=createGetRecordSellerSql(data);			//构造sql语句，根据传递过来的查询条件参数
        data.getParam().put("sql",sql);
        queryRecord(data,json);
    }
    public void getDeviceRecordFinished(Data data, JSONObject json) throws JSONException, SQLException{
        //构造sql语句，根据传递过来的查询条件参数
        String sql=createGetRecordSqlFinished(data);			//构造sql语句，根据传递过来的查询条件参数
        data.getParam().put("sql",sql);
        queryRecord(data,json);
    }
    public void getDeviceRecordFinishedRecord(Data data, JSONObject json) throws JSONException, SQLException{
        //构造sql语句，根据传递过来的查询条件参数
        String sql=createGetRecordSqlFinishedSeller(data);			//构造sql语句，根据传递过来的查询条件参数
        data.getParam().put("sql",sql);
        queryRecord(data,json);
    }
    public void getDeviceRecordUnfinished(Data data, JSONObject json) throws JSONException, SQLException{
        //构造sql语句，根据传递过来的查询条件参数
        String sql=createGetRecordSqlUnfinished(data);			//构造sql语句，根据传递过来的查询条件参数
        data.getParam().put("sql",sql);
        queryRecord(data,json);
    }
    public void getDeviceRecordUnfinishedSeller(Data data, JSONObject json) throws JSONException, SQLException{
        //构造sql语句，根据传递过来的查询条件参数
        String sql=createGetRecordSqlUnfinishedSeller(data);			//构造sql语句，根据传递过来的查询条件参数
        data.getParam().put("sql",sql);
        queryRecord(data,json);
    }
    public void getDeviceRecordUp(Data data, JSONObject json) throws JSONException, SQLException{
        //构造sql语句，根据传递过来的查询条件参数
        String sql=createGetRecordSqlUp(data);			//构造sql语句，根据传递过来的查询条件参数
        data.getParam().put("sql",sql);
        queryRecord(data,json);
    }
    public void getDeviceRecordUpSeller(Data data, JSONObject json) throws JSONException, SQLException{
        //构造sql语句，根据传递过来的查询条件参数
        String sql=createGetRecordSqlUpSeller(data);			//构造sql语句，根据传递过来的查询条件参数
        data.getParam().put("sql",sql);
        queryRecord(data,json);
    }
    public void getDeviceRecordDown(Data data, JSONObject json) throws JSONException, SQLException{
        //构造sql语句，根据传递过来的查询条件参数
        String sql=createGetRecordSqlDown(data);			//构造sql语句，根据传递过来的查询条件参数
        data.getParam().put("sql",sql);
        queryRecord(data,json);
    }
    public void getDeviceRecordDownSeller(Data data, JSONObject json) throws JSONException, SQLException{
        //构造sql语句，根据传递过来的查询条件参数
        String sql=createGetRecordSqlDownSeller(data);			//构造sql语句，根据传递过来的查询条件参数
        data.getParam().put("sql",sql);
        queryRecord(data,json);
    }
    /*
     * 这是一个样板的函数，可以拷贝做修改用
     */
    private void updateRecord(Data data, JSONObject json) throws JSONException, SQLException{
        /*--------------------获取变量 开始--------------------*/
        JSONObject param=data.getParam();
        int resultCode=0;
        String resultMsg="ok";
        /*--------------------获取变量 完毕--------------------*/
        /*--------------------数据操作 开始--------------------*/
        DB updateDb = new DB("group1");
        String sql=data.getParam().getString("sql");
        showDebug("[updateRecord]"+sql);
        updateDb.executeUpdate(sql);
        updateDb.close();
        /*--------------------数据操作 结束--------------------*/
        /*--------------------返回数据 开始--------------------*/
        json.put("result_msg",resultMsg);															//如果发生错误就设置成"error"等
        json.put("result_code",resultCode);														//返回0表示正常，不等于0就表示有错误产生，错误代码
        /*--------------------返回数据 结束--------------------*/
    }
    private void queryRecord(Data data, JSONObject json) throws JSONException, SQLException{
        /*--------------------获取变量 开始--------------------*/
        String resultMsg = "ok";
        int resultCode = 0;
        List jsonList = new ArrayList();
        List jsonName = new ArrayList();
        /*--------------------获取变量 完毕--------------------*/
        /*--------------------数据操作 开始--------------------*/
        DB queryDb = new DB("group1");
        String sql=data.getParam().getString("sql");
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
            //加表头信息
            for(int i=0;i<fieldCount;i++){
                String columnLabel=rsmd.getColumnLabel(i+1);
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
        json.put("aaData",jsonList);
        json.put("aaFieldName",jsonName);
        json.put("result_msg",resultMsg);															//如果发生错误就设置成"error"等
        json.put("result_code",resultCode);														//返回0表示正常，不等于0就表示有错误产生，错误代码
        /*--------------------返回数据 结束--------------------*/
    }

    private String createGetRecordSql(Data data) throws JSONException {
        JSONObject param=data.getParam();
        String username=data.getParam().has("username")?data.getParam().getString("username"):null;
        String sql="select * from deal_order,house,room,room_occupy where deal_order.good_id=room_occupy.op_id and room.house_id=room_occupy.house_id and room.room_id=room_occupy.room_id and house.house_id=room.house_id and buyer_id='"+username+"' ";
        String good_id=data.getParam().has("good_id")?data.getParam().getString("good_id"):null;
        if(good_id!=null && (! good_id.isEmpty())){
            sql=sql+" and good_id like '%"+good_id+"%'";
        }
        String house_name=data.getParam().has("house_name")?data.getParam().getString("house_name"):null;
        if(house_name!=null && (! house_name.isEmpty())){
            sql=sql+" and house_name like '%"+house_name+"%'";
        }
        String room_name=data.getParam().has("room_name")?data.getParam().getString("room_name"):null;
        if(room_name!=null && (! room_name.isEmpty())){
            sql=sql+" and room_name like '%"+room_name+"%'";
        }
        return sql;
    }
    private String createGetRecordSellerSql(Data data) throws JSONException {
        JSONObject param=data.getParam();
        String username=data.getParam().has("username")?data.getParam().getString("username"):null;
        String sql="select * from specialty_order, specialty where specialty_order.good_id=specialty.specialty_id and owner_id='"+username+"'";
        String order_id=data.getParam().has("order_id")?data.getParam().getString("order_id"):null;
        if(order_id!=null && (! order_id.isEmpty())){
            sql=sql+" and order_id like '%"+order_id+"%'";
        }
        String specialty_name=data.getParam().has("specialty_name")?data.getParam().getString("specialty_name"):null;
        if(specialty_name!=null && (! specialty_name.isEmpty())){
            sql=sql+" and specialty_name like '%"+specialty_name+"%'";
        }

        return sql;
    }
    private String createGetRecordSqlFinished(Data data) throws JSONException {
        JSONObject param=data.getParam();
        String username=data.getParam().has("username")?data.getParam().getString("username"):null;

        String sql="select * from deal_order,house,room,room_occupy where deal_order.good_id=room_occupy.op_id and room.house_id=room_occupy.house_id and room.room_id=room_occupy.room_id and house.house_id=room.house_id and order_status != 0 and buyer_id='"+username+"' ";
        String good_id=data.getParam().has("good_id")?data.getParam().getString("good_id"):null;
        if(good_id!=null && (! good_id.isEmpty())){
            sql=sql+" and good_id like '%"+good_id+"%'";
        }
        String house_name=data.getParam().has("house_name")?data.getParam().getString("house_name"):null;
        if(house_name!=null && (! house_name.isEmpty())){
            sql=sql+" and house_name like '%"+house_name+"%'";
        }
        String room_name=data.getParam().has("room_name")?data.getParam().getString("room_name"):null;
        if(room_name!=null && (! room_name.isEmpty())){
            sql=sql+" and room_name like '%"+room_name+"%'";
        }
        return sql;
    }
    private String createGetRecordSqlFinishedSeller(Data data) throws JSONException {
        JSONObject param=data.getParam();
        String username=data.getParam().has("username")?data.getParam().getString("username"):null;
        String sql="select * from specialty_order, specialty where specialty_order.good_id=specialty.specialty_id and order_status != 0 and owner_id='"+username+"'";
        String order_id=data.getParam().has("order_id")?data.getParam().getString("order_id"):null;
        if(order_id!=null && (! order_id.isEmpty())){
            sql=sql+" and order_id like '%"+order_id+"%'";
        }
        String specialty_name=data.getParam().has("specialty_name")?data.getParam().getString("specialty_name"):null;
        if(specialty_name!=null && (! specialty_name.isEmpty())){
            sql=sql+" and specialty_name like '%"+specialty_name+"%'";
        }
        return sql;
    }
    private String createGetRecordSqlUnfinished(Data data) throws JSONException {
        JSONObject param=data.getParam();
        String username=data.getParam().has("username")?data.getParam().getString("username"):null;

        String sql="select * from deal_order,house,room,room_occupy where deal_order.good_id=room_occupy.op_id and room.house_id=room_occupy.house_id and room.room_id=room_occupy.room_id and house.house_id=room.house_id and order_status = 0 and buyer_id='"+username+"' ";
        String good_id=data.getParam().has("good_id")?data.getParam().getString("good_id"):null;
        if(good_id!=null && (! good_id.isEmpty())){
            sql=sql+" and good_id like '%"+good_id+"%'";
        }
        String house_name=data.getParam().has("house_name")?data.getParam().getString("house_name"):null;
        if(house_name!=null && (! house_name.isEmpty())){
            sql=sql+" and house_name like '%"+house_name+"%'";
        }
        String room_name=data.getParam().has("room_name")?data.getParam().getString("room_name"):null;
        if(room_name!=null && (! room_name.isEmpty())){
            sql=sql+" and room_name like '%"+room_name+"%'";
        }
        return sql;
    }
    private String createGetRecordSqlUnfinishedSeller(Data data) throws JSONException {
        JSONObject param=data.getParam();
        String username=data.getParam().has("username")?data.getParam().getString("username"):null;
        String sql="select * from specialty_order, specialty where specialty_order.good_id=specialty.specialty_id and order_status = 0 and owner_id='"+username+"'";
        String order_id=data.getParam().has("order_id")?data.getParam().getString("order_id"):null;
        if(order_id!=null && (! order_id.isEmpty())){
            sql=sql+" and order_id like '%"+order_id+"%'";
        }
        String specialty_name=data.getParam().has("specialty_name")?data.getParam().getString("specialty_name"):null;
        if(specialty_name!=null && (! specialty_name.isEmpty())){
            sql=sql+" and specialty_name like '%"+specialty_name+"%'";
        }
        return sql;
    }
    private String createGetRecordSqlUp(Data data) throws JSONException {
        JSONObject param=data.getParam();
        String username=data.getParam().has("username")?data.getParam().getString("username"):null;

        String sql="select * from deal_order,house,room,room_occupy where deal_order.good_id=room_occupy.op_id and room.house_id=room_occupy.house_id and room.room_id=room_occupy.room_id and house.house_id=room.house_id and buyer_id='"+username+"' ";
        String good_id=data.getParam().has("good_id")?data.getParam().getString("good_id"):null;
        if(good_id!=null && (! good_id.isEmpty())){
            sql=sql+" and good_id like '%"+good_id+"%'";
        }
        String house_name=data.getParam().has("house_name")?data.getParam().getString("house_name"):null;
        if(house_name!=null && (! house_name.isEmpty())){
            sql=sql+" and house_name like '%"+house_name+"%'";
        }
        String room_name=data.getParam().has("room_name")?data.getParam().getString("room_name"):null;
        if(room_name!=null && (! room_name.isEmpty())){
            sql=sql+" and room_name like '%"+room_name+"%'";
        }
        sql=sql+" order by price";
        return sql;
    }
    private String createGetRecordSqlUpSeller(Data data) throws JSONException {
        JSONObject param=data.getParam();
        String username=data.getParam().has("username")?data.getParam().getString("username"):null;
        String sql="select * from specialty_order, specialty where specialty_order.good_id=specialty.specialty_id and owner_id='"+username+"'";
        String order_id=data.getParam().has("order_id")?data.getParam().getString("order_id"):null;
        if(order_id!=null && (! order_id.isEmpty())){
            sql=sql+" and order_id like '%"+order_id+"%'";
        }
        String specialty_name=data.getParam().has("specialty_name")?data.getParam().getString("specialty_name"):null;
        if(specialty_name!=null && (! specialty_name.isEmpty())){
            sql=sql+" and specialty_name like '%"+specialty_name+"%'";
        }
        sql=sql+" order by specialty.price";
        return sql;
    }
    private String createGetRecordSqlDown(Data data) throws JSONException {
        JSONObject param=data.getParam();
        String username=data.getParam().has("username")?data.getParam().getString("username"):null;

        String sql="select * from deal_order,house,room,room_occupy where deal_order.good_id=room_occupy.op_id and room.house_id=room_occupy.house_id and room.room_id=room_occupy.room_id and house.house_id=room.house_id and buyer_id='"+username+"' ";
        String good_id=data.getParam().has("good_id")?data.getParam().getString("good_id"):null;
        if(good_id!=null && (! good_id.isEmpty())){
            sql=sql+" and good_id like '%"+good_id+"%'";
        }
        String house_name=data.getParam().has("house_name")?data.getParam().getString("house_name"):null;
        if(house_name!=null && (! house_name.isEmpty())){
            sql=sql+" and house_name like '%"+house_name+"%'";
        }
        String room_name=data.getParam().has("room_name")?data.getParam().getString("room_name"):null;
        if(room_name!=null && (! room_name.isEmpty())){
            sql=sql+" and room_name like '%"+room_name+"%'";
        }
        sql=sql+" order by price DESC";
        return sql;
    }
    private String createGetRecordSqlDownSeller(Data data) throws JSONException {
        JSONObject param=data.getParam();
        String username=data.getParam().has("username")?data.getParam().getString("username"):null;
        String sql="select * from specialty_order, specialty where specialty_order.good_id=specialty.specialty_id and owner_id='"+username+"'";
        String order_id=data.getParam().has("order_id")?data.getParam().getString("order_id"):null;
        if(order_id!=null && (! order_id.isEmpty())){
            sql=sql+" and order_id like '%"+order_id+"%'";
        }
        String specialty_name=data.getParam().has("specialty_name")?data.getParam().getString("specialty_name"):null;
        if(specialty_name!=null && (! specialty_name.isEmpty())){
            sql=sql+" and specialty_name like '%"+specialty_name+"%'";
        }
        sql=sql+" order by specialty.price DESC";
        return sql;
    }
    public void saveUploadFileRecord(JSONObject json, Data data) throws JSONException, SQLException {
        //构造sql语句，根据传递过来的查询条件参数
        //首先分析json里有多少文件，多个文件需要用循环构造多个sql语句
        showDebug("[saveUploadFileRecord]保存文件后，文件和字段信息json是："+json.toString());
        /*--------------------循环 开始--------------------*/
        //for(int i=0;i<nCount;i++){
        //String sql=createSaveUploadFileRecordSql(data);			//构造sql语句，根据传递过来的查询条件参数
        //data.getParam().put("sql",sql);
        //updateRecord(data,json);
        //}
        /*--------------------循环 结束--------------------*/
    }

    public void getOrderCountByHour(Data data, JSONObject json) throws JSONException {
        /*--------------------获取变量 开始--------------------*/
        String username=data.getParam().has("username")?data.getParam().getString("username"):null;
        String resultMsg = "ok";
        int resultCode = 0;
        List jsonList = new ArrayList();
        Calendar cal=Calendar.getInstance();
        cal.add(Calendar.DATE,-100);   //yyyy-MM-dd
        String timeFrom=(new SimpleDateFormat("yyyy-MM-dd 00:00:00")).format(cal.getTime());
        cal.add(Calendar.DATE,100);   //yyyy-MM-dd
        String timeTo=(new SimpleDateFormat("yyyy-MM-dd 23:59:59")).format(cal.getTime());
        int totalGpsActiveCount=0;
        /*--------------------获取变量 完毕--------------------*/
        /*--------------------数据操作 开始--------------------*/
        DB queryDb = new DB("group1");
        String sql="SELECT DATE_FORMAT(create_date,\"%Y-%m-%d %H\") as time_interval,count(*) as total from deal_order";
        sql=sql+" where buyer_id='"+username+"' and create_date between '"+timeFrom+"' and '"+timeTo+"'";
        sql=sql+" group by DATE_FORMAT(create_date,\"%Y-%m-%d %H\")";
        showDebug("[getOrderStatistic]构造的SQL语句是：" + sql);
        try {
            ResultSet rs = queryDb.executeQuery(sql);
            ResultSetMetaData rsmd = rs.getMetaData();
            int fieldCount = rsmd.getColumnCount();
            while (rs.next()) {
                HashMap map=new HashMap();
                map.put("time_interval",rs.getString("time_interval"));
                map.put("total",rs.getInt("total"));
                jsonList.add(map);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
            showDebug("[getOrderStatistic]查询数据库出现错误：" + sql);
            resultCode = 10;
            resultMsg = "查询数据库出现错误！" + e.getMessage();
        }
        queryDb.close();
        /*--------------------数据操作 结束--------------------*/
        /*--------------------返回数据 开始--------------------*/
        json.put("aaData",jsonList);
        json.put("result_msg",resultMsg);															//如果发生错误就设置成"error"等
        json.put("result_code",resultCode);														//返回0表示正常，不等于0就表示有错误产生，错误代码
        /*--------------------返回数据 结束--------------------*/
    }
    public void getOrderCountByHourSeller(Data data, JSONObject json) throws JSONException {
        /*--------------------获取变量 开始--------------------*/
        String username=data.getParam().has("username")?data.getParam().getString("username"):null;
        String resultMsg = "ok";
        int resultCode = 0;
        List jsonList = new ArrayList();
        Calendar cal=Calendar.getInstance();
        cal.add(Calendar.DATE,-5);   //yyyy-MM-dd
        String timeFrom=(new SimpleDateFormat("yyyy-MM-dd 00:00:00")).format(cal.getTime());
        cal.add(Calendar.DATE,5);   //yyyy-MM-dd
        String timeTo=(new SimpleDateFormat("yyyy-MM-dd 23:59:59")).format(cal.getTime());
        int totalGpsActiveCount=0;
        /*--------------------获取变量 完毕--------------------*/
        /*--------------------数据操作 开始--------------------*/
        DB queryDb = new DB("group1");
        String sql="SELECT DATE_FORMAT(create_date,\"%Y-%m-%d %H\") as time_interval,count(*) as total from specialty_order,specialty ";
        sql=sql+" where specialty_order.good_id=specialty.specialty_id and owner_id='"+username+"' and create_date between '"+timeFrom+"' and '"+timeTo+"'";
        sql=sql+" group by DATE_FORMAT(create_date,\"%Y-%m-%d %H\")";
        showDebug("[getOrderStatistic]构造的SQL语句是：" + sql);
        try {
            ResultSet rs = queryDb.executeQuery(sql);
            ResultSetMetaData rsmd = rs.getMetaData();
            int fieldCount = rsmd.getColumnCount();
            while (rs.next()) {
                HashMap map=new HashMap();
                map.put("time_interval",rs.getString("time_interval"));
                map.put("total",rs.getInt("total"));
                jsonList.add(map);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
            showDebug("[getOrderStatistic]查询数据库出现错误：" + sql);
            resultCode = 10;
            resultMsg = "查询数据库出现错误！" + e.getMessage();
        }
        queryDb.close();
        /*--------------------数据操作 结束--------------------*/
        /*--------------------返回数据 开始--------------------*/
        json.put("aaData",jsonList);
        json.put("result_msg",resultMsg);															//如果发生错误就设置成"error"等
        json.put("result_code",resultCode);														//返回0表示正常，不等于0就表示有错误产生，错误代码
        /*--------------------返回数据 结束--------------------*/
    }
}


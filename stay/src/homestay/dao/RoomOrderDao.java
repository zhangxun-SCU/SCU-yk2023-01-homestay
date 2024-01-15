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
        String id=data.getParam().has("order_id")?data.getParam().getString("order_id"):null;
        if(id!=null){
            String sql="delete from specialty_order where order_id="+data.getParam().getString("order_id");
            data.getParam().put("sql",sql);
            updateRecord(data,json);
        }
    }
    /*修改记录*/
    public void modifyDeviceRecord(Data data, JSONObject json) throws JSONException, SQLException{
        //构造sql语句，根据传递过来的条件参数
        String id=data.getParam().has("id")?data.getParam().getString("id"):null;
        String deviceId=data.getParam().has("device_id")?data.getParam().getString("device_id"):null;
        String deviceName=data.getParam().has("device_name")?data.getParam().getString("device_name"):null;
        if(id!=null){
            String sql="update device_file";
            sql=sql+" set device_id='"+deviceId+"'";
            sql=sql+" ,device_name='"+deviceName+"'";
            sql=sql+" where id="+id;
            data.getParam().put("sql",sql);
            updateRecord(data,json);
        }
    }
    /*查询记录*/
    public void getDeviceRecord(Data data, JSONObject json) throws JSONException, SQLException{
        //构造sql语句，根据传递过来的查询条件参数
        String sql=createGetRecordSql(data);			//构造sql语句，根据传递过来的查询条件参数
        data.getParam().put("sql",sql);
        queryRecord(data,json);
    }
    public void getDeviceRecordFinished(Data data, JSONObject json) throws JSONException, SQLException{
        //构造sql语句，根据传递过来的查询条件参数
        String sql=createGetRecordSqlFinished(data);			//构造sql语句，根据传递过来的查询条件参数
        data.getParam().put("sql",sql);
        queryRecord(data,json);
    }
    public void getDeviceRecordUnfinished(Data data, JSONObject json) throws JSONException, SQLException{
        //构造sql语句，根据传递过来的查询条件参数
        String sql=createGetRecordSqlUnfinished(data);			//构造sql语句，根据传递过来的查询条件参数
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
        String sql="select * from specialty_order, specialty where (specialty_order.good_id=specialty.specialty_id)";
        String order_id=data.getParam().has("order_id")?data.getParam().getString("order_id"):null;
        if(order_id!=null && (! order_id.isEmpty())){
            sql=sql+" and order_id="+order_id;
        }
        String specialty_name=data.getParam().has("specialty_name")?data.getParam().getString("specialty_name"):null;
        if(specialty_name!=null && (! specialty_name.isEmpty())){
            sql=sql+" and specialty_name like '%"+specialty_name+"%'";
        }
//		String where="";
//		if(checkParamValid(param,"id")){
//			where="id="+param.getString("id");
//		}
//		if(checkParamValid(param,"id")){
//			where="id="+param.getString("id");
//		}
//		if(checkParamValid(param,"time_from") && checkParamValid(param,"time_to")){
//			if(!where.isEmpty()){
//				where=where+" and create_time between '"+param.getString("time_from")+"' and '"+param.getString("time_to")+"'";
//			}else{
//				where="create_time between '"+param.getString("time_from")+"' and '"+param.getString("time_to")+"'";
//			}
//		}
//		if(checkParamValid(param,"device_id")){
//			if(!where.isEmpty()){
//				where=where+" and device_id = '"+param.getString("device_id")+"'";
//			}else{
//				where="device_id ='"+param.getString("device_id")+"'";
//			}
//		}
//		if(checkParamValid(param,"device_type")){
//			if(!where.isEmpty()){
//				where=where+" and device_type = '"+param.getString("device_type")+"'";
//			}else{
//				where="device_type ='"+param.getString("device_type")+"'";
//			}
//		}
//		if(checkParamValid(param,"device_name")){
//			if(!where.isEmpty()){
//				where=where+" and device_name like '%"+param.getString("device_name")+"%'";
//			}else{
//				where="device_name like '%"+param.getString("device_name")+"%'";
//			}
//		}
//		if(!where.isEmpty()){
//			sql=sql+" where "+where;
//		}
//		if(checkParamValid(param,"order_by")){
//			sql=sql+" order by "+param.getString("order_by");
//		}
        return sql;
    }

    private String createGetRecordSqlFinished(Data data) throws JSONException {
        JSONObject param=data.getParam();
        String sql="select * from specialty_order, specialty where (specialty_order.good_id=specialty.specialty_id and order_status != 0) ";
        String order_id=data.getParam().has("order_id")?data.getParam().getString("order_id"):null;
        if(order_id!=null && (! order_id.isEmpty())){
            sql=sql+" and order_id="+order_id;
        }
        String specialty_name=data.getParam().has("specialty_name")?data.getParam().getString("specialty_name"):null;
        if(specialty_name!=null && (! specialty_name.isEmpty())){
            sql=sql+" and specialty_name like '%"+specialty_name+"%'";
        }
//		String where="";
//		if(checkParamValid(param,"id")){
//			where="id="+param.getString("id");
//		}
//		if(checkParamValid(param,"id")){
//			where="id="+param.getString("id");
//		}
//		if(checkParamValid(param,"time_from") && checkParamValid(param,"time_to")){
//			if(!where.isEmpty()){
//				where=where+" and create_time between '"+param.getString("time_from")+"' and '"+param.getString("time_to")+"'";
//			}else{
//				where="create_time between '"+param.getString("time_from")+"' and '"+param.getString("time_to")+"'";
//			}
//		}
//		if(checkParamValid(param,"device_id")){
//			if(!where.isEmpty()){
//				where=where+" and device_id = '"+param.getString("device_id")+"'";
//			}else{
//				where="device_id ='"+param.getString("device_id")+"'";
//			}
//		}
//		if(checkParamValid(param,"device_type")){
//			if(!where.isEmpty()){
//				where=where+" and device_type = '"+param.getString("device_type")+"'";
//			}else{
//				where="device_type ='"+param.getString("device_type")+"'";
//			}
//		}
//		if(checkParamValid(param,"device_name")){
//			if(!where.isEmpty()){
//				where=where+" and device_name like '%"+param.getString("device_name")+"%'";
//			}else{
//				where="device_name like '%"+param.getString("device_name")+"%'";
//			}
//		}
//		if(!where.isEmpty()){
//			sql=sql+" where "+where;
//		}
//		if(checkParamValid(param,"order_by")){
//			sql=sql+" order by "+param.getString("order_by");
//		}
        return sql;
    }
    private String createGetRecordSqlUnfinished(Data data) throws JSONException {
        JSONObject param=data.getParam();
        String sql="select * from specialty_order, specialty where (specialty_order.good_id=specialty.specialty_id and order_status = 0) ";
        String order_id=data.getParam().has("order_id")?data.getParam().getString("order_id"):null;
        if(order_id!=null && (! order_id.isEmpty())){
            sql=sql+" and order_id="+order_id;
        }
        String specialty_name=data.getParam().has("specialty_name")?data.getParam().getString("specialty_name"):null;
        if(specialty_name!=null && (! specialty_name.isEmpty())){
            sql=sql+" and specialty_name like '%"+specialty_name+"%'";
        }
//		String where="";
//		if(checkParamValid(param,"id")){
//			where="id="+param.getString("id");
//		}
//		if(checkParamValid(param,"id")){
//			where="id="+param.getString("id");
//		}
//		if(checkParamValid(param,"time_from") && checkParamValid(param,"time_to")){
//			if(!where.isEmpty()){
//				where=where+" and create_time between '"+param.getString("time_from")+"' and '"+param.getString("time_to")+"'";
//			}else{
//				where="create_time between '"+param.getString("time_from")+"' and '"+param.getString("time_to")+"'";
//			}
//		}
//		if(checkParamValid(param,"device_id")){
//			if(!where.isEmpty()){
//				where=where+" and device_id = '"+param.getString("device_id")+"'";
//			}else{
//				where="device_id ='"+param.getString("device_id")+"'";
//			}
//		}
//		if(checkParamValid(param,"device_type")){
//			if(!where.isEmpty()){
//				where=where+" and device_type = '"+param.getString("device_type")+"'";
//			}else{
//				where="device_type ='"+param.getString("device_type")+"'";
//			}
//		}
//		if(checkParamValid(param,"device_name")){
//			if(!where.isEmpty()){
//				where=where+" and device_name like '%"+param.getString("device_name")+"%'";
//			}else{
//				where="device_name like '%"+param.getString("device_name")+"%'";
//			}
//		}
//		if(!where.isEmpty()){
//			sql=sql+" where "+where;
//		}
//		if(checkParamValid(param,"order_by")){
//			sql=sql+" order by "+param.getString("order_by");
//		}
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

    public void getGpsReceiveCountByHour(Data data, JSONObject json) throws JSONException {
        /*--------------------获取变量 开始--------------------*/
        String resultMsg = "ok";
        int resultCode = 0;
        List jsonList = new ArrayList();
        Calendar cal=Calendar.getInstance();
        cal.add(Calendar.DATE,-1);   //yyyy-MM-dd
        String timeFrom=(new SimpleDateFormat("yyyy-MM-dd 00:00:00")).format(cal.getTime());
        String timeTo=(new SimpleDateFormat("yyyy-MM-dd 23:59:59")).format(cal.getTime());
        int totalGpsActiveCount=0;
        /*--------------------获取变量 完毕--------------------*/
        /*--------------------数据操作 开始--------------------*/
//		DbRemote queryDb = new DbRemote("yjykfsj2023");
//		String sql="SELECT DATE_FORMAT(GPSTime,\"%Y-%m-%d %H\") as time_interval,count(*) as total from gps_history_202310";
//		sql=sql+" where GPSTime between '"+timeFrom+"' and '"+timeTo+"'";
//		sql=sql+" group by DATE_FORMAT(GPSTime,\"%Y-%m-%d %H\")";
//		showDebug("[getGpsStatistic]构造的SQL语句是：" + sql);
//		try {
//			ResultSet rs = queryDb.executeQuery(sql);
//			ResultSetMetaData rsmd = rs.getMetaData();
//			int fieldCount = rsmd.getColumnCount();
//			while (rs.next()) {
//				HashMap map=new HashMap();
//				map.put("time_interval",rs.getString("time_interval"));
//				map.put("total",rs.getInt("total"));
//				jsonList.add(map);
//			}
//			rs.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//			showDebug("[getGpsStatistic]查询数据库出现错误：" + sql);
//			resultCode = 10;
//			resultMsg = "查询数据库出现错误！" + e.getMessage();
//		}
//		queryDb.close();
        /*--------------------数据操作 结束--------------------*/
        /*--------------------返回数据 开始--------------------*/
        json.put("aaData",jsonList);
        json.put("result_msg",resultMsg);															//如果发生错误就设置成"error"等
        json.put("result_code",resultCode);														//返回0表示正常，不等于0就表示有错误产生，错误代码
        /*--------------------返回数据 结束--------------------*/
    }
}

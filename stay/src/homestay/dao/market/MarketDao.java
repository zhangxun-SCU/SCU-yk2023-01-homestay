package homestay.dao.market;

import homestay.dao.DB;
import homestay.dao.Data;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class MarketDao {
    public JSONArray queryAllSpecialty() throws SQLException, JSONException {
        String sql = "SELECT * FROM specialty";
        System.out.println("querySpecialty sql: " + sql);
        DB db = new DB("group1");
        JSONArray  specialtyList=new JSONArray();
        ResultSet rs = db.executeQuery(sql);
        while (rs.next()) {
            JSONObject tpSpecialty=new JSONObject();
            tpSpecialty.put("good_id",rs.getString("specialty_id"));
            tpSpecialty.put("good_price",rs.getString("price"));
            tpSpecialty.put("main_image",rs.getString("imageurl"));
            tpSpecialty.put("good_name",rs.getString("specialty_name"));
            specialtyList.put(tpSpecialty);
        }
        rs.close();
        db.close();
        return specialtyList;
    }
    public JSONArray queryAllHouse() throws SQLException, JSONException {
        String sql = "SELECT house.house_id,house_name,house.imageurl, min(room_price) FROM house,room where house.house_id=room.house_id group by house_id";
        System.out.println("querySpecialty sql: " + sql);
        DB db = new DB("group1");
        JSONArray  specialtyList=new JSONArray();
        ResultSet rs = db.executeQuery(sql);
        while (rs.next()) {
            JSONObject tpSpecialty=new JSONObject();
            tpSpecialty.put("good_id",rs.getString("house.house_id"));
            tpSpecialty.put("main_image",rs.getString("house.imageurl"));
            tpSpecialty.put("good_name",rs.getString("house_name"));
            tpSpecialty.put("good_price",rs.getString("min(room_price)"));
            specialtyList.put(tpSpecialty);
        }
        rs.close();
        db.close();
        return specialtyList;
    }
    public JSONObject querySpecialtyById(String goodId) throws SQLException, JSONException {
        String sql="SELECT * from specialty where specialty_id='"+goodId+"'";
        System.out.println("querySpecialty sql: " + sql);
        JSONObject specialty=new JSONObject();
        DB db = new DB("group1");
        ResultSet res=db.executeQuery(sql);
        while(res.next()){
            specialty.put("good_id",res.getString("specialty_id"));
            specialty.put("good_price",res.getString("price"));
            specialty.put("main_image",res.getString("imageurl"));
            specialty.put("good_name",res.getString("specialty_name"));
            specialty.put("num",res.getString("num"));
        }
        res.close();
        db.close();
        return  specialty;
    }
    public JSONObject queryHouseById(String goodId) throws SQLException, JSONException {
        String sql="SELECT * from house where house_id='"+goodId+"'";
        System.out.println("queryHouse sql: " + sql);
        JSONObject specialty=new JSONObject();
        DB db = new DB("group1");
        ResultSet res=db.executeQuery(sql);
        while(res.next()){
            specialty.put("good_id",res.getString("house_id"));
            specialty.put("latitude",res.getString("latitude"));
            specialty.put("longitude",res.getString("longitude"));
            specialty.put("location",res.getString("location"));
            specialty.put("main_image",res.getString("imageurl"));
            specialty.put("good_name",res.getString("house_name"));

        }
        res.close();

        db.close();

        return  specialty;
    }
    public JSONArray querySpecialtyByName(String search_name) throws SQLException, JSONException {
        String sql = "SELECT * FROM specialty where specialty_name Like '%"+search_name+"%'";
        System.out.println("querySpecialty sql: " + sql);
        DB db = new DB("group1");
        JSONArray  specialtyList=new JSONArray();
        ResultSet rs = db.executeQuery(sql);
        while (rs.next()) {
            JSONObject tpSpecialty=new JSONObject();
            tpSpecialty.put("good_id",rs.getString("specialty_id"));
            tpSpecialty.put("good_price",rs.getString("price"));
            tpSpecialty.put("main_image",rs.getString("imageurl"));
            tpSpecialty.put("good_name",rs.getString("specialty_name"));
            specialtyList.put(tpSpecialty);
        }
        rs.close();
        db.close();
        return specialtyList;
    }

    public JSONArray querySpecialtyByList(Data data) throws JSONException, SQLException {
        String goodlist=data.getParam().getString("good_list");
        System.out.println(goodlist);
        JSONArray infolist=new JSONArray(goodlist);
        DB db = new DB("group1");
        JSONArray  specialtyList=new JSONArray();
        for(int i=0;i<infolist.length();i++)
        {
            JSONObject obj=(JSONObject) infolist.get(i);
            String good_id=obj.getString("good_id");
            String sql="SELECT * from specialty where specialty_id='"+good_id+"'";
            ResultSet rs = db.executeQuery(sql);
            JSONObject tpSpecialty=new JSONObject();
            while (rs.next()) {
                tpSpecialty.put("good_id",rs.getString("specialty_id"));
                tpSpecialty.put("good_price",rs.getString("price"));
                tpSpecialty.put("main_image",rs.getString("imageurl"));
                tpSpecialty.put("good_name",rs.getString("specialty_name"));
            }
            specialtyList.put(tpSpecialty);
        }

        return specialtyList;

    };
    public JSONArray queryHouseByList(Data data) throws JSONException, SQLException, ParseException {
        String goodlist=data.getParam().getString("good_list");
        System.out.println(goodlist);
        JSONArray infolist=new JSONArray(goodlist);
        DB db = new DB("group1");
        JSONArray  specialtyList=new JSONArray();
        for(int i=0;i<infolist.length();i++)
        {
            JSONObject obj=(JSONObject) infolist.get(i);
            String house_id=obj.getString("house_id");
            String room_id=obj.getString("room_id");
            String in_date=obj.getString("in_date");
            String out_date=obj.getString("out_date");
            String sql="SELECT * from room where house_id='"+house_id+"' and room_id ='"+room_id+"'";
            ResultSet rs = db.executeQuery(sql);
            JSONObject tpSpecialty=new JSONObject();
            while (rs.next()) {
                tpSpecialty.put("good_price",rs.getString("room_price"));
                tpSpecialty.put("main_image",rs.getString("imageurl"));
                tpSpecialty.put("good_name",rs.getString("room_name"));
                DateFormat dft = new SimpleDateFormat("yyyy-MM-dd");
                try {

                        java.util.Date star = dft.parse(in_date);//开始时间
                        java.util.Date endDay=dft.parse(out_date);//结束时间
                        java.util.Date nextDay=star;

                    int j=0;
                    while(nextDay.before(endDay)){//当明天不在结束时间之前是终止循环
                        Calendar cld = Calendar.getInstance();
                        cld.setTime(star);
                        cld.add(Calendar.DATE, 1);
                        star = cld.getTime();
                        //获得下一天日期字符串
                        nextDay = star;
                        j++;
                    }
                    System.out.println("相差天数为："+j);
                    tpSpecialty.put("range_day",j);
                } catch (ParseException e) {
                    e.printStackTrace();
                }


            }
            specialtyList.put(tpSpecialty);
        }

        return specialtyList;

    }


    public JSONArray queryHouseByName(String search_name) throws SQLException, JSONException {
        String sql = "SELECT house.house_id,house_name,house.imageurl, min(room_price) FROM house,room where house_name like '%"+search_name+"%' and house.house_id=room.house_id group by house_id";
        System.out.println("queryHouse sql: " + sql);
        DB db = new DB("group1");
        JSONArray  specialtyList=new JSONArray();
        ResultSet rs = db.executeQuery(sql);
        while (rs.next()) {
            JSONObject tpSpecialty=new JSONObject();
            tpSpecialty.put("good_id",rs.getString("house.house_id"));
            tpSpecialty.put("main_image",rs.getString("house.imageurl"));
            tpSpecialty.put("good_name",rs.getString("house_name"));
            tpSpecialty.put("good_price",rs.getString("min(room_price)"));
            specialtyList.put(tpSpecialty);
        }
        rs.close();
        db.close();
        return specialtyList;
    }
}

package homestay.dao.market;

import homestay.dao.DB;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class MarketOrderDao {
    public String addPayOrder(String good_id, int num, String buyer_id) throws SQLException {
        Date time=new Date();
        DB db=new DB("group1");
        ResultSet rs=db.executeQuery("select price from specialty where specialty_id='"+good_id+"'");
        String price="";
        while(rs.next())
        {
            price=rs.getString("price");
        }
        String order_id="SO" + Long.toString(time.getTime());
        String create_time=(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(time);

        String sql="insert into specialty_order(order_id,num,buyer_id,good_id,order_status,create_date,price) values('"+order_id+"','"+num+"','"+buyer_id+"','"+good_id+"',0,'";
        sql=sql+create_time+"','"+price+"')";
        db.executeUpdate(sql);
        sql="update specialty set num=num-"+num+" where specialty_id='"+good_id+"'";
        db.executeUpdate(sql);
        return order_id;
    }

    public JSONArray queryPayOrderByList(ArrayList<String> order_list) throws SQLException, JSONException {

        DB db = new DB("group1");
        JSONArray  specialtyList=new JSONArray();
        for(int i=0;i<order_list.size();i++)
        {
            String order_id=order_list.get(i);System.out.println(order_id);
            String sql="SELECT * from specialty_order,specialty where specialty_id=good_id and order_id='"+order_id+"'";
            ResultSet rs = db.executeQuery(sql);
            JSONObject tpSpecialty=new JSONObject();
            while (rs.next()) {
                tpSpecialty.put("good_id",rs.getString("specialty_id"));
                tpSpecialty.put("good_price",rs.getString("specialty.price"));
                tpSpecialty.put("main_image",rs.getString("imageurl"));
                tpSpecialty.put("good_name",rs.getString("specialty_name"));
                tpSpecialty.put("order_id",rs.getString("order_id"));
            }
            specialtyList.put(tpSpecialty);
        }
        return specialtyList;
    }

    public String addPayRoomOrder(JSONObject data, String buyer_id) throws JSONException, SQLException {
        Date time=new Date();


        String house_id=data.getString("house_id");
        String room_id=data.getString("room_id");
        String in_date=data.getString("in_date");
        String out_date=data.getString("out_date");
        int num=data.getInt("need_num");
        DB db=new DB("group1");


        String op_id="OP" + Long.toString(time.getTime());
        db.executeUpdate("insert into room_occupy(op_id,house_id,room_id,num,in_date,out_date) values('"+op_id+"','"+house_id+"','"+room_id+"',"+num+",'"+in_date+"','"+out_date+"')");



        ResultSet rs=db.executeQuery("select room_price from room where house_id='"+house_id+"' and room_id='"+room_id+"'");
        String price="";
        while(rs.next())
        {
            price=rs.getString("room_price");
        }
        String order_id="RO" + Long.toString(time.getTime());
        String create_time=(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(time);
        String sql="insert into deal_order(order_id,num,buyer_id,good_id,order_status,create_date,price) values('"+order_id+"','"+num+"','"+buyer_id+"','"+op_id+"',0,'";
        sql=sql+create_time+"','"+price+"')";
        db.executeUpdate(sql);
        return order_id;
    }
    public JSONArray queryPayRoomOrderByList(ArrayList<String> order_list) throws SQLException, JSONException, ParseException {

        DB db = new DB("group1");
        JSONArray specialtyList = new JSONArray();
        String in_date = "";
        String out_date = "";
        for (int i = 0; i < order_list.size(); i++) {
            String order_id = order_list.get(i);
            System.out.println(order_id);
            String good_id = "";
            String sql = "SELECT * from deal_order where order_id='" + order_id + "'";
            ResultSet rs = db.executeQuery(sql);
            JSONObject tpSpecialty = new JSONObject();
            while (rs.next()) {
                good_id = rs.getString("good_id");
                tpSpecialty.put("good_id", rs.getString("good_id"));
                tpSpecialty.put("good_price", rs.getString("price"));
                tpSpecialty.put("num", rs.getString("num"));
                tpSpecialty.put("order_id", rs.getString("order_id"));
            }
            sql = "select * from room_occupy,room where room_occupy.house_id= room.house_id and room_occupy.room_id = room.room_id and op_id='" + good_id + "'";
            rs = db.executeQuery(sql);
            while (rs.next()) {
                tpSpecialty.put("house_id", rs.getString("house_id"));
                tpSpecialty.put("room_id", rs.getString("room_id"));
                in_date = rs.getString("in_date");
                out_date = rs.getString("out_date");
                tpSpecialty.put("in_date", rs.getString("in_date"));
                tpSpecialty.put("out_date", rs.getString("out_date"));
                tpSpecialty.put("main_image", rs.getString("imageurl"));
                tpSpecialty.put("good_name", rs.getString("room_name"));

            }
            DateFormat dft = new SimpleDateFormat("yyyy-MM-dd");
            try {

                Date star = dft.parse(in_date);//开始时间
                Date endDay = dft.parse(out_date);//结束时间
                Date nextDay = star;

                int j = 0;
                while (nextDay.before(endDay)) {//当明天不在结束时间之前是终止循环
                    Calendar cld = Calendar.getInstance();
                    cld.setTime(star);
                    cld.add(Calendar.DATE, 1);
                    star = cld.getTime();
                    //获得下一天日期字符串
                    nextDay = star;
                    j++;
                }
                tpSpecialty.put("range_day", j);
                specialtyList.put(tpSpecialty);
            } catch (ParseException e) {
                e.printStackTrace();
            }

        }
        return specialtyList;
    }
}

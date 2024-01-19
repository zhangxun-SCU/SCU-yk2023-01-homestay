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

    public double getBalanceByUserId(String buyer_id) throws SQLException {
        double balance=0;
        String sql="select balance from user_balance where user_id='"+buyer_id+"'";
        DB db=new DB("group1");
        ResultSet res=db.executeQuery(sql);
        while(res.next())
        {
            balance=res.getDouble("balance");
        }
        return balance;


    }

    public void paySpecialyOrder(double balance, JSONArray jsonArray,JSONObject json,String user_id) throws JSONException, SQLException {
        double total_cost=0;
        double[] cost_list=new double[jsonArray.length()];
        ArrayList<String> user_list=new ArrayList<String>();
        ArrayList<String> order_list=new ArrayList<String>();
        for(int i=0;i<jsonArray.length();i++)
        {
            order_list.add(jsonArray.getJSONObject(i).getString("order_id"));
        }
        DB db=new DB("group1");
        // judge whether the balance is bigger than the total cost and store the seller_user and cost
        for(int i=0;i<order_list.size();i++)
        {
            int num = 0;
            double price = 0;
            String sql="select specialty_order.num,specialty_order.price,owner_id from specialty_order,specialty where good_id=specialty_id and order_id='"+order_list.get(i)+"'";
            System.out.println("执行的语句是:"+sql);
            ResultSet res=db.executeQuery(sql);
            while(res.next())
            {
                num=res.getInt("specialty_order.num");
                price=res.getDouble("specialty_order.price");
                user_list.add(res.getString("owner_id"));
            }
            total_cost+=num*price;
            cost_list[i]=num*price;
            if(total_cost>balance)
            {
                json.put("code",1);
                return;
            }
        }
        //update the status of order

        for(int i=0;i<order_list.size();i++)
        {
            String sql="update  specialty_order set order_status=1 where order_id='"+order_list.get(i)+"'";
            System.out.println("执行的语句是:"+sql);
            db.executeUpdate(sql);

        }
        //update the balance of seller
        for(int i=0;i<order_list.size();i++)
        {
            String sql="update user_balance set balance=balance+"+cost_list[i]+" where user_id='"+user_list.get(i)+"'";
            System.out.println("执行的语句是:"+sql);
            db.executeUpdate(sql);
        }
        //update the balance of buyer
        double rest_balance=balance-total_cost;
        String sql="update user_balance set balance=balance-"+total_cost+" where user_id='"+user_id+"'";
        db.executeUpdate(sql);
        json.put("code",0);



    }

    public void payHouseOrder(double balance, JSONArray jsonArray, JSONObject json, String buyer_id) throws JSONException, SQLException, ParseException {
        double total_cost=0;
        double[] cost_list=new double[jsonArray.length()];
        int[] range_list=new int[jsonArray.length()];
        ArrayList<String> user_list=new ArrayList<String>();
        ArrayList<String> order_list=new ArrayList<String>();
        for(int i=0;i<jsonArray.length();i++)
        {
            order_list.add(jsonArray.getJSONObject(i).getString("order_id"));
        }
        DB db=new DB("group1");
        // judge whether the balance is bigger than the total cost and store the seller_user and cost
        for(int i=0;i<order_list.size();i++)
        {
            int num = 0;
            double price = 0;
            String in_date="";
            String out_date="";
            int range_day=0;
            String sql="select deal_order.num,deal_order.price,owner_id,in_date,out_date from deal_order,room_occupy,house where house.house_id=room_occupy.house_id and good_id=op_id and order_id='"+order_list.get(i)+"'";
            System.out.println("执行的语句是:"+sql);
            ResultSet res=db.executeQuery(sql);
            while(res.next())
            {
                num=res.getInt("deal_order.num");
                price=res.getDouble("deal_order.price");
                user_list.add(res.getString("owner_id"));
                in_date=res.getString("in_date");
                out_date=res.getString("out_date");
            }
            DateFormat dft = new SimpleDateFormat("yyyy-MM-dd");
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
            range_day=j;
            range_list[i]=range_day;

            total_cost+=num*price*range_day;
            cost_list[i]=num*price*range_day;
            if(total_cost>balance)
            {
                json.put("code",1);
                return;
            }
        }
        //update the status of order

        for(int i=0;i<order_list.size();i++)
        {
            String sql="update  deal_order set order_status=1 where order_id='"+order_list.get(i)+"'";
            System.out.println("执行的语句是:"+sql);
            db.executeUpdate(sql);

        }
        //update the balance of seller
        for(int i=0;i<order_list.size();i++)
        {
            String sql="update user_balance set balance=balance+"+cost_list[i]+" where user_id='"+user_list.get(i)+"'";
            System.out.println("执行的语句是:"+sql);
            db.executeUpdate(sql);
        }
        //update the balance of buyer
        double rest_balance=balance-total_cost;
        String sql="update user_balance set balance=balance-"+total_cost+" where user_id='"+buyer_id+"'";
        db.executeUpdate(sql);
        json.put("code",0);

    }
}

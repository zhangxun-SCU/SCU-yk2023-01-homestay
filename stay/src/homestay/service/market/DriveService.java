package homestay.service.market;

import homestay.dao.DB;
import homestay.dao.Data;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.ResultSet;
import java.sql.SQLException;

public class DriveService {

    public void getSunData(Data data, JSONObject json) throws SQLException, JSONException {

        int num_room_order=0;
        int num_specialty_order=0;
        int num_house=0;
        int num_room=0;
        int num_specialty=0;
        int num_user=0;
        int num_normal_user=0;
        int num_admin_user=0;
        int num_super_user=0;
        double cost_all=0;
        double cost_house=0;
        double cost_specialty=0;
        DB db =new DB("group1");
        ResultSet rs=db.executeQuery("select count(*) from deal_order");
        while (rs.next())
        {
            num_room_order=rs.getInt(1) ;
        }
        rs=db.executeQuery("select count(*) from specialty_order");
        while (rs.next())
        {
            num_specialty_order=rs.getInt(1) ;
        }
        rs=db.executeQuery("select count(*) from specialty");
        while (rs.next())
        {
            num_specialty=rs.getInt(1) ;
        }
        rs=db.executeQuery("select count(*) from house");
        while (rs.next())
        {
            num_house=rs.getInt(1) ;
        }
        rs=db.executeQuery("select count(*) from room");
        while (rs.next())
        {
            num_room=rs.getInt(1) ;
        }
        rs=db.executeQuery("select count(*) from user_account");
        while (rs.next())
        {
            num_user=rs.getInt(1) ;
        }
        rs=db.executeQuery("select count(*) from user_account where permission='low'");
        while (rs.next())
        {
            num_normal_user=rs.getInt(1) ;
        }
        rs=db.executeQuery("select count(*) from user_account where permission='middle'");
        while (rs.next())
        {
            num_admin_user=rs.getInt(1) ;
        }
        rs=db.executeQuery("select count(*) from user_account where permission='superhigh'");
        while (rs.next())
        {
            num_super_user=rs.getInt(1) ;
        }
        rs=db.executeQuery("select sum(num*price) from deal_order");
        while(rs.next())
        {
            cost_house=rs.getInt(1);
        }
        rs=db.executeQuery("select sum(num*price) from specialty_order");
        while(rs.next())
        {
            cost_specialty=rs.getInt(1);
        }
        int so_m1=0;
        int ho_m1=0;
        rs=db.executeQuery("select count(*)  from specialty_order where month(create_date)='1'");
        while(rs.next())
        {
            so_m1=rs.getInt(1);
        }
        rs=db.executeQuery("select count(*)  from deal_order where month(create_date)='1'");
        while(rs.next())
        {
            ho_m1=rs.getInt(1);
        }

        int so_m12=0;
        int ho_m12=0;
        rs=db.executeQuery("select count(*)  from specialty_order where month(create_date)='12'");
        while(rs.next())
        {
            so_m12=rs.getInt(1);
        }
        rs=db.executeQuery("select count(*)  from deal_order where month(create_date)='12'");
        while(rs.next())
        {
            ho_m12=rs.getInt(1);
        }



        cost_all=cost_house+cost_specialty;
        json.put("num_specialty",num_specialty);
        json.put("num_room_order",num_room_order);
        json.put("num_specialty_order",num_specialty_order);
        json.put("num_house",num_house);
        json.put("num_room",num_room);
        json.put("num_user",num_user);
        json.put("num_normal_user",num_normal_user);
        json.put("num_admin_user",num_admin_user);
        json.put("num_super_user",num_super_user);
        json.put("cost_all",cost_all);
        json.put("cost_house",cost_house);
        json.put("cost_specialty",cost_specialty);
        json.put("so_m1",so_m1);
        json.put("ho_m1",ho_m1);
        json.put("so_m12",so_m12);
        json.put("ho_m12",ho_m12);


    }

    public void getXunData(Data data, JSONObject json) throws SQLException, JSONException {
        DB db=new DB("group1");
        int[] time=new int[24];
        int[] h_num=new int[24];
        double[] h_cost=new double[24];
        int[] s_num=new int[24];
        double[] s_cost=new double[24];
        double[] t_cost=new double[24];
        for(int i=0;i<24;i++)
        {
            int num=0;
            double price=0;
            ResultSet rs=db.executeQuery("select num,num*price from deal_order where hour(create_date)="+(i+1));
            while (rs.next())
            {
                num=rs.getInt(1);
                price=rs.getDouble(2);
            }
            h_num[i]=num;
            h_cost[i]=price;
            rs=db.executeQuery("select num,num*price from specialty_order where hour(create_date)="+(i+1));
            while (rs.next())
            {
                num=rs.getInt(1);
                price=rs.getDouble(2);
            }

            s_num[i]=num;
            s_cost[i]=price;
            t_cost[i]=s_cost[i]+h_cost[i];

            time[i]=i+1;
        }
        json.put("time",time);
        json.put("h_num",h_num);
        json.put("h_cost",h_cost);
        json.put("s_num",s_num);
        json.put("s_cost",s_cost);
        json.put("t_cost",t_cost);
    }
}

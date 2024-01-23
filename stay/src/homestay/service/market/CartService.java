package homestay.service.market;
import homestay.dao.CartDao;
import homestay.dao.DB;
import homestay.dao.Data;
import homestay.servlet.market.MyExcel;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CartService {
    public void queryNumCartByUserId(String user_id,JSONObject json) throws SQLException, JSONException {
        try{
            CartDao dao=new CartDao();
            int num=dao.numCartByUserId(user_id);
            json.put("cart_num",num);
        }
        catch (Exception e){
            e.printStackTrace();
            System.out.println("query num cart by user id error");
        }

    }

    public void queryAllGood(JSONObject json,String user_id) throws JSONException {
        CartDao dao=new CartDao();
        JSONArray specialtyList=new JSONArray();

        try{
            specialtyList =dao.queryAllGood(user_id);

            json.put("good_list",specialtyList);
            json.put("code",0);
        }

        catch (Exception e)
        {
            e.printStackTrace();
            json.put("code",1);
            System.out.println("queryAllSpecialty error");
        }

    }

    public void addGood2Cart(Data data, JSONObject json,String user_id) throws JSONException {

        try{

            CartDao dao=new CartDao();
            dao.addGood2Cart(user_id,data,json);
            CartService cs=new CartService();
            cs.queryNumCartByUserId(user_id,json);
            json.put("code",0);
        }
        catch (Exception e){
            json.put("code",1);
            e.printStackTrace();
        }


    }

    public void deleteCartGood(Data data,JSONObject json,String user_id) throws JSONException {

        try{

            CartDao dao=new CartDao();
            dao.deleteCartGood(user_id,data,json);
            json.put("code",0);
        }
        catch (Exception e){
            json.put("code",1);
            e.printStackTrace();
        }

    }

    public void modifyCartGood(Data data, JSONObject json, String user_id) throws JSONException {
        try{

            CartDao dao=new CartDao();
            dao.modifyCartGood(user_id,data,json);
            json.put("code",0);
        }
        catch (Exception e){
            json.put("code",1);
            e.printStackTrace();
        }
    }

    public void queryByName(Data data, JSONObject json, String user_id) throws JSONException {
        CartDao dao=new CartDao();
        JSONArray specialtyList=new JSONArray();
        String search_name=data.getParam().getString("search_name");

        try{
            specialtyList =dao.querGoodByName(search_name,user_id);

            json.put("good_list",specialtyList);
            json.put("code",0);
        }

        catch (Exception e)
        {
            e.printStackTrace();
            json.put("code",1);
            System.out.println("queryAllSpecialty error");
        }
    }

    public void exportCartGood(String user_id, JSONObject json) throws JSONException {
        CartDao dao=new CartDao();
        JSONArray specialtyList=new JSONArray();
        DB queryDb=new DB("group1");
        String sql= "SELECT * FROM cart,specialty where cart.owner_id='"+user_id+"' and good_id=specialty_id" ;
        List jsonList = new ArrayList();
        List jsonName= new ArrayList();
        try{
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
                for(int i=0;i<rsmd.getColumnCount();i++)
                {
                    String columnLabel=rsmd.getColumnLabel(i+1);
                    jsonName.add(columnLabel);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            queryDb.close();
            /*--------------------数据操作 结束--------------------*/
            /*--------------------返回数据 开始--------------------*/
            json.put("aaData",jsonList);
            json.put("aaFieldName",jsonName);

            MyExcel me=new MyExcel("D:\\upload\\market\\export.xls");
            json.put("url","/upload/market/export.xls");
            json.put("file_path","D:\\upload\\market\\export.xls");
            me.exportData(json);
            json.put("code",0);
        }

        catch (Exception e) {
            e.printStackTrace();
            json.put("code", 1);
            System.out.println("queryAllSpecialty error");
        }
    }

    public void staCartGood(String user_id, JSONObject json) throws JSONException {

        try{
            DB db=new DB("group1");
            int n=0;
            ResultSet rs=db.executeQuery("select count(*) from specialty,cart where good_id=specialty_id");
            while(rs.next())
            {
                n=rs.getInt(1);
            }
            String[] good_name=new String[n];
            double[] price=new double[n];
            int i=0;
            rs=db.executeQuery("select specialty_name,price from specialty,cart where good_id=specialty_id");
            while (rs.next())
            {
                good_name[i]=rs.getString(1);
                price[i]=rs.getDouble(2);
                i++;
            }

            json.put("good_name",good_name);
            json.put("price",price);
            json.put("code",0);
        }

        catch (Exception e)
        {
            e.printStackTrace();
            json.put("code",1);
            System.out.println("queryAllSpecialty error");
        }
    }
}

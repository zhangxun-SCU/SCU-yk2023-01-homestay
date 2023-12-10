package homestay.dao;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import java.sql.ResultSet;
import java.sql.SQLException;
public class CartDao {
public int numCartByUserId(String user_id) throws SQLException {
    String sql="SELECT COUNT(*) FROM cart where owner_id='"+user_id+"'";
    DB db=new DB("group1");
    ResultSet res=db.executeQuery(sql);
    int count=0;
    while(res.next()){
        count=res.getInt(1);
    }
    System.out.println(count);
    return count;
}

    public JSONArray queryAllGood(String user_id) throws SQLException, JSONException {
        String sql = "SELECT * FROM cart,specialty where cart.owner_id='"+user_id+"' and good_id=specialty_id" ;
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
            tpSpecialty.put("max_num",rs.getInt("specialty.num"));
            tpSpecialty.put("num",rs.getInt(3));
            specialtyList.put(tpSpecialty);
        }
        rs.close();
        db.close();
        return specialtyList;
    }

    public void addGood2Cart(String user_id, Data data, JSONObject json) throws JSONException {
        String good_id=data.getParam().getString("good_id");
        int good_num=Integer.parseInt(data.getParam().getString("good_num"));
        String sql="insert into cart(good_id,owner_id,num) values('"+good_id+"','"+user_id+"','"+good_num+"')";
        DB db=new DB("group1");
        db.executeUpdate(sql);

    }

    public void deleteCartGood(String user_id, Data data, JSONObject json) throws JSONException {
    DB db=new DB("group1");
    String sql="delete from cart where owner_id='"+user_id+"' and good_id='"+data.getParam().getString("good_id")+"'";
    db.executeUpdate(sql);
    }
}

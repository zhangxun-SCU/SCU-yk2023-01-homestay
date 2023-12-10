package homestay.dao.market;

import homestay.dao.DB;
import org.json.JSONException;
import org.json.JSONObject;

import java.awt.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RoomDao {
    public ArrayList<JSONObject> getRoomListByHouseId(String house_id) throws SQLException, JSONException {
        DB db=new DB("group1");
        String sql="select * from room where house_id='"+house_id+"'";
        ResultSet rs=db.executeQuery(sql);
        ArrayList<JSONObject> room_list=new ArrayList<JSONObject>();
        while(rs.next())
        {
            JSONObject room =new JSONObject();
            room.put("room_id",rs.getString("room_id"));
            room.put("room_num",rs.getInt("room_num"));
            room.put("room_price",rs.getString("room_price"));
            room.put("room_name",rs.getString("room_name"));
            room.put("imageurl",rs.getString("imageurl"));
            room_list.add(room);
        }

        return room_list;
    }

    public JSONObject getRoomResNum(String house_id, JSONObject room,String in_date,String out_date) throws JSONException, SQLException {

        //有剩余数量的房间信息
        JSONObject room_res=new JSONObject(room.toString());

        System.out.println("客人需求时间"+in_date+out_date);

        int room_num=room.getInt("room_num");

        DB db=new DB("group1");
        String sql="select * from  room_occupy where house_id='"+house_id+"' and room_id = '"+room.getString("room_id")+"'";
        ResultSet rs=db.executeQuery(sql);
        System.out.println(sql+"执行成功");

        //初始化入店时间序列
        ArrayList<List<JSONObject>> occupy=new ArrayList<List<JSONObject>>();
        for(int i=0;i<room_num;i++)
        {
            ArrayList<JSONObject> room_sequecen=new ArrayList<JSONObject>();
            occupy.add(room_sequecen);
        }


        while(rs.next())
        {
            String rin_date=rs.getString("in_date");
            String rout_date=rs.getString("out_date");

            //忽略不重叠时间，即以往出店时间小于当前入店时间，或以后的入店时间大于当今的出店时间
            if(rout_date.compareTo(in_date)<=0 || rin_date.compareTo(out_date)>=0)
            {
                continue;
            }
            //开始堆放房间占用信息。
            int op_num= rs.getInt("num");
            System.out.println("当前数量："+op_num);
            JSONObject rsq= new JSONObject();
            rsq.put("sd",rin_date);
            rsq.put("ed",rout_date);
            for (int opn=0;opn<op_num;opn++)
            {
                //遍历i间房
                for(int i=0;i<room_num;i++)
                {

                    boolean find_blank=false;

                    //遍历第 i 房间时间序列
                    for(int j=0;j<=occupy.get(i).size();j++)
                    {

                        //跳过0
                        if(j==0)
                        {
                            //遍历完所有时间间隔，循环仍未停止，表明可以插入
                            if(j==occupy.get(i).size())
                            {
                                occupy.get(i).add(j,rsq);
                                find_blank=true;
                                break;
                            }

                            if(occupy.get(i).get(j).getString("sd").compareTo(rsq.getString("ed"))>=0)
                            {
                                occupy.get(i).add(j,rsq);
                                find_blank=true;
                                break;
                            }

                            continue;
                        }

                        JSONObject ob1=occupy.get(i).get(j-1);

                        //非空类型已经找到最后一个;
                        if(j==occupy.get(i).size())
                        {
                            if(ob1.getString("ed").compareTo(rsq.getString("sd"))<=0)
                            {
                                //如果满足那么久直接添加
                                find_blank=true;
                                occupy.get(i).add(j,rsq);
                                break;
                            }
                            else{
                                break;
                            }
                        }

                        //找到两个序列取其间隔

                        JSONObject ob2=occupy.get(i).get(j);

                        //如果和时间序列冲突就跳出
                        if(ob1.getString("ed").compareTo(rsq.getString("sd"))<0)
                        {
                            //位于间隔之间直接插入
                            if(ob2.getString("sd").compareTo(rsq.getString("ed"))>=0)
                            {
                                occupy.get(i).add(j,rsq);
                                find_blank=true;
                                break;
                            }
                            //继续寻找下一个空格
                            else{
                                continue;
                            }
                        }
                        else{
                            break;
                        }

                    }
                    //找到了就不找了
                    if(find_blank)
                    {
                        break;
                    }
                }
            }



        }

        int res_num=0;

        for(int i=0;i<room_num;i++)
        {
            if(occupy.get(i).size()==0)
            {
                res_num++;
            }
        }
        room_res.put("res_num",res_num);
        return  room_res;
    }
}

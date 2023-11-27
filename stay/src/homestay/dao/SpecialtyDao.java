package homestay.dao;

import org.json.JSONException;
import org.json.JSONObject;
import sun.misc.BASE64Decoder;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SpecialtyDao {
    private static String IMAGE_DIR = "D:\\upload\\specialty_image\\";

    private void showDebug(String function, String message) {
        String log = "[SpecialtyDao]" + function + message;
        System.out.println(log);
    }

    private void base64ToImage(String b64_data, String filepath) throws IOException {
        BASE64Decoder decoder = new BASE64Decoder();
        //Base64解码
        byte[] buffer = new byte[0];
        try {
            buffer = decoder.decodeBuffer(b64_data);
            for (int i = 0; i < buffer.length; ++i) {
                if (buffer[i] < 0) {
                    //调整异常数据
                    buffer[i] += 256;
                }
            }
            OutputStream out = new FileOutputStream(filepath);
            out.write(buffer);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void addSpecialty(Data data) throws JSONException, IOException {
        DB db = new DB("group1");
        String username = data.getParam().getString("username").isEmpty() ? "" : data.getParam().getString("username");
        // id: GoodsSpecialty + timestamp
        String specialty_id = "GS" + Long.toString(new Date().getTime());
        String specialty_name = data.getParam().getString("specialty_name");
        Double price = data.getParam().getDouble("price");
        int num = data.getParam().getInt("num");
        String imageurl = data.getParam().getString("imageurl");
        String imagePath = IMAGE_DIR + specialty_id + ".png";
        base64ToImage(imageurl, imagePath);
        imageurl = "/upload/specialty_image" + specialty_id + ".png";
        String sql = "Insert Into specialty ";
        String values = String.format(
                "Values('%s', '%s', '%f', '%d', '%s', '%s')",
                specialty_id,
                specialty_name,
                price,
                num,
                username,
                imageurl
        );
        sql += values;
        showDebug("[addSpecialty]", "sql: " + sql);
        db.executeUpdate(sql);
    }
}

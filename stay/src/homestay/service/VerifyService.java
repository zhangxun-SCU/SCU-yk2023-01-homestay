package homestay.service;

import homestay.dao.Data;
import homestay.utils.VerifyUtil;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Random;

public class VerifyService {

    private int size = 4;  // 默认字符数量
    private int lines = 8;  // 默认干扰线数量
    private int width = 80;  // 默认宽度
    private int height = 35;  // 默认高度
    private int fontSize = 25;  // 默认字体大小
    private boolean tilt = true;  // 默认字体倾斜

    private static final char[] chars = {
            '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
            'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
            'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
            'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};

    private String genVerifyCode(int digit) {
        StringBuilder code = new StringBuilder("");
        Random random = new Random();
        while (code.length() < digit) {
            code.append(this.chars[random.nextInt(chars.length)]);
        }
        return code.toString();
    }

    public Object[] getVerifyCode() {
        String code = genVerifyCode(size);
        Object[] verifyCode = VerifyUtil.newBuilder()
                .setSize(size)
                .setLines(lines)
                .setWidth(width)
                .setHeight(height)
                .setFontSize(fontSize)
                .setTilt(tilt)
                .build()
                .createImage(code);
        return verifyCode;
    }

    public boolean checkCode(Data data, String serverCode, JSONObject resJson) throws JSONException {
        // 验证验证码
//        System.out.println("serverCode: " + serverCode);
//        System.out.println("receiveCode: " + code);
        String code = data.getParam().getString("imgVerifyCode");
        if (serverCode == null || code == null || !serverCode.toUpperCase().equals(code.toUpperCase())) {
            resJson.put("resCode", "V0001");
            resJson.put("imgVerifyInfo", "error: verify code incorrect");
            return false;
        }
        resJson.put("resCode", "00000");
        resJson.put("resInfo", "success");
        return true;
    }
}

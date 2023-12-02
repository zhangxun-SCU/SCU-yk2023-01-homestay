package homestay.service;

import homestay.dao.Data;
import homestay.utils.EmailUtil;
import org.apache.commons.mail.EmailException;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.Random;

public class EmailService {
    private int default_digits = 6;

    private static final char[] chars = {
            '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
            'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
            'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
            'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};

    private String genEmailVerifyCode(int digit) {
        StringBuilder code = new StringBuilder("");
        Random random = new Random();
        while (code.length() < digit) {
            code.append(this.chars[random.nextInt(chars.length)]);
        }
        return code.toString();
    }

    public String sendEmail(Data data) throws JSONException, EmailException {
        String toAddr = data.getParam().getString("email");
        String emailVerifyCode = genEmailVerifyCode(default_digits);
        (new EmailUtil()).sendEmail(toAddr, emailVerifyCode);
        System.out.println(emailVerifyCode);
        return emailVerifyCode;
    }

    public boolean checkEmailVerifyCode(Data data, String serverEmailVerifyCode,  JSONObject resJson) throws JSONException {
        String inputVerifyCode = data.getParam().getString("emailVerifyCode");
        if(serverEmailVerifyCode == null || inputVerifyCode == null || !serverEmailVerifyCode.equals(inputVerifyCode)) {
            resJson.put("resCode", "V0002");
            resJson.put("emailVerifyInfo", "error: email verify code incorrect");
            return false;
        }
        resJson.put("resCode", "00000");
        resJson.put("emailVerifyInfo", "success");
        return true;
    }
}

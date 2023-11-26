package homestay.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class VerifyService {
    public String checkCode(String code, HttpServletRequest req) {
        HttpSession session = req.getSession();
        String id = session.getId();
        // 验证验证码
        String serverCode = (String) session.getAttribute("SESSION_VERIFY_CODE_" + id);
//        System.out.println("serverCode: " + serverCode);
//        System.out.println("receiveCode: " + code);
        if (serverCode == null || code == null || !serverCode.toUpperCase().equals(code.toUpperCase())) {
            return "verify code incorrect";
        }
        return "verify code correct";
    }
}

package homestay.utils;

import io.jsonwebtoken.Claims;
import org.apache.commons.codec.digest.DigestUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserUtil {
    public static String getUserId(HttpServletRequest req) {
        String jwt = null;
        Cookie[] cookies = req.getCookies();
        for(Cookie cookie: cookies) {
            if (cookie.getName().equals("token")) {
                jwt = cookie.getValue();
            }
        }
        try {
            Claims claims = JwtUtil.parseJwt(jwt);
            return claims.get("id").toString();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String encrypt(String info) {
        return DigestUtils.md5Hex(info);
    }
}

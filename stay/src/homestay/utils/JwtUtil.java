package homestay.utils;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import java.util.Date;
import java.util.HashMap;

public class JwtUtil {
    private static String signKey = "ScuStay";
    private static Long expire = 43200000L;

    public static String generateJwt(HashMap<String, Object> claims) {
        String jwt = Jwts.builder()
                .setClaims(claims)
                .signWith(SignatureAlgorithm.HS256, "ScuStay")
                .setExpiration(new Date(expire))
                .compact();
        return jwt;
    }

    public static Claims parseJwt(String jwt) {
        Claims claims = Jwts.parser()
                .setSigningKey(signKey)
                .parseClaimsJwt(jwt)
                .getBody();
        return claims;
    }
}

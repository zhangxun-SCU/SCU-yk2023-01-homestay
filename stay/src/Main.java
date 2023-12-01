import homestay.utils.Config;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import java.util.Date;
import java.util.HashMap;

public class Main {
    public static void main(String[] args) {
        System.out.println("Hello world!");
        System.out.println(Config.getInstance().getString("db.url"));
        jwtGen();
    }


    private static void jwtGen() {
        HashMap<String, Object> claims = new HashMap<>();
        claims.put("username", "xun");
        claims.put("id", "1");
        String token = Jwts.builder()
                .setClaims(claims)
                .signWith(SignatureAlgorithm.HS256, "ScuStay")
                .setExpiration(new Date(System.currentTimeMillis() + 3600 * 1000 * 24))
                .compact();
        System.out.println(token);
    }

    private static void jwtParse() {
        
    }
}
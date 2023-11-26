import homestay.utils.ConfigMysql;

public class Main {
    public static void main(String[] args) {
        System.out.println("Hello world!");
        System.out.println(ConfigMysql.getInstance().getString("db.url"));
    }
}
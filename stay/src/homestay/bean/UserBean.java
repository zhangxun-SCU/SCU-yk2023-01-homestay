package homestay.bean;

public class UserBean {
    private String user_id;
    private String permission;
    private String user_password;
    private String email;
    private String priority;

    public UserBean() {

    }

    public UserBean(String user_id, String permission, String user_password, String email, String priority) {
        this.user_id = user_id;
        this.permission = permission;
        this.user_password = user_password;
        this.email = email;
        this.priority = priority;
    }


    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }


    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }
}


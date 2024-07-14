public class Admin{
    private String adminUsername;
    private String password;

    public Admin() {
    }

    public Admin(String adminUsername, String password) {
        this.adminUsername = adminUsername;
        this.password = password;
    }

    public String getAdminUsername() {
        return this.adminUsername;
    }


    public String getPassword() {
        return this.password;
    }

}
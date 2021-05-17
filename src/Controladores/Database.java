package Controladores;

/**
 *
 * @author armando
 */
public class Database {

    private String url;
    private String driver;
    private String user;
    private String pass;

    public Database() {
        //this.url = "jdbc:mysql://localhost:3306/AS?useUnicode=true&characterEncoding=UTF-8";
        this.url = "jdbc:mysql://35.198.20.179:3306/as?useUnicode=true&characterEncoding=UTF-8";
        //jdbc:google:mysql://IP:Instance_name?user=user_name
        this.driver = "com.mysql.jdbc.Driver";
        //this.user = "root";
        this.user = "administrador";
        //this.pass = "";
        this.pass = "aapm2021";
    }

    public String getUrl() {
        return url;
    }

    public String getDriver() {
        return driver;
    }

    public String getUser() {
        return user;
    }

    public String getPass() {
        return pass;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cafe;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import java.util.List;
import jakarta.ejb.Stateless;

@Stateless
public class user implements userLocal {

    private int id;
    private String username;
    private String password;
    private String name;
    private String phone;
    private int age;
    private Date datejoined;
    private int salary;
    private String role;
    private String studentid;
    private String status;

    private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;
    private Connection jdbcConnection;

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    public user() {

    }

    // manager constructor method
    public user(int id, String username, String name, String phone, int age, String role) {
        this.id = id;
        this.username = username;
        this.name = name;
        this.phone = phone;
        this.age = age;
        this.role = role;
    }

    // customer constructor method
    public user(int id, String username, String name, String phone, int age, Date datejoined, String role,
            String studentid, String status) {
        this.id = id;
        this.username = username;
        this.name = name;
        this.phone = phone;
        this.age = age;
        this.datejoined = datejoined;
        this.role = role;
        this.studentid = studentid;
        this.status = status;
    }

    // staff constructor method
    public user(int id, String username, String name, String phone, int age, Date datejoined, int salary, String role) {
        this.id = id;
        this.username = username;
        this.name = name;
        this.phone = phone;
        this.age = age;
        this.datejoined = datejoined;
        this.salary = salary;
        this.role = role;
    }

    @Override
    public void init(String jdbcURL, String jdbcUsername, String jdbcPassword) {
        this.jdbcURL = jdbcURL;
        this.jdbcUsername = jdbcUsername;
        this.jdbcPassword = jdbcPassword;
    }

    public void connect() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }

            jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

        }
    }

    public void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }

    public String getUsername() {
        return username;
    }

    public String getName() {
        return name;
    }

    public int getId() {
        return id;
    }

    public String getPassword() {
        return password;
    }

    public String getPhone() {
        return phone;
    }

    public int getAge() {
        return age;
    }

    public Date getDatejoined() {
        return datejoined;
    }

    public void setDatejoined(Date datejoined) {
        this.datejoined = datejoined;
    }

    public int getSalary() {
        return salary;
    }

    public String getRole() {
        return role;
    }

    public String getStudentid() {
        return studentid;
    }

    public String getStatus() {
        return status;
    }

    @Override
    public List<user> liststaff(String search) throws SQLException {
        List<user> userlist = new ArrayList<>();

        String sql = "select id, username, name, age, phone, datejoined, salary from stafftable ";
        if (search != null) {
            sql += "where name like '%" + search + "%' " + "or age like '%" + search + "%' " + "or phone like '%"
                    + search + "%' " + "or username like '%" + search + "%' ";
        }

        connect();

        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String username = resultSet.getString("username");
            String name = resultSet.getString("name");
            int age = resultSet.getInt("age");
            String phone = resultSet.getString("phone");
            Date datejoined = resultSet.getDate("datejoined");
            int salary = resultSet.getInt("salary");

            user nuser = new user(id, username, name, phone, age, datejoined, salary, "staff");
            userlist.add(nuser);
        }

        resultSet.close();
        statement.close();

        disconnect();

        return userlist;
    }

    @Override
    public List<user> listcustomer(String search) throws SQLException {
        List<user> userlist = new ArrayList<>();

        String sql = "select id, username, name, age, phone, datejoined, studentid, status from customertable ";
        if (search != null) {
            sql += "where name like '%" + search + "%' " + "or age like '%" + search + "%' " + "or phone like '%"
                    + search + "%' " + "or studentid like '%" + search + "%' ";
            sql += "or username like '%" + search + "%' " + "or status like '%" + search + "%' ";
        }

        connect();

        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String username = resultSet.getString("username");
            String name = resultSet.getString("name");
            int age = resultSet.getInt("age");
            String phone = resultSet.getString("phone");
            Date datejoined = resultSet.getDate("datejoined");
            String studentid = resultSet.getString("studentid");
            String status = resultSet.getString("status");

            user nuser = new user(id, username, name, phone, age, datejoined, "customer", studentid, status);
            userlist.add(nuser);
        }

        resultSet.close();
        statement.close();

        disconnect();

        return userlist;
    }

    @Override
    public user login(String username, String password, String role) throws SQLException {
        if (!role.equals("manager") && !role.equals("staff") && !role.equals("customer")) {
            return null;
        }

        String sql = "select id, phone, name, age ";
        if (role.equals("customer")) {
            sql += ",status ";
        }
        sql += "from " + role + "table where username ='" + username + "' and password = '" + password + "' ";

        user nuser = null;
        String status = null;

        connect();

        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        if (resultSet.next()) {
            String phone = resultSet.getString("phone");
            String name = resultSet.getString("name");
            int id = resultSet.getInt("id");
            int age = resultSet.getInt("age");
            if (role.equals("customer")) {
                status = resultSet.getString("status");
            }

            if (status == null || status.equals("approved")) {
                nuser = new user(id, username, name, phone, age, role);
            }
        }

        return nuser;
    }

    @Override
    public String changepass(int userid, String oldpass, String pass1, String pass2, String role) throws SQLException {
        connect();

        String sql = "select password from " + role + "table where id='" + userid + "';";

        Statement statement = jdbcConnection.createStatement();
        ResultSet rs = statement.executeQuery(sql);
        while (rs.next()) {
            if (!oldpass.equals(rs.getString("password"))) {
                return "Old password isn't valid !";
            }
            if (!pass1.equals(pass2)) {
                return "Password confirmation doesn't match the password !";
            }
        }
        sql = "update " + role + "table set password = '" + pass1 + "' where id=" + userid + " and password='" + oldpass
                + "';";
        int resultSet = statement.executeUpdate(sql);

        return "Info Updated !";
    }

    @Override
    public String deleteuser(int id, String role) throws SQLException {

        String sql = "delete from " + role + "table where id = " + id;
        connect();

        Statement statement = jdbcConnection.createStatement();
        int resultSet = statement.executeUpdate(sql);

        return "User Deleted!";
    }

    @Override
    public user getcustomer(int id) throws SQLException {
        user nuser = null;
        String sql = "select id, username, name, age, phone, datejoined, studentid, status from customertable where id = "
                + id;
        connect();

        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        if (resultSet.next()) {
            String username = resultSet.getString("username");
            String name = resultSet.getString("name");
            int age = resultSet.getInt("age");
            String phone = resultSet.getString("phone");
            Date datejoined = resultSet.getDate("datejoined");
            String studentid = resultSet.getString("studentid");
            String status = resultSet.getString("status");

            nuser = new user(id, username, name, phone, age, datejoined, "customer", studentid, status);
        }

        return nuser;
    }

    @Override
    public user getstaff(int id) throws SQLException {
        user nuser = null;
        String sql = "select id, username, name, age, phone, datejoined, salary from stafftable where id = " + id;
        connect();

        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        if (resultSet.next()) {
            String username = resultSet.getString("username");
            String name = resultSet.getString("name");
            int age = resultSet.getInt("age");
            String phone = resultSet.getString("phone");
            Date datejoined = resultSet.getDate("datejoined");
            int salary = resultSet.getInt("salary");

            nuser = new user(id, username, name, phone, age, datejoined, salary, "staff");
        }

        return nuser;
    }

    @Override
    public user getmanager(int id) throws SQLException {
        user nuser = null;
        String sql = "select id, username, name, age, phone, datejoined, salary from managertable where id = " + id;
        connect();

        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        if (resultSet.next()) {
            String username = resultSet.getString("username");
            String name = resultSet.getString("name");
            int age = resultSet.getInt("age");
            String phone = resultSet.getString("phone");
            Date datejoined = resultSet.getDate("datejoined");
            int salary = resultSet.getInt("salary");

            nuser = new user(id, username, name, phone, age, datejoined, salary, "manager");
        }

        return nuser;
    }

    @Override
    public String updateinfo(int userid, String role, String name, int age, String phone, Date datejoined, int salary,
            String studentid) throws SQLException {
        String result = "Info Updated !";

        String sql = "update " + role + "table set name='" + name + "', age=" + age + ", phone='" + phone
                + "', datejoined='" + datejoined + "'";

        if (role.equals("staff")) {
            sql += ", salary = " + salary;
        } else if (role.equals("customer")) {
            sql += ", studentid = '" + studentid + "'";
        }

        sql += " where id = " + userid;
        //
        // System.out.println(sql);

        connect();

        Statement statement = jdbcConnection.createStatement();
        int resultSet = statement.executeUpdate(sql);

        return result;
    }

    @Override
    public String addcustomer(String username, String pass1, String pass2, String name, String studentid, int age,
            String phone, Date datejoined) throws SQLException {

        String table = "customertable";

        String result = "";

        String sql = "select id from " + table + " where username = '" + username + "' ";

        connect();

        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        if (username == null || pass1 == null || name == null || studentid == null || age == 0 || phone == null
                || datejoined == null) {
            result = "Please fill in all the information !";
        } else if (resultSet.next()) {
            result = "User already exist !";
        } else if (!pass1.equals(pass2)) {
            result = "Password confirmation doesn't match the password !";
        } else {
            sql = "insert into " + table + " (username, password, name, studentid, age, phone, datejoined) values ('"
                    + username + "' , '"
                    + pass1 + "' , '" + name + "' , '" + studentid + "' , '" + age + "' , '" + phone + "' , '"
                    + datejoined + "' );";
            int resultSet1 = statement.executeUpdate(sql);
            result = "New user created !";
        }
        return result;
    }

    @Override
    public String addstaff(String username, String pass1, String pass2, String name, int salary, int age, String phone,
            Date datejoined) throws SQLException {

        String table = "stafftable";

        String result = "";

        String sql = "select id from " + table + " where username = '" + username + "' ";

        connect();

        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        if (username == null || pass1 == null || name == null || salary == 0 || age == 0 || phone == null
                || datejoined == null) {
            result = "Please fill in all the information !";
        } else if (resultSet.next()) {
            result = "User already exist !";
        } else if (!pass1.equals(pass2)) {
            return "New password not same !";
        } else {
            sql = "insert into " + table + " (username, password, name, salary, age, phone, datejoined) values ('"
                    + username + "' , '"
                    + pass1 + "' , '" + name + "' , '" + salary + "' , '" + age + "' , '" + phone + "' , '" + datejoined
                    + "' );";
            int resultSet1 = statement.executeUpdate(sql);
            result = "New staff created !";
        }
        return result;
    }

    @Override
    public List<String> staffearning() throws SQLException {
        List<String> alist = new ArrayList<>();

        String sql = "select name, sum(price) as earn from booking left join stafftable on staffid=stafftable.id  group by staffid order by earn desc;";
        connect();

        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        while (resultSet.next()) {
            int earn = resultSet.getInt("earn");
            String username = resultSet.getString("name");

            if (username == null) {
                username = "Vacant";
            }

            username += " => RM " + String.valueOf(earn);
            alist.add(username);

            // System.out.println(username);
        }

        resultSet.close();
        statement.close();

        disconnect();

        return alist;
    }

    @Override
    public List<String> staffrating() throws SQLException {
        List<String> alist = new ArrayList<>();

        String sql = "select name, avg(rating) as earn from booking left join stafftable on staffid=stafftable.id  group by staffid order by earn desc;";
        connect();

        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        while (resultSet.next()) {
            int earn = resultSet.getInt("earn");
            String username = resultSet.getString("name");

            if (username == null) {
                username = "Vacant";
            }

            username += " => " + String.valueOf(earn) + "/10";
            alist.add(username);

            // System.out.println(nuser.id);
        }

        resultSet.close();
        statement.close();

        disconnect();

        return alist;
    }

    @Override
    public int staffavgrating(int id) throws SQLException {
        int score = 0;

        String sql = "select avg(rating) as rating from booking where staffid = " + id;
        connect();

        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        while (resultSet.next()) {
            score = resultSet.getInt("rating");

        }

        resultSet.close();
        statement.close();

        disconnect();

        return score;
    }

    @Override
    public List<String> staffbookingcount() throws SQLException {
        List<String> alist = new ArrayList<>();

        String sql = "select name, count(rating) as earn from booking left join stafftable on staffid=stafftable.id  group by staffid order by earn desc;";
        connect();

        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        while (resultSet.next()) {
            int earn = resultSet.getInt("earn");
            String username = resultSet.getString("name");

            if (username == null) {
                username = "Vacant";
            }

            username += " => " + String.valueOf(earn);
            alist.add(username);

            // System.out.println(nuser.id);
        }

        resultSet.close();
        statement.close();

        disconnect();

        return alist;
    }

    @Override
    public List<String> customerspend() throws SQLException {
        List<String> alist = new ArrayList<>();

        String sql = "select name, sum(price) as earn from booking left join customertable on customerid=customertable.id  group by customerid order by earn desc;";
        connect();

        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        while (resultSet.next()) {
            int earn = resultSet.getInt("earn");
            String username = resultSet.getString("name");

            if (username == null) {
                username = "Vacant";
            }

            username += " => RM " + String.valueOf(earn);
            alist.add(username);

            // System.out.println(nuser.id);
        }

        resultSet.close();
        statement.close();

        disconnect();

        return alist;
    }

    @Override
    public List<String> customerbookcount() throws SQLException {
        List<String> alist = new ArrayList<>();

        String sql = "select name, count(rating) as earn from booking left join customertable on customerid=customertable.id  group by customerid order by earn desc;";
        connect();

        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        while (resultSet.next()) {
            int earn = resultSet.getInt("earn");
            String username = resultSet.getString("name");

            if (username == null) {
                username = "Vacant";
            }

            username += " => " + String.valueOf(earn);
            alist.add(username);
        }

        resultSet.close();
        statement.close();

        disconnect();

        return alist;
    }

    @Override
    public String approvecustomer(int id) throws SQLException {
        String result = "Customer approved!";

        String sql = "update customertable set status = 'approved' where id = " + id;
        connect();

        Statement statement = jdbcConnection.createStatement();
        int resultSet = statement.executeUpdate(sql);

        return result;
    }
}

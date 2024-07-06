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
public class booking implements bookingLocal {

    private int id;
    private int customerid;
    private int staffid;
    // booking time
    private int rating;
    private String comment;
    private double price;
    private String content;
    private Date datebooking;
    private String status;
    private String role;
    private String foodcategory;
    private String foodname;
    private int quantity;

    private String customername;
    private String staffname;

    private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;
    private Connection jdbcConnection;

    public booking() {
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    public booking(int id, int customerid, int staffid, int rating, String comment, double price, String content) {
        this.id = id;
        this.customerid = customerid;
        this.staffid = staffid;
        this.rating = rating;
        this.comment = comment;
        this.price = price;
        this.content = content;
    }

    public booking(int quantity, int id, String customername, String staffname, int rating, String comment, double price, Date datebooking, String status, String foodname, String foodcategory) {
        this.id = id;
        this.customername = customername;
        this.staffname = staffname;
        this.rating = rating;
        this.comment = comment;
        this.price = price;
        this.content = content;
        this.datebooking = datebooking;
        this.status = status;
        this.foodcategory = foodcategory;
        this.foodname = foodname;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getCustomerid() {
        return customerid;
    }

    public int getStaffid() {
        return staffid;
    }

    public int getRating() {
        return rating;
    }

    public String getFoodcategory() {
        return foodcategory;
    }

    public String getFoodname() {
        return foodname;
    }

    public String getComment() {
        return comment;
    }

    public double getPrice() {
        return price;
    }

    public String getContent() {
        return content;
    }

    public String getStaffname() {
        return staffname;
    }

    public String getCustomername() {
        return customername;
    }

    public Date getDatebooking() {
        return datebooking;
    }

    public void setDatebooking(Date datebooking) {
        this.datebooking = datebooking;
    }

    public String getStatus() {
        return status;
    }

    public String getRole() {
        return role;
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
                Class.forName("com.mysql.cj.jdbc.Driver");
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

    @Override
    public List<booking> listbooking(String username, String role, String search) throws SQLException {
        List<booking> bookinglist = new ArrayList<>();

        String sql = "select quantity, booking.id, customer.name as customer, staff.name as staff, rating, comment, price, datebooking, booking.status, foodcategory, foodname from booking left join customertable customer on customerid=customer.id left join stafftable staff on staffid=staff.id";
        if (!role.equals("manager")) {
            sql += " where (customer.username = '" + username + "' or staff.username='" + username + "')";
            if (search != null) {
                sql += " and ( customer.name like '%" + search + "%' " + "or quantity like '%" + search + "%' " + "or booking.id like '%" + search + "%' " + "or staff.name like '%" + search + "%' " + "or rating like '%"
                        + search + "%' " + "or comment like '%" + search + "%' " + "or price like '%" + search + "%' " + "or datebooking like '%" + search + "%' " + "or booking.status like '%"
                        + search + "%' " + "or foodcategory like '%" + search + "%' " + "or foodname like '%" + search + "%')";
            }
        } else if (role.equals("manager")) {
            if (search != null) {
                sql += " where ( customer.name like '%" + search + "%' " + "or quantity like '%" + search + "%' " + "or booking.id like '%" + search + "%' " + "or staff.name like '%" + search + "%' " + "or rating like '%"
                        + search + "%' " + "or comment like '%" + search + "%' " + "or price like '%" + search + "%' " + "or datebooking like '%" + search + "%' " + "or booking.status like '%"
                        + search + "%' " + "or foodcategory like '%" + search + "%' " + "or foodname like '%" + search + "%')";
            }
        }

        connect();
        sql += ";";
        System.out.println(sql);

        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String customer = resultSet.getString("customer");
            String staff = resultSet.getString("staff");
            int rating = resultSet.getInt("rating");
            String comment = resultSet.getString("comment");
            double price = resultSet.getDouble("price");
            String foodname = resultSet.getString("foodname");
            String foodcategory = resultSet.getString("foodcategory");
            Date datebooking = resultSet.getDate("datebooking");
            String status = resultSet.getString("status");
            int quantity = resultSet.getInt("quantity");

            booking nbooking = new booking(quantity, id, customer, staff, rating, comment, price, datebooking, status, foodcategory, foodname);
            bookinglist.add(nbooking);

            //System.out.println(nuser.id);
        }

        resultSet.close();
        statement.close();

        disconnect();

        return bookinglist;
    }

    @Override
    public String addbooking(int quantity, String role, int userid, Date datebooking, int price, String food, String foodcategory) throws SQLException {
        String result = "";

        String sql = "insert into booking (";
        if (datebooking == null) {
            result = "Booking date cannot be empty !";
            return result;
        }

        if (role.equals("customer")) {
            sql += "customerid, ";
        } else if (role.equals("staff") || role.equals("manager")) {
            sql += "staffid, ";
        }
        sql += "datebooking, price, foodname, foodcategory, quantity) values (" + userid + ", '" + datebooking + "', " + price;
        sql += ", '" + food + "', '" + foodcategory + "', " + quantity + ");";

        System.out.println(sql);

        connect();

        Statement statement = jdbcConnection.createStatement();
        int resultSet = statement.executeUpdate(sql);

        result = "Booking successfully created !";

        return result;
    }

    @Override
    public String editbooking(int quantity, int bookingid, Date datebooking, int price, String food, String foodcategory) throws SQLException {
        String result = "";

        String sql = "update booking set datebooking='" + datebooking + "', price=" + price;
        sql += ", foodname='" + food + "', foodcategory='" + foodcategory + "', quantity = " + quantity + " where id = " + bookingid;
        if (datebooking == null) {
            result = "Booking date cannot be empty !";
            return result;
        }
        System.out.println(sql);

        connect();

        Statement statement = jdbcConnection.createStatement();
        int resultSet = statement.executeUpdate(sql);

        result = "Booking successfully edited !";

        return result;
    }

    @Override
    public void deletebooking(int id) throws SQLException {
        String sql = "delete from booking where id = " + id;

        connect();

        Statement statement = jdbcConnection.createStatement();
        int resultSet = statement.executeUpdate(sql);
    }

    @Override
    public String ratebooking(int id, int rating, String comment) throws SQLException {
        String sql = "update booking set rating = " + rating + ", comment = '" + comment + "' where id = " + id;
        String result = "";

        connect();

        Statement statement = jdbcConnection.createStatement();
        int resultSet = statement.executeUpdate(sql);

        return "Successfully added rating !";
    }

    @Override
    public void assignbooking(int staffid, int bookingid) throws SQLException {
        String sql = "update booking set staffid = " + staffid + " where id = " + bookingid;

        connect();

        Statement statement = jdbcConnection.createStatement();
        int resultSet = statement.executeUpdate(sql);
    }

    @Override
    public void changestatus(int bookingid, String status) throws SQLException {
        String sql = "update booking set status = '" + status + "' where id = " + bookingid;

        connect();

        Statement statement = jdbcConnection.createStatement();
        int resultSet = statement.executeUpdate(sql);
    }

    @Override
    public booking getbooking(int id) throws SQLException {
        booking nuser = null;
        String sql = "select quantity, booking.id, customertable.name as customer, stafftable.name as staff, rating, comment, price, booking.status, datebooking, foodcategory, foodname";
        sql += " from booking left join customertable on customerid=customertable.id left join stafftable on staffid=stafftable.id where booking.id=" + id;

        connect();
        System.out.println(sql);
        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        if (resultSet.next()) {
            String customer = resultSet.getString("customer");
            String staff = resultSet.getString("staff");
            int rating = resultSet.getInt("rating");
            String comment = resultSet.getString("comment");
            double price = resultSet.getDouble("price");
            String foodname = resultSet.getString("foodname");
            String foodcategory = resultSet.getString("foodcategory");
            Date datebooking = resultSet.getDate("datebooking");
            String status = resultSet.getString("status");
            int quantity = resultSet.getInt("quantity");

            nuser = new booking(quantity, id, customer, staff, rating, comment, price, datebooking, status, foodname, foodcategory);
        }

        return nuser;
    }

}

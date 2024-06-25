/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cafe;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import jakarta.ejb.Local;

@Local
public interface userLocal {

    void init(String jdbcURL, String jdbcUsername, String jdbcPassword);

    List<user> liststaff(String search) throws SQLException;

    List<user> listcustomer(String search) throws SQLException;

    user login(String username, String password, String role) throws SQLException;

    String changepass(int userid, String oldpass, String pass1, String pass2, String role) throws SQLException;

    String deleteuser(int id, String role) throws SQLException;

    user getcustomer(int id) throws SQLException;

    user getstaff(int id) throws SQLException;

    user getmanager(int id) throws SQLException;

    String updateinfo(int userid, String role, String name, int age, String phone, Date datejoined, int salary,
            String studentid) throws SQLException;

    String addcustomer(String username, String pass1, String pass2, String name, String studentid, int age,
            String phone, Date datejoined) throws SQLException;

    String addstaff(String username, String pass1, String pass2, String name, int salary, int age, String phone,
            Date datejoined) throws SQLException;

    List<String> staffearning() throws SQLException;

    List<String> staffrating() throws SQLException;

    List<String> staffbookingcount() throws SQLException;

    List<String> customerspend() throws SQLException;

    List<String> customerbookcount() throws SQLException;

    String approvecustomer(int id) throws SQLException;

    int staffavgrating(int id) throws SQLException;

}

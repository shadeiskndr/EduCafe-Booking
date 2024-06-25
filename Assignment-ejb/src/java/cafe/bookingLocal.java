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
public interface bookingLocal {

    void init(String jdbcURL, String jdbcUsername, String jdbcPassword);

    List<booking> listbooking(String username, String role, String search) throws SQLException;

    String addbooking(int quantity, String role, int userid, Date datebooking, int price, String food, String foodcategory) throws SQLException;

    String editbooking(int quantity, int bookingid, Date datebooking, int price, String food, String foodcategory) throws SQLException;

    void deletebooking(int id) throws SQLException;

    String ratebooking(int id, int rating, String comment) throws SQLException;

    void assignbooking(int staffid, int bookingid) throws SQLException;

    void changestatus(int bookingid, String status) throws SQLException;

    booking getbooking(int id) throws SQLException;

}

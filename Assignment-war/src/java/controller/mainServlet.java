/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import cafe.booking;
import cafe.bookingLocal;
import cafe.user;
import cafe.userLocal;
import jakarta.ejb.EJB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class mainServlet extends HttpServlet {

    @EJB
    private bookingLocal bookingdao;

    @EJB
    private userLocal userdao;

    private user nuser = null;

    public void init() {
        String jdbcURL = getServletContext().getInitParameter("jdbcURL");
        String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
        String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");

        System.out.println(jdbcURL);
        System.out.println(jdbcUsername);
        System.out.println(jdbcPassword);

        userdao.init(jdbcURL, jdbcUsername, jdbcPassword);
        bookingdao.init(jdbcURL, jdbcUsername, jdbcPassword);
    }

    protected void userlogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        HttpSession session = request.getSession();

        try {
            nuser = userdao.login(username, password, role);

            if (nuser != null) {
                session.setAttribute("username", username);
                session.setAttribute("userrole", role);
                session.setAttribute("userid", nuser.getId());
                session.setAttribute("name", nuser.getName());

                response.sendRedirect("/Assignment-war/");
            } else {
                request.setAttribute("error", "Wrong username/password or pending approve");
                request.getRequestDispatcher("error/error.jsp").forward(request, response);
            }

        } catch (SQLException ex) {
            Logger.getLogger(mainServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.getRequestDispatcher("error/error.jsp").forward(request, response);
        }
    }

    protected void deleteuser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String userrole = (String) session.getAttribute("userrole");
        if (!userrole.equals("manager")) {
            request.setAttribute("error", "No permission");
            request.getRequestDispatcher("error/error.jsp").forward(request, response);
        }

        int id = Integer.parseInt(request.getParameter("id"));
        String role = request.getParameter("role");

        try {
            String smth = userdao.deleteuser(id, role);

            try (PrintWriter out = response.getWriter()) {
                request.setAttribute("info", smth);
                request.setAttribute("url", "/Assignment-war/manageuser");
                if (smth.equals("User Deleted!")) {
                    request.setAttribute("infotype", "good");
                } else {
                    request.setAttribute("infotype", "bad");
                }
                request.getRequestDispatcher("notification.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(mainServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    protected void approvecustomer(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String userrole = (String) session.getAttribute("userrole");
        if (!userrole.equals("manager")) {
            request.setAttribute("error", "No permission");
            request.getRequestDispatcher("error/error.jsp").forward(request, response);
        }

        int id = Integer.parseInt(request.getParameter("id"));

        try {
            String smth = userdao.approvecustomer(id);

            try (PrintWriter out = response.getWriter()) {
                request.setAttribute("info", smth);
                request.setAttribute("url", "/Assignment-war/manageuser");
                if (smth.equals("Customer approved!")) {
                    request.setAttribute("infotype", "good");
                } else {
                    request.setAttribute("infotype", "bad");
                }
                request.getRequestDispatcher("notification.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(mainServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    protected void editprofile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String userrole = (String) session.getAttribute("userrole");
        int userid = Integer.parseInt(request.getParameter("userid"));
        String role = request.getParameter("role").toLowerCase();
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String phone = request.getParameter("phone");
        Date datejoined = Date.valueOf(request.getParameter("datejoined"));
        String ssalary = request.getParameter("salary");
        String studentid = request.getParameter("studentid");
        String oldpassword = request.getParameter("oldpass");
        String password1 = request.getParameter("pass1");
        String password2 = request.getParameter("pass2");
        String editor = request.getParameter("editor");

        int salary = 0;
        if (ssalary != null) {
            salary = Integer.parseInt(ssalary);
        }

        try {
            String smth = userdao.updateinfo(userid, role, name, age, phone, datejoined, salary, studentid);
            if (!oldpassword.equals("") && !password1.equals("") && !password2.equals("")) {
                smth = userdao.changepass(userid, oldpassword, password1, password2, role);
            }

            try (PrintWriter out = response.getWriter()) {
                request.setAttribute("info", smth);
                if (role.equals("manager")) {
                    request.setAttribute("url", "/Assignment-war/");
                } else {
                    if (editor.equals("manager")) {
                        request.setAttribute("url", "/Assignment-war/manageuser");
                    } else {
                        request.setAttribute("url", "/Assignment-war/");
                    }
                }
                if (smth.equals("Info Updated !")) {
                    request.setAttribute("infotype", "good");
                } else {
                    request.setAttribute("infotype", "bad");
                }
                request.getRequestDispatcher("notification.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(mainServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect("/Assignment-war/");
    }

    protected void createcustomeracc(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String pass1 = request.getParameter("pass1");
        String pass2 = request.getParameter("pass2");
        String name = request.getParameter("name");
        String studentid = request.getParameter("studentid");
        int age = 0;
        try {
            age = Integer.parseInt(request.getParameter("age"));
        } catch (NumberFormatException e) {

        }
        String phone = request.getParameter("phone");
        Date datejoined = null;
        try {
            datejoined = Date.valueOf(request.getParameter("datejoined"));
        } catch (IllegalArgumentException e) {

        }

        try {
            String smth = userdao.addcustomer(username, pass1, pass2, name, studentid, age, phone, datejoined);
            try (PrintWriter out = response.getWriter()) {
                request.setAttribute("info", smth);
                request.setAttribute("url", "login.jsp");
                if (smth.equals("New user created !")) {
                    request.setAttribute("infotype", "good");
                } else {
                    request.setAttribute("infotype", "bad");
                }
                request.getRequestDispatcher("notification.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(mainServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void createstaffacc(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String pass1 = request.getParameter("pass1");
        String pass2 = request.getParameter("pass2");
        String name = request.getParameter("name");
        int salary = 0;
        try {
            salary = Integer.parseInt(request.getParameter("salary"));
        } catch (NumberFormatException e) {

        }

        int age = 0;
        try {
            age = Integer.parseInt(request.getParameter("age"));
        } catch (NumberFormatException e) {

        }

        String phone = request.getParameter("phone");
        Date datejoined = null;
        try {
            datejoined = Date.valueOf(request.getParameter("datejoined"));
        } catch (IllegalArgumentException e) {

        }

        try {
            String smth = userdao.addstaff(username, pass1, pass2, name, salary, age, phone, datejoined);

            try (PrintWriter out = response.getWriter()) {
                request.setAttribute("info", smth);
                request.setAttribute("url", "/Assignment-war/manageuser");
                if (smth.equals("New staff created !")) {
                    request.setAttribute("infotype", "good");
                } else {
                    request.setAttribute("infotype", "bad");
                }
                request.getRequestDispatcher("notification.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(mainServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void generaterecipt(HttpServletRequest request, HttpServletResponse response, int id)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String userrole = (String) session.getAttribute("userrole");

        try {
            booking nbook = bookingdao.getbooking(id);

            try (PrintWriter out = response.getWriter()) {
                request.setAttribute("receiptid", nbook.getId());
                request.setAttribute("receiptdate", nbook.getDatebooking());
                request.setAttribute("receiptstaffname", nbook.getStaffname());
                request.setAttribute("receiptrating", nbook.getRating());
                request.setAttribute("receiptcomment", nbook.getComment());
                request.setAttribute("receiptfoodcategory", nbook.getFoodcategory());
                request.setAttribute("receiptfoodname", nbook.getFoodname());
                request.setAttribute("receiptquantity", nbook.getQuantity());
                request.setAttribute("receiptprice", nbook.getPrice());
                request.getRequestDispatcher("receipt.jsp").forward(request, response);
            }

        } catch (SQLException ex) {
            Logger.getLogger(mainServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void createbooking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Date datebooking = null;
        try {
            datebooking = Date.valueOf(request.getParameter("datebooking"));
        } catch (IllegalArgumentException e) {

        }

        int price = Integer.parseInt(request.getParameter("price"));
        String food = request.getParameter("food");
        String foodcategory = request.getParameter("foodcategory");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        String userrole = (String) session.getAttribute("userrole");
        int userid = (int) session.getAttribute("userid");

        try {
            String smth = bookingdao.addbooking(quantity, userrole, userid, datebooking, price, food, foodcategory);
            request.setAttribute("info", smth);
            request.setAttribute("url", "/Assignment-war/listbooking");
            if (smth.equals("Booking date cannot be empty !")) {
                request.setAttribute("infotype", "bad");
            } else {
                request.setAttribute("infotype", "good");
            }
            request.getRequestDispatcher("notification.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(mainServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    protected void editbooking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        int bookingid = Integer.parseInt(request.getParameter("bookingid"));
        Date datebooking = null;
        try {
            datebooking = Date.valueOf(request.getParameter("datebooking"));
        } catch (IllegalArgumentException e) {

        }
        System.out.println(request.getParameter("price"));
        int price = Integer.parseInt(request.getParameter("price"));
        String food = request.getParameter("food");
        String foodcategory = request.getParameter("foodcategory");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        String userrole = (String) session.getAttribute("userrole");
        int userid = (int) session.getAttribute("userid");

        try {
            String smth = bookingdao.editbooking(quantity, bookingid, datebooking, price, food, foodcategory);
            request.setAttribute("info", smth);
            request.setAttribute("url", "/Assignment-war/listbooking");
            if (smth.equals("Booking date cannot be empty !")) {
                request.setAttribute("infotype", "bad");
            } else {
                request.setAttribute("infotype", "good");
            }
            request.getRequestDispatcher("notification.jsp").forward(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(mainServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    protected void ratebooking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int bookingid = Integer.parseInt(request.getParameter("bookingid"));
        int rate = Integer.parseInt(request.getParameter("rate"));
        String comment = request.getParameter("comment");

        String userrole = (String) session.getAttribute("userrole");
        int userid = (int) session.getAttribute("userid");

        try {
            String smth = bookingdao.ratebooking(bookingid, rate, comment);
            request.setAttribute("info", smth);
            request.setAttribute("url", "/Assignment-war/listbooking");
            if (smth.equals("Successfully added rating !")) {
                request.setAttribute("infotype", "good");
            } else {
                request.setAttribute("infotype", "bad");
            }
            request.getRequestDispatcher("notification.jsp").forward(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(mainServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    protected void assignbooking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int bookingid = Integer.parseInt(request.getParameter("bookingid"));
        int staffid = Integer.parseInt(request.getParameter("staffid"));

        String userrole = (String) session.getAttribute("userrole");
        int userid = (int) session.getAttribute("userid");

        try {
            bookingdao.assignbooking(staffid, bookingid);

            response.sendRedirect("/Assignment-war/listbooking");

        } catch (SQLException ex) {
            Logger.getLogger(mainServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    protected void updatebookingstatus(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int bookingid = Integer.parseInt(request.getParameter("bookingid"));
        String status = request.getParameter("status");

        String userrole = (String) session.getAttribute("userrole");
        int userid = (int) session.getAttribute("userid");

        try {
            bookingdao.changestatus(bookingid, status);

            response.sendRedirect("/Assignment-war/listbooking");

        } catch (SQLException ex) {
            Logger.getLogger(mainServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        HttpSession session = request.getSession();

        int userid = 0;

        String userrole = (String) session.getAttribute("userrole");
        String username = (String) session.getAttribute("username");
        if (session.getAttribute("userid") != null) {
            userid = (int) session.getAttribute("userid");
        }

        // System.out.println(userrole);
        System.out.println(action);
        System.out.println("http get ----------- " + userrole);

        if (action.equals("/register")) {
            request.setAttribute("userrole", userrole);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else if (action.equals("/addstaff")) {
            request.setAttribute("userrole", userrole);
            request.getRequestDispatcher("addstaff.jsp").forward(request, response);
        } else if (userrole == null || action.equals("/login")) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if (action.equals("/")) {
            user nuser = null;

            try {
                if (userrole.equals("staff")) {
                    nuser = userdao.getstaff(userid);
                } else if (userrole.equals("customer")) {
                    nuser = userdao.getcustomer(userid);
                } else if (userrole.equals("manager")) {
                    nuser = userdao.getmanager(userid);
                }
            } catch (SQLException ex) {
                Logger.getLogger(mainServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("nuser", nuser);

            if (userrole.equals("manager")) {

                try {
                    List<String> earning = userdao.staffearning();
                    List<String> rating = userdao.staffrating();
                    List<String> staffbookingcount = userdao.staffbookingcount();
                    List<String> customerspend = userdao.customerspend();
                    List<String> customerbookcount = userdao.customerbookcount();

                    request.setAttribute("earning", earning);
                    request.setAttribute("rating", rating);
                    request.setAttribute("staffbookingcount", staffbookingcount);
                    request.setAttribute("customerspend", customerspend);
                    request.setAttribute("customerbookcount", customerbookcount);

                    request.getRequestDispatcher("manager.jsp").forward(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(mainServlet.class.getName()).log(Level.SEVERE, null, ex);
                }

            } else if (userrole.equals("staff")) {
                try {
                    int rating = userdao.staffavgrating(userid);

                    request.setAttribute("rating", rating);
                    request.getRequestDispatcher("staff.jsp").forward(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(mainServlet.class.getName()).log(Level.SEVERE, null, ex);
                }

            } else if (userrole.equals("customer")) {
                request.getRequestDispatcher("customer.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "no role");
                request.getRequestDispatcher("error/error.jsp").forward(request, response);
            }
        } else if (action.equals("/manager") && userrole.equals("manager")) {
            response.sendRedirect("/Assignment-war/");
        } else if (action.equals("/changepass")) {
            user nuser = null;

            try {
                if (userrole.equals("staff")) {
                    nuser = userdao.getstaff(userid);
                } else if (userrole.equals("customer")) {
                    nuser = userdao.getcustomer(userid);
                } else if (userrole.equals("manager")) {
                    nuser = userdao.getmanager(userid);
                }

                request.setAttribute("nuser", nuser);

                request.getRequestDispatcher("changepass.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(mainServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (action.equals("/createbooking")) {
            request.getRequestDispatcher("createbooking.jsp").forward(request, response);
        } else if (action.equals("/editbooking")) {

            try {
                int id = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("bookingid", id);
                booking nbooking = bookingdao.getbooking(id);
                request.setAttribute("nbooking", nbooking);
                request.getRequestDispatcher("editbooking.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(mainServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (action.equals("/ratebooking")) {
            int id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("bookingid", id);
            request.getRequestDispatcher("ratebooking.jsp").forward(request, response);
        } else if (action.equals("/updatebookingstatus")) {
            int id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("bookingid", id);
            request.getRequestDispatcher("updatebookingstatus.jsp").forward(request, response);
        } else if (action.equals("/assignbooking")) {

            try {
                int id = Integer.parseInt(request.getParameter("id"));
                List<user> liststaff = userdao.liststaff(null);
                request.setAttribute("bookingid", id);
                request.setAttribute("liststaff", liststaff);
                request.getRequestDispatcher("assignbooking.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(mainServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (action.equals("/manageuser") && userrole.equals("manager")) {
            try {
                String search = request.getParameter("search");

                List<user> liststaff = userdao.liststaff(search);
                List<user> listcustomer = userdao.listcustomer(search);
                request.setAttribute("liststaff", liststaff);
                request.setAttribute("listcustomer", listcustomer);

                // System.out.println(listuser.get(1));
                request.getRequestDispatcher("manageuser.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(mainServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (action.equals("/deleteuser")) {
            deleteuser(request, response);
        } else if (action.equals("/approvecustomer")) {
            approvecustomer(request, response);
        } else if (action.equals("/generaterecipt")) {
            int id = Integer.parseInt(request.getParameter("id"));
            generaterecipt(request, response, id);
        } else if (action.equals("/logout")) {
            logout(request, response);
        } else if (action.equals("/listbooking")) {
            try {
                String search = request.getParameter("search");

                List<booking> listbooking = bookingdao.listbooking(username, userrole, search);
                request.setAttribute("listbooking", listbooking);
                request.setAttribute("userrole", userrole);
                String status = request.getParameter("status");
                if (status == null) {
                    status = "new";
                }
                request.setAttribute("viewstatus", status);
                // System.out.println(listuser.get(1));
                request.getRequestDispatcher("listbooking.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(mainServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (action.equals("/editprofile")) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                String role = request.getParameter("role");
                String editor = request.getParameter("editor");
                user nuser = null;

                switch (role) {
                    case "staff":
                        nuser = userdao.getstaff(id);
                        break;
                    case "customer":
                        nuser = userdao.getcustomer(id);
                        break;
                    case "manager":
                        nuser = userdao.getmanager(id);
                        break;
                    default:
                        break;
                }

                request.setAttribute("nuser", nuser);
                request.setAttribute("editor", editor);
                request.getRequestDispatcher("editprofile.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(mainServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (action.equals("/deletebooking")) {
            int id = Integer.parseInt(request.getParameter("id"));
            try {
                bookingdao.deletebooking(id);
                response.sendRedirect("/Assignment-war/listbooking");
            } catch (SQLException ex) {
                Logger.getLogger(mainServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            // processRequest(request, response);
            request.setAttribute("error", "404 Page not found");
            request.getRequestDispatcher("error/error.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // System.out.println("process post");
        String action = request.getServletPath();
        // System.out.println(action);

        if (action.equals("/login")) {
            userlogin(request, response);
        } else if (action.equals("/editprofile")) {
            editprofile(request, response);
        } else if (action.equals("/register")) {
            createcustomeracc(request, response);
        } else if (action.equals("/addstaff")) {
            createstaffacc(request, response);
        } else if (action.equals("/createbooking")) {
            createbooking(request, response);
        } else if (action.equals("/editbooking")) {
            editbooking(request, response);
        } else if (action.equals("/ratebooking")) {
            ratebooking(request, response);
        } else if (action.equals("/assignbooking")) {
            assignbooking(request, response);
        } else if (action.equals("/updatebookingstatus")) {
            updatebookingstatus(request, response);
        } else {
            // processRequest(request, response);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

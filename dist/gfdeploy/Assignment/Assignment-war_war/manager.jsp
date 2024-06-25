<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Page | EduCafe Booking Web-App</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100">
        <div class="container mx-auto mt-10">
            <h1 class="text-4xl font-bold text-center mb-6">Manager Page!</h1>
            
            <div class="flex justify-center gap-4 mb-8">
                <a href="/Assignment-war/editprofile?id=${nuser.id}&role=${nuser.role}&editor=manager" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                    <button>Edit Profile</button>
                </a>
                <a href="/Assignment-war/manageuser" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">
                    <button>Manage Users</button>
                </a>
                <a href="/Assignment-war/listbooking" class="bg-yellow-500 hover:bg-yellow-700 text-white font-bold py-2 px-4 rounded">
                    <button>View Bookings</button>
                </a>
                <a href="/Assignment-war/logout" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">
                    <button>Logout</button>
                </a>
            </div>
            
            <div class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
                <h2 class="text-2xl font-semibold mb-4">Reports</h2>
                
                <div class="mb-6">
                    <h3 class="font-semibold mb-2">Staff Earnings</h3>
                    <c:forEach items="${earning}" var="post">
                        <p class="mb-1">${post}</p>
                    </c:forEach>
                </div>
                
                <div class="mb-6">
                    <h3 class="font-semibold mb-2">Staff Average Rating</h3>
                    <c:forEach items="${rating}" var="post">
                        <p class="mb-1">${post}</p>
                    </c:forEach>
                </div>
                
                <div class="mb-6">
                    <h3 class="font-semibold mb-2">Number of Staff Bookings</h3>
                    <c:forEach items="${staffbookingcount}" var="post">
                        <p class="mb-1">${post}</p>
                    </c:forEach>
                </div>
                
                <div class="mb-6">
                    <h3 class="font-semibold mb-2">Customer Spent</h3>
                    <c:forEach items="${customerspend}" var="post">
                        <p class="mb-1">${post}</p>
                    </c:forEach>
                </div>
                
                <div class="mb-6">
                    <h3 class="font-semibold mb-2">Customer Booking Count</h3>
                    <c:forEach items="${customerbookcount}" var="post">
                        <p class="mb-1">${post}</p>
                    </c:forEach>
                </div>
            </div>
        </div>
    </body>
</html>
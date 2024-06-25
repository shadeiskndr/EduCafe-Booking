<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Booking | EduCafe Booking Web-App</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100">
        <div class="container mx-auto mt-10 p-8 bg-white shadow-md rounded">
            <h1 class="text-2xl font-bold mb-6">Bookings!</h1>
            <div class="flex justify-between mb-6">
                <a href="/Assignment-war/" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Home</a>
                <c:if test="${userrole eq 'customer'}">
                    <a href="/Assignment-war/createbooking" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">Add Booking</a>
                </c:if>
            </div>
            <div class="flex space-x-4 mb-6">
                <a href="?status=new" class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded">Current Booking</a>
                <a href="?status=done" class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded">History Booking</a>
            </div>
            <div class="flex mb-6">
                <input class="form-control mr-sm-2 tbsearch border rounded py-2 px-4" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" onclick="searchbooking()">Search</button>
            </div>
            <table class="min-w-full table-auto">
                <thead class="bg-gray-200">
                    <tr>
                        <th class="px-4 py-2 border">ID</th>
                        <th class="px-4 py-2 border">Date</th>
                        <th class="px-4 py-2 border">Customer</th>
                        <th class="px-4 py-2 border">Staff</th>
                        <th class="px-4 py-2 border">Rating</th>
                        <th class="px-4 py-2 border">Comment</th>
                        <th class="px-4 py-2 border">Price</th>
                        <th class="px-4 py-2 border">Quantity</th>
                        <th class="px-4 py-2 border">Food Name</th>
                        <th class="px-4 py-2 border">Category</th>
                        <th class="px-4 py-2 border">Status</th>
                        <th class="px-4 py-2 border">Function</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listbooking}" var="post">
                        <c:if test="${(viewstatus == 'new' and (post.status == 'New' or post.status == 'On Going')) or (viewstatus == 'done' and post.status == 'Done')}">
                            <tr class="bg-white">
                                <td class="px-4 py-2 border">${post.id}</td>
                                <td class="px-4 py-2 border">${post.datebooking}</td>
                                <td class="px-4 py-2 border">${post.customername}</td>
                                <td class="px-4 py-2 border">${post.staffname}</td>
                                <td class="px-4 py-2 border">${post.rating}</td>
                                <td class="px-4 py-2 border">${post.comment}</td>
                                <td class="px-4 py-2 border">${post.price}</td>
                                <td class="px-4 py-2 border">${post.quantity}</td>
                                <td class="px-4 py-2 border">${post.foodcategory}</td>
                                <td class="px-4 py-2 border">${post.foodname}</td>
                                <td class="px-4 py-2 border">${post.status}</td>
                                <td class="px-4 py-2 border">
    <div class="space-y-1">
        <c:if test="${post.status != 'Done'}">
            <div>
                <a href="/Assignment-war/deletebooking?id=<c:out value='${post.id}' />" class="bg-red-500 hover:bg-red-700 text-white font-bold py-1 px-2 rounded block text-center">Delete</a>
            </div>
        </c:if>
        <c:if test="${post.status == 'New'}">
            <div>
                <a href="/Assignment-war/editbooking?id=<c:out value='${post.id}' />" class="bg-yellow-500 hover:bg-yellow-700 text-white font-bold py-1 px-2 rounded block text-center">Edit</a>
            </div>
        </c:if>
        <c:if test="${userrole eq 'customer'}">
            <c:if test="${post.status eq 'Done'}">
                <div>
                    <a href="/Assignment-war/ratebooking?id=<c:out value='${post.id}' />" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-1 px-2 rounded block text-center">Rate</a>
                </div>
            </c:if>
        </c:if>
        <c:if test="${userrole eq 'staff'}">
            <div>
                <a href="/Assignment-war/updatebookingstatus?id=<c:out value='${post.id}' />" class="bg-green-500 hover:bg-green-700 text-white font-bold py-1 px-2 rounded block text-center">Update Status</a>
            </div>
        </c:if>
        <c:if test="${userrole eq 'manager'}">
            <c:if test="${post.status != 'Done'}">
                <div>
                    <a href="/Assignment-war/assignbooking?id=<c:out value='${post.id}' />" class="bg-purple-500 hover:bg-purple-700 text-white font-bold py-1 px-2 rounded block text-center">Assign Booking</a>
                </div>
            </c:if>
            <div>
                <a href="/Assignment-war/generaterecipt?id=<c:out value='${post.id}' />" class="bg-indigo-500 hover:bg-indigo-700 text-white font-bold py-1 px-2 rounded block text-center">Generate Receipt</a>
            </div>
        </c:if>
    </div>
</td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
            function searchbooking() {
                console.log('search booking');
                var search = $('.tbsearch').val();
                console.log(search);
                window.location.replace("/Assignment-war/listbooking?search=" + search);
            }
        </script>
    </body>
</html>






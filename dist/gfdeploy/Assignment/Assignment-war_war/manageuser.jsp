<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage User | EduCafe Booking Web-App</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100 p-8">
        <h1 class="text-3xl font-bold mb-4">Manage User!</h1>
        <div class="flex space-x-2 mb-4">
            <a href="/Assignment-war/manager" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Home</a>
            <a href="/Assignment-war/addstaff" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">Add Staff</a>
            <a href="/Assignment-war/logout" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">Logout</a>
        </div>

        <div class="flex mb-4">
            <input class="form-control mr-sm-2 tbsearch shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0 ml-2 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" onclick="searchuser()">Search</button>
        </div>

        <h3 class="text-xl font-semibold mb-2">Staff</h3>
        <table class="table-auto w-full mb-8">
            <thead>
                <tr class="bg-gray-200">
                    <th class="px-4 py-2">ID</th>
                    <th class="px-4 py-2">Username</th>
                    <th class="px-4 py-2">Name</th>
                    <th class="px-4 py-2">Age</th>
                    <th class="px-4 py-2">Phone</th>
                    <th class="px-4 py-2">Joined Date</th>
                    <th class="px-4 py-2">Salary</th>
                    <th class="px-4 py-2">Function</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${liststaff}" var="post">
                    <tr class="hover:bg-gray-100">
                        <td class="border px-4 py-2">${post.id}</td>
                        <td class="border px-4 py-2">${post.username}</td>
                        <td class="border px-4 py-2">${post.name}</td>
                        <td class="border px-4 py-2">${post.age}</td>
                        <td class="border px-4 py-2">${post.phone}</td>
                        <td class="border px-4 py-2">${post.datejoined}</td>
                        <td class="border px-4 py-2">RM ${post.salary}</td>
                        <td class="border px-4 py-2">
                            <a href="/Assignment-war/editprofile?role=staff&id=${post.id}&editor=manager" class="text-blue-600 hover:text-blue-800">Update Info</a>  
                            |
                            <a href="/Assignment-war/deleteuser?role=staff&id=${post.id}" class="text-red-600 hover:text-red-800">Delete</a>    
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <h3 class="text-xl font-semibold mb-2">Customer</h3>
        <table class="table-auto w-full">
            <thead>
                <tr class="bg-gray-200">
                    <th class="px-4 py-2">ID</th>
                    <th class="px-4 py-2">Username</th>
                    <th class="px-4 py-2">Name</th>
                    <th class="px-4 py-2">Student ID</th>
                    <th class="px-4 py-2">Age</th>
                    <th class="px-4 py-2">Phone</th>
                    <th class="px-4 py-2">Status</th>
                    <th class="px-4 py-2">Joined Date</th>
                    <th class="px-4 py-2">Function</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listcustomer}" var="post">
                    <tr class="hover:bg-gray-100">
                        <td class="border px-4 py-2">${post.id}</td>
                        <td class="border px-4 py-2">${post.username}</td>
                        <td class="border px-4 py-2">${post.name}</td>
                        <td class="border px-4 py-2">${post.studentid}</td>
                        <td class="border px-4 py-2">${post.age}</td>
                        <td class="border px-4 py-2">${post.phone}</td>
                        <td class="border px-4 py-2">${post.status}</td>
                        <td class="border px-4 py-2">${post.datejoined}</td>
                        <td class="border px-4 py-2">
                            <a href="/Assignment-war/editprofile?role=customer&id=${post.id}&editor=manager" class="text-blue-600 hover:text-blue-800">Update Info</a>  
                            |
                            <a href="/Assignment-war/deleteuser?role=customer&id=${post.id}" class="text-red-600 hover:text-red-800">Delete</a>    
                            |
                            <a href="/Assignment-war/approvecustomer?id=${post.id}" class="text-green-600 hover:text-green-800">Approve</a>    
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
            function searchuser() {
                console.log('search user')
                var search = $('.tbsearch').val()
                console.log(search)

                //if (search == '') return;

                window.location.replace("/Assignment-war/manageuser?search=" + search);
            }
        </script>
    </body>
</html>
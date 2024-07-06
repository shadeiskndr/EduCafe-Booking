<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage User | EduCafe Booking Web-App</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://kit.fontawesome.com/f419ce4a58.js" crossorigin="anonymous"></script>
        <style>
            .dark-mode {
                background-color: #1a202c;
                color: #cbd5e0;
            }
            .dark-mode .bg-white {
                background-color: #2d3748;
            }
            .dark-mode .text-gray-700 {
                color: #a0aec0;
            }
            .dark-mode .bg-gray-100 {
                background-color: #2d3748ec;
            }
            .dark-mode .bg-gray-200 {
                background-color: #4a5568;
            }
            .dark-mode .bg-gray-500 {
                background-color: #4a5568;
            }
            .dark-mode .hover\:bg-gray-700:hover {
                background-color: #2d3748;
            }
        </style>
    </head>
    <body class="bg-gray-100">
        <div class="flex">
            <!-- Sidebar -->
            <div class="w-72 h-screen bg-white shadow-md flex flex-col">
                <div class="p-4">
                    <h1 class="text-2xl font-bold mb-4"><i class="fa-solid fa-mug-saucer text-2xl mb-4 mr-2"></i>EduCafe Booking</h1>
                    <div class="space-y-2">
                        <a href="/Assignment-war/" class="flex items-center bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                            <i class="fas fa-home mr-2"></i>
                            Home
                        </a>
                        <a href="/Assignment-war/manageuser" class="flex items-center bg-yellow-500 hover:bg-yellow-700 text-white font-bold py-2 px-4 rounded">
                            <i class="fas fa-users-cog mr-2"></i>
                            Manage Users
                        </a>
                        <a href="/Assignment-war/listbooking" class="flex items-center bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">
                            <i class="fas fa-calendar-check mr-2"></i>
                            Check Bookings
                        </a>
                        <!-- Dark Mode Toggle Button -->
                        <button id="dark-mode-toggle" class="flex items-center bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded">
                            <i class="fas fa-moon mr-2"></i>
                            Toggle Dark Mode
                        </button>
                    </div>
                </div>
            </div>
            <!-- Main Content -->
            <div class="flex-1 p-10 bg-gray-100">
                <div class="bg-white shadow-md rounded p-8">
                    <h1 class="text-2xl font-bold mb-6">Manage Users Page</h1>

                    <div class="flex mb-4">
                        <input class="form-control mr-sm-2 tbsearch border rounded py-4 px-4" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0 ml-2 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded flex items-center" onclick="searchuser()">
                            <i class="fas fa-search mr-2"></i>
                            Search
                        </button>
                        <a href="/Assignment-war/addstaff" class="btn btn-outline-success my-2 my-sm-0 ml-2 bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded flex items-center">
                            <i class="fas fa-user-plus mr-2"></i>
                            Add Staff
                        </a>
                    </div>

                    <h3 class="text-xl font-semibold mb-2">Staff</h3>
                    <div class="overflow-x-auto">
                        <table class="min-w-full table-auto">
                            <thead class="bg-gray-200">
                                <tr>
                                    <th class="px-4 py-2 border"><i class="fas fa-id-badge mr-2"></i>ID</th>
                                    <th class="px-4 py-2 border"><i class="fas fa-user mr-2"></i>Username</th>
                                    <th class="px-4 py-2 border"><i class="fas fa-user-tag mr-2"></i>Name</th>
                                    <th class="px-4 py-2 border"><i class="fas fa-birthday-cake mr-2"></i>Age</th>
                                    <th class="px-4 py-2 border"><i class="fas fa-phone mr-2"></i>Phone</th>
                                    <th class="px-4 py-2 border"><i class="fas fa-calendar-alt mr-2"></i>Joined Date</th>
                                    <th class="px-4 py-2 border"><i class="fas fa-dollar-sign mr-2"></i>Salary</th>
                                    <th class="px-4 py-2 border"><i class="fas fa-cogs mr-2"></i>Function</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${liststaff}" var="post">
                                    <tr class="bg-white hover:bg-gray-100">
                                        <td class="px-4 py-2 border">${post.id}</td>
                                        <td class="px-4 py-2 border">${post.username}</td>
                                        <td class="px-4 py-2 border">${post.name}</td>
                                        <td class="px-4 py-2 border">${post.age}</td>
                                        <td class="px-4 py-2 border">${post.phone}</td>
                                        <td class="px-4 py-2 border">${post.datejoined}</td>
                                        <td class="px-4 py-2 border">RM ${post.salary}</td>
                                        <td class="px-4 py-2 border">
                                            <a href="/Assignment-war/editprofile?role=staff&id=${post.id}&editor=manager" class="text-blue-600 hover:text-blue-800">Update Info</a>  
                                            |
                                            <a href="/Assignment-war/deleteuser?role=staff&id=${post.id}" class="text-red-600 hover:text-red-800">Delete</a>    
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <h3 class="text-xl font-semibold mb-2 mt-6">Customer</h3>
                    <div class="overflow-x-auto">
                        <table class="min-w-full table-auto">
                            <thead class="bg-gray-200">
                                <tr>
                                    <th class="px-4 py-2 border"><i class="fas fa-id-badge mr-2"></i>ID</th>
                                    <th class="px-4 py-2 border"><i class="fas fa-user mr-2"></i>Username</th>
                                    <th class="px-4 py-2 border"><i class="fas fa-user-tag mr-2"></i>Name</th>
                                    <th class="px-4 py-2 border"><i class="fas fa-id-card mr-2"></i>Student ID</th>
                                    <th class="px-4 py-2 border"><i class="fas fa-birthday-cake mr-2"></i>Age</th>
                                    <th class="px-4 py-2 border"><i class="fas fa-phone mr-2"></i>Phone</th>
                                    <th class="px-4 py-2 border"><i class="fas fa-info-circle mr-2"></i>Status</th>
                                    <th class="px-4 py-2 border"><i class="fas fa-calendar-alt mr-2"></i>Joined Date</th>
                                    <th class="px-4 py-2 border"><i class="fas fa-cogs mr-2"></i>Function</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listcustomer}" var="post">
                                    <tr class="bg-white hover:bg-gray-100">
                                        <td class="px-4 py-2 border">${post.id}</td>
                                        <td class="px-4 py-2 border">${post.username}</td>
                                        <td class="px-4 py-2 border">${post.name}</td>
                                        <td class="px-4 py-2 border">${post.studentid}</td>
                                        <td class="px-4 py-2 border">${post.age}</td>
                                        <td class="px-4 py-2 border">${post.phone}</td>
                                        <td class="px-4 py-2 border">${post.status}</td>
                                        <td class="px-4 py-2 border">${post.datejoined}</td>
                                        <td class="px-4 py-2 border">
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
                    </div>
                </div>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
            function searchuser() {
                console.log('search user');
                var search = $('.tbsearch').val();
                console.log(search);
                window.location.replace("/Assignment-war/manageuser?search=" + search);
            }
        </script>
        <script>
            document.getElementById('dark-mode-toggle').addEventListener('click', function() {
                document.body.classList.toggle('dark-mode');
            });
        </script>
    </body>
</html>

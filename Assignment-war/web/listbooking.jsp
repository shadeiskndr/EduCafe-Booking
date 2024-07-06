<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Booking | EduCafe Booking Web-App</title>
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
                    <h1 class="text-2xl font-bold mb-6">Check Bookings Page</h1>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 mb-6">
                        <a href="?status=new" class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded flex items-center justify-center">
                            <i class="fas fa-calendar-day mr-2"></i>
                            Current Booking
                        </a>
                        <a href="?status=done" class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded flex items-center justify-center">
                            <i class="fas fa-history mr-2"></i>
                            History Booking
                        </a>
                        <c:if test="${userrole eq 'customer'}">
                            <a href="/Assignment-war/createbooking" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded flex items-center justify-center">
                                <i class="fas fa-plus mr-2"></i>
                                Add Booking
                            </a>
                        </c:if>
                    </div>
                    <div class="flex mb-6">
                        <input class="form-control mr-sm-2 tbsearch border rounded py-4 px-4" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0 ml-2 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded flex items-center" onclick="searchbooking()">
                            <i class="fas fa-search mr-2"></i>
                            Search
                        </button>
                    </div>
                    <div class="overflow-x-auto">
                        <table class="min-w-full table-auto">
                            <thead class="bg-gray-200">
                                <tr>
                                    <th class="px-4 py-2 border"><i class="fas fa-id-badge mr-2"></i>ID</th>
                                    <th class="px-4 py-2 border"><i class="fas fa-calendar-alt mr-2"></i>Date</th>
                                    <th class="px-4 py-2 border"><i class="fas fa-user mr-2"></i>Customer</th>
                                    <th class="px-4 py-2 border"><i class="fas fa-user-tie mr-2"></i>Staff</th>
                                    <th class="px-4 py-2 border"><i class="fas fa-star mr-2"></i>Rating</th>
                                    <th class="px-4 py-2 border"><i class="fas fa-comment mr-2"></i>Comment</th>
                                    <th class="px-4 py-2 border"><i class="fas fa-dollar-sign mr-2"></i>Price</th>
                                    <th class="px-4 py-2 border"><i class="fas fa-sort-numeric-up mr-2"></i>Quantity</th>
                                    <th class="px-4 py-2 border"><i class="fas fa-utensils mr-2"></i>Food Name</th>
                                    <th class="px-4 py-2 border"><i class="fas fa-tags mr-2"></i>Category</th>
                                    <th class="px-4 py-2 border"><i class="fas fa-info-circle mr-2"></i>Status</th>
                                    <th class="px-4 py-2 border"><i class="fas fa-cogs mr-2"></i>Function</th>
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
                                                            <a href="/Assignment-war/deletebooking?id=<c:out value='${post.id}' />" class="bg-red-500 hover:bg-red-700 text-white font-bold py-1 px-2 rounded block text-center">
                                                                <i class="fas fa-trash-alt mr-1"></i>
                                                                Delete
                                                            </a>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${post.status == 'New'}">
                                                        <div>
                                                            <a href="/Assignment-war/editbooking?id=<c:out value='${post.id}' />" class="bg-yellow-500 hover:bg-yellow-700 text-white font-bold py-1 px-2 rounded block text-center">
                                                                <i class="fas fa-edit mr-1"></i>
                                                                Edit
                                                            </a>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${userrole eq 'customer'}">
                                                        <c:if test="${post.status eq 'Done'}">
                                                            <div>
                                                                <a href="/Assignment-war/ratebooking?id=<c:out value='${post.id}' />" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-1 px-2 rounded block text-center">
                                                                    <i class="fas fa-star mr-1"></i>
                                                                    Rate
                                                                </a>
                                                            </div>
                                                        </c:if>
                                                    </c:if>
                                                    <c:if test="${userrole eq 'staff'}">
                                                        <div>
                                                            <a href="/Assignment-war/updatebookingstatus?id=<c:out value='${post.id}' />" class="bg-green-500 hover:bg-green-700 text-white font-bold py-1 px-2 rounded block text-center">
                                                                <i class="fas fa-sync-alt mr-1"></i>
                                                                Update Status
                                                            </a>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${userrole eq 'manager'}">
                                                        <c:if test="${post.status != 'Done'}">
                                                            <div>
                                                                <a href="/Assignment-war/assignbooking?id=<c:out value='${post.id}' />" class="bg-purple-500 hover:bg-purple-700 text-white font-bold py-1 px-2 rounded block text-center">
                                                                    <i class="fas fa-user-plus mr-1"></i>
                                                                    Assign Booking
                                                                </a>
                                                            </div>
                                                        </c:if>
                                                        <div>
                                                            <a href="/Assignment-war/generaterecipt?id=<c:out value='${post.id}' />" class="bg-indigo-500 hover:bg-indigo-700 text-white font-bold py-1 px-2 rounded block text-center">
                                                                <i class="fas fa-receipt mr-1"></i>
                                                                Generate Receipt
                                                            </a>
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
                </div>
            </div>
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
        <script>
            document.getElementById('dark-mode-toggle').addEventListener('click', function() {
                document.body.classList.toggle('dark-mode');
            });
        </script>
    </body>
</html>

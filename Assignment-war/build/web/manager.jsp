<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Page | EduCafe Booking Web-App</title>
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
            .dark-mode .bg-gray-500 {
                background-color: #4a5568;
            }
            .dark-mode .hover\:bg-gray-700:hover {
                background-color: #2d3748;
            }
            .dark-mode .bg-blue-100,
            .dark-mode .bg-green-100,
            .dark-mode .bg-yellow-100,
            .dark-mode .bg-purple-100,
            .dark-mode .bg-pink-100 {
                background-color: #4a5568;
                color: #e2e8f0;
            }
        </style>
    </head>
    <body class="bg-gray-100 flex">
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
                    <a href="/Assignment-war/editprofile?id=${nuser.id}&role=${nuser.role}&editor=manager" class="flex items-center bg-purple-500 hover:bg-purple-700 text-white font-bold py-2 px-4 rounded">
                        <i class="fas fa-user-edit mr-2"></i>
                        Edit Profile
                    </a>
                    <a href="/Assignment-war/logout" class="flex items-center bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">
                        <i class="fas fa-sign-out-alt mr-2"></i>
                        Logout
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
            <div class="container mx-auto mt-10">
                <h1 class="text-4xl font-bold text-center mb-6">Manager Page</h1>
                
                <div class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
                    <h2 class="text-2xl font-semibold mb-4">Reports</h2>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                        <div class="bg-blue-100 p-4 rounded-lg shadow">
                            <h3 class="font-semibold mb-2">Staff Earnings</h3>
                            <ul class="list-disc list-inside">
                                <c:forEach items="${earning}" var="post">
                                    <li>${post}</li>
                                </c:forEach>
                            </ul>
                        </div>
                        
                        <div class="bg-green-100 p-4 rounded-lg shadow">
                            <h3 class="font-semibold mb-2">Staff Average Rating</h3>
                            <ul class="list-disc list-inside">
                                <c:forEach items="${rating}" var="post">
                                    <li>${post}</li>
                                </c:forEach>
                            </ul>
                        </div>
                        
                        <div class="bg-yellow-100 p-4 rounded-lg shadow">
                            <h3 class="font-semibold mb-2">Number of Staff Bookings</h3>
                            <ul class="list-disc list-inside">
                                <c:forEach items="${staffbookingcount}" var="post">
                                    <li>${post}</li>
                                </c:forEach>
                            </ul>
                        </div>
                        
                        <div class="bg-purple-100 p-4 rounded-lg shadow">
                            <h3 class="font-semibold mb-2">Customer Spent</h3>
                            <ul class="list-disc list-inside">
                                <c:forEach items="${customerspend}" var="post">
                                    <li>${post}</li>
                                </c:forEach>
                            </ul>
                        </div>
                        
                        <div class="bg-pink-100 p-4 rounded-lg shadow">
                            <h3 class="font-semibold mb-2">Customer Booking Count</h3>
                            <ul class="list-disc list-inside">
                                <c:forEach items="${customerbookcount}" var="post">
                                    <li>${post}</li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            document.getElementById('dark-mode-toggle').addEventListener('click', function() {
                document.body.classList.toggle('dark-mode');
            });
        </script>
    </body>
</html>

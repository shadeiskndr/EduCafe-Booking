<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Staff | EduCafe Booking Web-App</title>
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
            .dark-mode .shadow-md {
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
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
                <h1 class="text-2xl font-bold text-center my-6">New Staff Account</h1>
                <div class="max-w-2xl mx-auto bg-white p-8 rounded-lg shadow-md">
                    <form class="space-y-4" method="POST" action="/Assignment-war/addstaff">
                        <div>
                            <label for="username" class="block text-sm font-medium text-gray-700"><i class="fas fa-user mr-2"></i>Username</label>
                            <input type="text" name="username" id="username" class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md"/>
                        </div>
                        <div>
                            <label for="pass1" class="block text-sm font-medium text-gray-700"><i class="fas fa-lock mr-2"></i>New Password</label>
                            <input type="password" name="pass1" id="pass1" class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md"/>
                        </div>
                        <div>
                            <label for="pass2" class="block text-sm font-medium text-gray-700"><i class="fas fa-lock mr-2"></i>Confirm New Password</label>
                            <input type="password" name="pass2" id="pass2" class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md"/>
                        </div>
                        <div>
                            <label for="name" class="block text-sm font-medium text-gray-700"><i class="fas fa-user-tag mr-2"></i>Name</label>
                            <input type="text" name="name" id="name" class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md"/>
                        </div>
                        <div>
                            <label for="age" class="block text-sm font-medium text-gray-700"><i class="fas fa-birthday-cake mr-2"></i>Age</label>
                            <input type="text" name="age" id="age" class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md"/>
                        </div>
                        <div>
                            <label for="phone" class="block text-sm font-medium text-gray-700"><i class="fas fa-phone mr-2"></i>Phone Number</label>
                            <input type="text" name="phone" id="phone" class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md"/>
                        </div>
                        <div>
                            <label for="salary" class="block text-sm font-medium text-gray-700"><i class="fas fa-dollar-sign mr-2"></i>Salary</label>
                            <input type="text" name="salary" id="salary" class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md"/>
                        </div>
                        <div>
                            <label for="datejoined" class="block text-sm font-medium text-gray-700"><i class="fas fa-calendar-alt mr-2"></i>Date Joined</label>
                            <input type="date" name="datejoined" id="datejoined" class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md"/>
                        </div>
                        <div class="flex items-center justify-between">
                            <button type="submit" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                                <i class="fas fa-plus-circle mr-2"></i>Create Account
                            </button>
                        </div>
                    </form>
                    <a href="/Assignment-war/manageuser">
                        <button class="mt-4 bg-gray-200 px-4 py-2 rounded-md hover:bg-gray-300">
                            <i class="fas fa-arrow-left mr-2"></i>Back
                        </button>
                    </a>
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

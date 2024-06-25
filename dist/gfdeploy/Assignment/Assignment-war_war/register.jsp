<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page | EduCafe Booking Web-App</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100">
        <div class="container mx-auto p-4 min-h-screen flex items-center justify-center">
            <div class="w-full max-w-md mx-auto bg-white p-8 border border-gray-200 rounded-lg shadow-lg">
                <h1 class="text-3xl font-bold text-center text-gray-700 mb-6">Register</h1>
                <form class="space-y-4" method="POST" action="/Assignment-war/register">
                    <div>
                        <label class="block text-sm font-medium text-gray-700" for="username">Username</label>
                        <input
                            id="username"
                            type="text"
                            name="username"
                            class="mt-1 px-4 py-2 w-full rounded-md border border-gray-300 shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-200 focus:ring-opacity-50"
                            placeholder="Username"
                            required
                        />
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700" for="pass1">New Password</label>
                        <input
                            id="pass1"
                            type="password"
                            name="pass1"
                            class="mt-1 px-4 py-2 w-full rounded-md border border-gray-300 shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-200 focus:ring-opacity-50"
                            placeholder="New Password"
                            required
                        />
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700" for="pass2">Confirm New Password</label>
                        <input
                            id="pass2"
                            type="password"
                            name="pass2"
                            class="mt-1 px-4 py-2 w-full rounded-md border border-gray-300 shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-200 focus:ring-opacity-50"
                            placeholder="Confirm New Password"
                            required
                        />
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700" for="name">Name</label>
                        <input
                            id="name"
                            type="text"
                            name="name"
                            class="mt-1 px-4 py-2 w-full rounded-md border border-gray-300 shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-200 focus:ring-opacity-50"
                            placeholder="Name"
                            required
                        />
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700" for="studentid">Student ID</label>
                        <input
                            id="studentid"
                            type="text"
                            name="studentid"
                            class="mt-1 px-4 py-2 w-full rounded-md border border-gray-300 shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-200 focus:ring-opacity-50"
                            placeholder="Student ID"
                            required
                        />
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700" for="age">Age</label>
                        <input
                            id="age"
                            type="text"
                            name="age"
                            class="mt-1 px-4 py-2 w-full rounded-md border border-gray-300 shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-200 focus:ring-opacity-50"
                            placeholder="Age"
                            required
                        />
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700" for="phone">Phone Number</label>
                        <input
                            id="phone"
                            type="text"
                            name="phone"
                            class="mt-1 px-4 py-2 w-full rounded-md border border-gray-300 shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-200 focus:ring-opacity-50"
                            placeholder="Phone Number"
                            required
                            />
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700" for="datejoined">Date Joined</label>
                            <input
                                id="datejoined"
                                type="date"
                                name="datejoined"
                                class="mt-1 px-4 py-2 w-full rounded-md border border-gray-300 shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-200 focus:ring-opacity-50"
                                required
                            />
                        </div>
                        <div>
                            <button
                                type="submit"
                                class="w-full px-4 py-2 bg-blue-600 text-white font-bold uppercase rounded-md hover:bg-blue-700 focus:outline-none focus:bg-blue-700 focus:shadow-outline active:bg-blue-800 transition duration-150 ease-in-out"
                            >
                                Register
                            </button>
                        </div>
                    </form>
                    <div class="mt-6 text-center">
                        <p class="text-sm font-light text-gray-600">
                            Already registered? <a href="/Assignment-war/login.jsp" class="font-medium text-blue-600 hover:text-blue-700 transition duration-150 ease-in-out">Sign in now</a>
                        </p>
                    </div>
                </div>
            </div>
        </body>
    </html>

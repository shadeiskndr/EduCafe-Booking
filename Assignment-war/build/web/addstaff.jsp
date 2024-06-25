
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Staff | EduCafe Booking Web-App</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <div class="container mx-auto p-4 bg-white">
            <div class="w-full md:w-1/2 lg:w-1/3 mx-auto my-12">
                <h1 class="text-2xl font-bold">New Staff Account</h1>
                <form class="flex flex-col mt-4" method="POST" action="/Assignment-war/addstaff">
                    <input
                        type="text"
                        name="username"
                        class="px-4 py-3 mt-4 w-full rounded  border border-gray-300 text-sm"
                        placeholder="Username"
                        />
                    <input
                        type="password"
                        name="pass1"
                        class="px-4 py-3 mt-4 w-full rounded  border border-gray-300 text-sm"
                        placeholder="New Password"
                        />
                    <input
                        type="password"
                        name="pass2"
                        class="px-4 py-3 mt-4 w-full rounded  border border-gray-300 text-sm"
                        placeholder="Confirm New Password"
                        />
                    <input
                        type="text"
                        name="name"
                        class="px-4 py-3 mt-4 w-full rounded  border border-gray-300 text-sm"
                        placeholder="Name"
                        />
                    <input
                        type="text"
                        name="age"
                        class="px-4 py-3 mt-4 w-full rounded  border border-gray-300 text-sm"
                        placeholder="Age"
                        />
                    <input
                        type="text"
                        name="phone"
                        class="px-4 py-3 mt-4 w-full rounded  border border-gray-300 text-sm"
                        placeholder="Phone Number"
                        />
                    <input
                        type="text"
                        name="salary"
                        class="px-4 py-3 mt-4 w-full rounded  border border-gray-300 text-sm"
                        placeholder="Salary"
                        />
                    <input
                        type="date"
                        name="datejoined"
                        class="px-4 py-3 mt-4 w-full rounded  border border-gray-300 text-sm"
                        />
                    <button
                        type="submit"
                        class="px-7 py-3 mt-4 bg-blue-600 text-white font-medium uppercase rounded hover:bg-blue-700 hover:shadow-lg active:bg-blue-800 active:shadow-lg transition w-full"
                        >
                        Create Account
                    </button>
                </form>
                <a
                    class="px-7 py-3 mt-4 text-white font-medium uppercase rounded hover:shadow-lg active:shadow-lg transition w-full flex justify-center "
                    style="background-color: #3b5998"
                    href="/Assignment-war/manageuser"
                    role="button"
                    >
                    Back
                </a>
            </div>
        </div>
    </body>
</html>



<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assign Booking | EduCafe Booking Web-App</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100">
        <div class="container mx-auto mt-10">
            <div class="bg-white p-8 rounded-lg shadow-md">
                <h1 class="text-xl font-bold mb-4">Assign Booking!</h1>
                <form method="POST" action="/Assignment-war/assignbooking">
                    <table class="w-full">
                        <input type="hidden" name="bookingid" value="${bookingid}"/>
                        <tr>
                            <td class="text-right pr-4 py-2">Staff</td>
                            <td>
                                <select name="staffid" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
                                    <c:forEach items="${liststaff}" var="staff">
                                        <option value="${staff.id}">${staff.username} - ${staff.name}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-center py-4">
                                <input type="submit" value="Assign" class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-700 cursor-pointer">
                            </td>
                        </tr>
                    </table>
                </form>
                <div class="text-center">
                    <a href="/Assignment-war/listbooking" class="inline-block mt-4">
                        <button class="px-4 py-2 bg-gray-300 text-gray-700 rounded hover:bg-gray-400">
                            Back
                        </button>
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>

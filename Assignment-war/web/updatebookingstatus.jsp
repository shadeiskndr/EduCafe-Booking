

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Status | EduCafe Booking Web-App</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100">
        <div class="container mx-auto mt-10">
            <div class="max-w-md mx-auto bg-white p-8 border border-gray-300">
                <h1 class="text-xl font-bold mb-4">Update Booking Status!</h1>
                <form method="POST" action="/Assignment-war/updatebookingstatus" class="space-y-4">
                    <input type="hidden" name="bookingid" value="${bookingid}"/>
                    <div>
                        <label for="status" class="block text-sm font-medium text-gray-700">Status</label>
                        <select name="status" id="status" class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md">
                            <option>New</option>
                            <option>On Going</option>
                            <option>Done</option>
                        </select>
                    </div>
                    <div class="flex justify-center">
                        <input type="submit" value="Update" class="px-4 py-2 bg-indigo-600 text-white rounded-md hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-opacity-50 cursor-pointer">
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rating | EduCafe Booking Web-App</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100">
        <div class="container mx-auto mt-10">
            <div class="max-w-md mx-auto bg-white p-8 border border-gray-300">
                <h1 class="text-xl font-bold mb-4">Review Booking!</h1>
                <form method="POST" action="/Assignment-war/ratebooking" class="space-y-4">
                    <input type="hidden" name="bookingid" value="${bookingid}"/>
                    <div>
                        <label for="rate" class="block text-sm font-medium text-gray-700">Rating</label>
                        <select name="rate" id="rate" class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                            <option>10</option>
                        </select>
                    </div>
                    <div>
                        <label for="comment" class="block text-sm font-medium text-gray-700">Comment</label>
                        <textarea id="comment" rows="3" name="comment" class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"></textarea>
                    </div>
                    <div class="flex justify-center">
                        <input type="submit" value="Add Review" class="px-4 py-2 bg-indigo-600 text-white rounded-md hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-opacity-50 cursor-pointer">
                    </div>
                </form>
                <div class="mt-4 flex justify-center">
                    <a href="/Assignment-war/listbooking" class="inline-block px-4 py-2 border border-transparent text-base font-medium rounded-md text-indigo-600 bg-transparent hover:bg-gray-100">
                        Back
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rating | EduCafe Booking Web-App</title>
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
                <h1 class="text-2xl font-bold text-center mb-4">Review Booking Page</h1>

                <div class="max-w-lg mx-auto p-6 bg-white rounded-lg shadow-md">
                    <form method="POST" action="/Assignment-war/ratebooking" class="space-y-4">
                        <input type="hidden" name="bookingid" value="${bookingid}"/>
                        <div>
                            <label for="rate" class="block text-sm font-medium text-gray-700"><i class="fas fa-star mr-2"></i>Rating</label>
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
                            <label for="comment" class="block text-sm font-medium text-gray-700"><i class="fas fa-comment mr-2"></i>Comment</label>
                            <textarea id="comment" rows="3" name="comment" class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"></textarea>
                        </div>
                        <div class="flex justify-center">
                            <button type="submit" class="px-4 py-2 bg-indigo-600 text-white rounded-md hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-opacity-50">
                                <i class="fas fa-save mr-2"></i>Add Review
                            </button>
                        </div>
                    </form>
                    <div class="mt-4 flex justify-center">
                        <a href="/Assignment-war/listbooking" class="inline-block px-4 py-2 border border-transparent text-base font-medium rounded-md text-indigo-600 bg-transparent hover:bg-gray-100">
                            <i class="fas fa-arrow-left mr-2"></i>Back
                        </a>
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

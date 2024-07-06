<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>New Booking | EduCafe Booking Web-App</title>
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
            <h1 class="text-2xl font-bold text-center my-6">Add Booking Page</h1>
            <div class="max-w-2xl mx-auto bg-white p-8 rounded-lg shadow-md">
                <form method="POST" action="/Assignment-war/createbooking">
                    <input type="hidden" name="foodcategory" id="foodcategory" value="Western Food"/>

                    <div class="mb-4">
                        <label for="datebooking" class="block text-gray-700 text-sm font-bold mb-2">
                            <i class="fas fa-calendar-alt mr-2"></i>Date
                        </label>
                        <input type="date" name="datebooking" id="datebooking" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"/>
                    </div>

                    <div class="mb-4">
                        <label for="food" class="block text-gray-700 text-sm font-bold mb-2">
                            <i class="fas fa-utensils mr-2"></i>Dish
                        </label>
                        <select name="food" id="food" onchange="bla()" class="block appearance-none w-full bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline">
                            <option>Steak</option>
                            <option>Sushi</option>
                            <option>Nasi Lemak</option>
                            <option>Apple Juice</option>
                        </select>
                    </div>

                    <div class="mb-4">
                        <label for="pricee" class="block text-gray-700 text-sm font-bold mb-2">
                            <i class="fas fa-dollar-sign mr-2"></i>Price: RM
                        </label>
                        <input type="number" name="pricee" id="pricee" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" disabled value="188">
                        <input type="hidden" name="price" id="price" value="188">
                    </div>

                    <div class="mb-6">
                        <label for="quantity" class="block text-gray-700 text-sm font-bold mb-2">
                            <i class="fas fa-sort-numeric-up-alt mr-2"></i>Quantity
                        </label>
                        <select name="quantity" id="quantity" onchange="bla()" class="block appearance-none w-full bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                        </select>
                    </div>

                    <div class="flex items-center justify-between">
                        <button type="submit" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                            <i class="fas fa-plus-circle mr-2"></i>Add Booking
                        </button>
                    </div>
                </form>
                <a href="/Assignment-war/listbooking">
                    <button class="mt-4 bg-gray-200 px-4 py-2 rounded-md hover:bg-gray-300">
                        <i class="fas fa-arrow-left mr-2"></i>Back
                    </button>
                </a>
            </div>
        </div>
    </div>

    <script>
        function bla() {
            var x = document.getElementById("food");
            var y = document.getElementById("quantity");
            food = x.options[x.selectedIndex].text;
            quantity = parseInt(y.options[y.selectedIndex].text);

            if (food == 'Apple Juice') {
                document.getElementById("price").value = 15 * quantity;
                document.getElementById("pricee").value = 15 * quantity;
                document.getElementById("foodcategory").value = "Drinks";
            } else if (food == 'Nasi Lemak') {
                document.getElementById("price").value = 25 * quantity;
                document.getElementById("pricee").value = 25 * quantity;
                document.getElementById("foodcategory").value = "Local Food";
            } else if (food == 'Sushi') {
                document.getElementById("price").value = 65 * quantity;
                document.getElementById("pricee").value = 65 * quantity;
                document.getElementById("foodcategory").value = "Japan Food";
            } else if (food == 'Steak') {
                document.getElementById("price").value = 188 * quantity;
                document.getElementById("pricee").value = 188 * quantity;
                document.getElementById("foodcategory").value = "Western Food";
            }
        }
    </script>
    <script>
        document.getElementById('dark-mode-toggle').addEventListener('click', function() {
            document.body.classList.toggle('dark-mode');
        });
    </script>
</body>
</html>

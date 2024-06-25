<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>New Booking | EduCafe Booking Web-App</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto px-4">
        <h1 class="text-xl font-bold text-center my-6">Create Booking!</h1>
        <div class="bg-white p-8 rounded-lg shadow-md">
            <form method="POST" action="/Assignment-war/createbooking">
                <input type="hidden" name="foodcategory" id="foodcategory" value="Western Food"/>
    
                <div class="mb-4">
                    <label for="datebooking" class="block text-gray-700 text-sm font-bold mb-2">Date</label>
                    <input type="date" name="datebooking" id="datebooking" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"/>
                </div>
    
                <div class="mb-4">
                    <label for="food" class="block text-gray-700 text-sm font-bold mb-2">Dish</label>
                    <select name="food" id="food" onchange="bla()" class="block appearance-none w-full bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline">
                        <option>Steak</option>
                        <option>Sushi</option>
                        <option>Nasi Lemak</option>
                        <option>Apple Juice</option>
                    </select>
                </div>
    
                <div class="mb-4">
                    <label for="pricee" class="block text-gray-700 text-sm font-bold mb-2">Price: RM</label>
                    <input type="number" name="pricee" id="pricee" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" disabled value="188">
                    <input type="hidden" name="price" id="price" value="188">
                </div>
    
                <div class="mb-6">
                    <label for="quantity" class="block text-gray-700 text-sm font-bold mb-2">Quantity</label>
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
                    <input type="submit" value="Add Booking" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                </div>
            </form>
        </div>
    
        <div class="mt-6 text-center">
            <a href="/Assignment-war/listbooking" class="inline-block bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-4 rounded">
                Back
            </a>
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
    </body>
</html>

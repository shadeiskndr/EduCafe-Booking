<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Booking | EduCafe Booking Web-App</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100">

        <div class="container mx-auto mt-10 p-8 bg-white shadow-md rounded">
            <h1 class="text-2xl font-bold mb-6">Edit Booking!</h1>
            <form method="POST" action="/Assignment-war/editbooking" class="space-y-4">
                <input type="hidden" name="bookingid" value="${bookingid}"/>
                <input type="hidden" name="foodcategory" id="foodcategory" value="Western Food"/>

                <div class="flex flex-col">
                    <label for="datebooking" class="mb-2 font-semibold">Date</label>
                    <input type="date" name="datebooking" id="datebooking" value="${nbooking.datebooking}" class="p-2 border rounded">
                </div>

                <div class="flex flex-col">
                    <label for="food" class="mb-2 font-semibold">Dish</label>
                    <select name="food" id="food" onchange="bla()" class="p-2 border rounded">
                        <option>Steak</option>
                        <option>Sushi</option>
                        <option>Nasi Lemak</option>
                        <option>Apple Juice</option>
                    </select>
                </div>

                <div class="flex flex-col">
                    <label class="mb-2 font-semibold">Price: RM</label>
                    <input type="number" name="pricee" id="pricee" disabled value="188" class="p-2 border rounded">
                    <input type="hidden" name="price" id="price" value="188">
                </div>

                <div class="flex flex-col">
                    <label for="quantity" class="mb-2 font-semibold">Quantity</label>
                    <select name="quantity" id="quantity" onchange="bla()" class="p-2 border rounded">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                    </select>
                </div>

                <div class="flex justify-start">
                    <input type="submit" value="Edit Booking" class="cursor-pointer bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                </div>
            </form>

            <a href="/Assignment-war/listbooking" class="inline-block mt-6">
                <button class="bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4 rounded">
                    Back
                </button>
            </a>
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

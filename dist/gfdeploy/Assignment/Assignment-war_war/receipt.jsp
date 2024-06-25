<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Receipt | EduCafe Booking Web-App</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100">
        <div class="container mx-auto mt-10">
            <div class="max-w-2xl mx-auto bg-white p-8 border border-gray-300 shadow-lg">
                <h1 class="text-3xl font-bold text-center text-blue-600 mb-6">
                    Receipt #000<%=request.getAttribute("receiptid")%>
                </h1>
                <div class="mb-4">
                    <table class="table-auto w-full">
                        <tbody>
                            <tr class="border-b">
                                <td class="px-4 py-2 text-gray-600 font-medium">Date:</td>
                                <td class="px-4 py-2"><%=request.getAttribute("receiptdate")%></td>
                            </tr>
                            <tr class="border-b">
                                <td class="px-4 py-2 text-gray-600 font-medium">Chef Name:</td>
                                <td class="px-4 py-2"><%=request.getAttribute("receiptstaffname")%></td>
                            </tr>
                            <tr class="border-b">
                                <td class="px-4 py-2 text-gray-600 font-medium">Customer Rating:</td>
                                <td class="px-4 py-2"><%=request.getAttribute("receiptrating")%></td>
                            </tr>
                            <tr class="border-b">
                                <td class="px-4 py-2 text-gray-600 font-medium">Customer Comment:</td>
                                <td class="px-4 py-2"><%=request.getAttribute("receiptcomment")%></td>
                            </tr>
                            <tr class="border-b">
                                <td class="px-4 py-2 text-gray-600 font-medium">Dish Category:</td>
                                <td class="px-4 py-2"><%=request.getAttribute("receiptfoodcategory")%></td>
                            </tr>
                            <tr class="border-b">
                                <td class="px-4 py-2 text-gray-600 font-medium">Dish Name:</td>
                                <td class="px-4 py-2"><%=request.getAttribute("receiptfoodname")%></td>
                            </tr>
                            <tr class="border-b">
                                <td class="px-4 py-2 text-gray-600 font-medium">Quantity:</td>
                                <td class="px-4 py-2"><%=request.getAttribute("receiptquantity")%></td>
                            </tr>
                            <tr>
                                <td class="px-4 py-2 text-gray-600 font-medium">Total Price:</td>
                                <td class="px-4 py-2"><%=request.getAttribute("receiptprice")%></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="flex justify-center mt-6">
                    <a href="javascript: history.go(-1)"
                       class="px-6 py-3 bg-blue-600 text-white font-medium uppercase rounded hover:bg-blue-700 active:bg-blue-800 focus:outline-none focus:ring focus:ring-blue-300 transition duration-150 ease-in-out"
                       role="button">
                        Back
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
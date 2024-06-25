

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Page | EduCafe Booking Web-App</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100">
        <div class="container mx-auto mt-10">
            <h1 class="text-4xl font-bold text-center mb-6">Customer Page!</h1>
            
            <div class="flex justify-center gap-4 mb-8">
                <a href="/Assignment-war/editprofile?id=${nuser.id}&role=${nuser.role}&editor=customer" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                    <button>Edit Profile</button>
                </a>
                <a href="/Assignment-war/listbooking" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">
                    <button>Check Bookings</button>
                </a>
                <a href="/Assignment-war/logout" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">
                    <button>Logout</button>
                </a>
            </div>
            
            <div class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
                <h2 class="text-2xl font-semibold mb-4">Profile</h2>
                <p><strong>Name:</strong> ${nuser.name}</p>
                <p><strong>Student ID:</strong> ${nuser.studentid}</p>
                <p><strong>Age:</strong> ${nuser.age}</p>
                <p><strong>Phone:</strong> ${nuser.phone}</p> <!-- Corrected the label from "Name" to "Phone" -->
                <p><strong>Join Date:</strong> ${nuser.datejoined}</p>
            </div>
        </div>
    </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Page | EduCafe Booking Web-App</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100">
        <div class="container mx-auto mt-10">
            <h1 class="text-4xl font-bold text-center mb-6">Staff page!</h1>
            
            <div class="flex justify-center gap-4 mb-8">
                <a href="/Assignment-war/editprofile?id=${nuser.id}&role=${nuser.role}&editor=staff" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
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
                <p class="mb-2"><strong>Username:</strong> ${nuser.username}</p>
                <p class="mb-2"><strong>Name:</strong> ${nuser.name}</p>
                <p class="mb-2"><strong>Age:</strong> ${nuser.age}</p>
                <p class="mb-2"><strong>Phone:</strong> ${nuser.phone}</p>
                <p class="mb-2"><strong>Join Date:</strong> ${nuser.datejoined}</p>
                <p class="mb-2"><strong>Salary:</strong> RM ${nuser.salary}</p>
                <p class="mb-2"><strong>Average Rating:</strong> ${rating}/10</p>
            </div>
        </div>
    </body>
</html>

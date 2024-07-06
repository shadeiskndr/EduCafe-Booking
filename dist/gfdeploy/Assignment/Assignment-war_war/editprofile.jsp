<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Account | EduCafe Booking Web-App</title>
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
                <h1 class="text-2xl font-bold text-center mb-4">Update Info Page</h1>
        
                <div class="max-w-lg mx-auto p-6 bg-white rounded-lg shadow-md">
                    <h2 class="text-lg font-medium mb-4"><i class="fas fa-user mr-2"></i>Name: ${nuser.name}</h2>
                    
                    <form method="POST" action="/Assignment-war/editprofile" class="space-y-4">
                        <input type="hidden" name="userid" value="${nuser.id}">
                        <input type="hidden" name="role" value="${nuser.role}">
                        <input type="hidden" name="editor" value="${editor}">
                        
                        <div class="grid grid-cols-1 gap-4">
                            <div>
                                <label class="font-medium"><i class="fas fa-user mr-2"></i>Name</label>
                                <input type="text" name="name" value="${nuser.name}" class="border p-2 w-full">
                            </div>
                            
                            <c:if test="${nuser.role == 'customer'}">
                                <div>
                                    <label class="font-medium"><i class="fas fa-id-card mr-2"></i>Student ID</label>
                                    <input type="text" name="studentid" value="${nuser.studentid}" class="border p-2 w-full" ${nuser.role == 'customer' ? '' : 'disabled'}>
                                </div>
                            </c:if>
                            
                            <c:if test="${nuser.role == 'manager'}">
                                <div>
                                    <label class="font-medium"><i class="fas fa-dollar-sign mr-2"></i>Salary</label>
                                    <input type="number" name="salary" value="${nuser.salary}" class="border p-2 w-full" ${nuser.role == 'manager' ? '' : 'disabled'}>
                                </div>
                            </c:if>
                            
                            <div>
                                <label class="font-medium"><i class="fas fa-birthday-cake mr-2"></i>Age</label>
                                <input type="number" name="age" value="${nuser.age}" class="border p-2 w-full">
                            </div>
                            
                            <div>
                                <label class="font-medium"><i class="fas fa-phone mr-2"></i>Phone</label>
                                <input type="text" name="phone" value="${nuser.phone}" class="border p-2 w-full">
                            </div>
                            
                            <div>
                                <label class="font-medium"><i class="fas fa-calendar-alt mr-2"></i>Join Date</label>
                                <input type="date" name="datejoined" value="${nuser.datejoined}" class="border p-2 w-full">
                            </div>
                            
                            <div>
                                <label class="font-medium"><i class="fas fa-lock mr-2"></i>Current Password</label>
                                <input type="password" name="oldpass" class="border p-2 w-full">
                            </div>
                            
                            <div>
                                <label class="font-medium"><i class="fas fa-lock mr-2"></i>New Password</label>
                                <input type="password" name="pass1" class="border p-2 w-full">
                            </div>
                            
                            <div>
                                <label class="font-medium"><i class="fas fa-lock mr-2"></i>Confirm New Password</label>
                                <input type="password" name="pass2" class="border p-2 w-full">
                            </div>
                        </div>
                        
                        <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600">
                            <i class="fas fa-save mr-2"></i>Update Info
                        </button>
                    </form>
                    
                    <a href="/Assignment-war/">
                        <button class="mt-4 bg-gray-200 px-4 py-2 rounded-md hover:bg-gray-300">
                            <i class="fas fa-arrow-left mr-2"></i>Back
                        </button>
                    </a>
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

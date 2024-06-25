<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Account | EduCafe Booking Web-App</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100">
        <h1 class="text-2xl font-bold text-center mb-4">Update Info!</h1>

        <div class="max-w-md mx-auto p-4 bg-white rounded-lg shadow-md">
            <h2 class="text-lg font-medium mb-2"> Name ${nuser.name} </h2>
            
            <form method="POST" action="/Assignment-war/editprofile" class="space-y-4">
                <input type="hidden" name="userid" value="${nuser.id}">
                <input type="hidden" name="role" value="${nuser.role}">
                <input type="hidden" name="editor" value="${editor}">
                
                <div class="grid grid-cols-2 gap-4">
                    <div><label class="font-medium">Name</label></div>
                    <div><input type="text" name="name" value="${nuser.name}" class="border p-2 w-full"></div>
                    
                    <c:if test="${nuser.role == 'customer'}">
                        <div>
                            <label class="font-medium">Student ID</label>
                        </div>
                        <div>
                            <input type="text" name="studentid" value="${nuser.studentid}" class="border p-2 w-full" ${nuser.role == 'customer' ? '' : 'disabled'}>
                        </div>
                    </c:if>
                    
                    <c:if test="${nuser.role == 'manager'}">
                        <div>
                            <label class="font-medium">Salary</label>
                        </div> 
                        <div>
                            <input type="number" name="salary" value="${nuser.salary}" class="border p-2 w-full" ${nuser.role == 'manager' ? '' : 'disabled'}>
                        </div>
                    </c:if>
                    
                    <div><label class="font-medium">Age</label></div>
                    <div><input type="number" name="age" value="${nuser.age}" class="border p-2 w-full"></div>
                    
                    <div><label class="font-medium">Phone</label></div>
                    <div><input type="text" name="phone" value="${nuser.phone}" class="border p-2 w-full"></div>
                    
                    <div><label class="font-medium">Join Date</label></div>
                    <div><input type="date" name="datejoined" value="${nuser.datejoined}" class="border p-2 w-full"></div>
                    
                    <div><label class="font-medium">Current Password</label></div>
                    <div><input type="password" name="oldpass" class="border p-2 w-full"></div>
                    
                    <div><label class="font-medium">New Password</label></div>  
                    <div><input type="password" name="pass1" class="border p-2 w-full"></div>
                    
                    <div><label class="font-medium">Confirm New Password</label></div>
                    <div><input type="password" name="pass2" class="border p-2 w-full"></div>
                </div>
                
                <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600">Update Info</button>
            </form>
            
                <a href="/Assignment-war/">
                    <button class="mt-4 bg-gray-200 px-4 py-2 rounded-md hover:bg-gray-300">Back</button>
                </a>
          
            
        </div>

    </body>
</html>

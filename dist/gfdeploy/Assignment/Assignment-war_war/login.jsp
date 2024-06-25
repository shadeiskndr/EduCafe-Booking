<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page | EduCafe Booking Web-App</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>

    <body class="bg-gray-100">
        <section class="h-screen flex">
            <div class="flex w-1/2 justify-center items-center bg-white">
                <img
                    src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg"
                    class="max-w-full h-auto"
                    alt="Login Image"
                />
            </div>
            <div class="flex w-1/2 justify-center items-center p-10">
                <div class="max-w-md w-full space-y-8">
                    <h1 class="font-medium leading-tight text-5xl mt-0 mb-2 text-blue-600 text-center">EduCafe Booking Web-App</h1>
                    <form method="POST" action="/Assignment-war/login" class="mt-8 space-y-6">
                        <!--Email input--> 
                        <div class="rounded-md shadow-sm -space-y-px">
                            <input
                                type="text"
                                name="username"
                                placeholder="Username"
                                class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                                required
                            />
                        </div>

                        <!-- Password input -->
                        <div class="rounded-md shadow-sm -space-y-px">
                            <input
                                type="password"
                                name="password"
                                placeholder="Password"
                                class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                                required
                            />
                        </div>

                        <!-- Role select -->
                        <div class="rounded-md shadow-sm -space-y-px">
                            <select name="role" class="block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md">
                                <option>customer</option>
                                <option>staff</option>
                                <option>manager</option>
                            </select>
                        </div>

                        <!-- Submit button -->
                        <div>
                            <button
                                type="submit"
                                class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                            >
                                Login
                            </button>
                        </div>

                        <!-- Register button -->
                        <div>
                            <a
                                href="/Assignment-war/register.jsp"
                                class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-blue-700 bg-transparent hover:bg-blue-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                            >
                                Register
                            </a>
                        </div>
                    </form>
                </div>
            </div>
            <div class="flex w-1/2 justify-center items-center bg-white">
                <img
                    src="https://preview.colorlib.com/theme/bootstrap/login-form-07/images/undraw_remotely_2j6y.svg"
                    alt="Cafeteria"
                    class="max-w-full h-auto"
                />
            </div>
        </section>
    </body>
</html>

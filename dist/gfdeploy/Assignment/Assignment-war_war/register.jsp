<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page | EduCafe Booking Web-App</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://kit.fontawesome.com/f419ce4a58.js" crossorigin="anonymous"></script>
    </head>

    <body class="bg-gray-100">
        <section class="h-screen flex">
            <div class="flex w-1/2 justify-center items-center bg-black">
                <img
                    src="https://img.freepik.com/free-photo/cup-coffee-glass-counter-bakery_23-2147892886.jpg?t=st=1720223363~exp=1720226963~hmac=e2a414d6cd198846b61ec67ded8b72f7e6ec14c2f5f087f01b521afd5950bc26&w=826"
                    class="max-w-100 h-auto"
                    alt="Register Image"
                    style="object-fit: cover; width: 100%; height: 100%;"
                />
            </div>
            <div class="flex w-1/2 justify-center items-center p-10">
                <div class="max-w-md w-full space-y-8">
                    <div class="flex flex-col items-center">
                        <i class="fa-solid fa-mug-saucer text-6xl mb-4"></i>
                        <h1 class="font-medium leading-tight text-5xl mt-0 mb-2 text-blue-600 text-center">EduCafe Booking Web-App</h1>
                    </div>
                    <form method="POST" action="/Assignment-war/register" class="mt-8 space-y-6">
                        <div>
                            <label class="block text-sm font-medium text-gray-700" for="username">Username</label>
                            <input
                                id="username"
                                type="text"
                                name="username"
                                class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                                placeholder="Username"
                                required
                            />
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700" for="pass1">New Password</label>
                            <input
                                id="pass1"
                                type="password"
                                name="pass1"
                                class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                                placeholder="New Password"
                                required
                            />
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700" for="pass2">Confirm New Password</label>
                            <input
                                id="pass2"
                                type="password"
                                name="pass2"
                                class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                                placeholder="Confirm New Password"
                                required
                            />
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700" for="name">Name</label>
                            <input
                                id="name"
                                type="text"
                                name="name"
                                class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                                placeholder="Name"
                                required
                            />
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700" for="studentid">Student ID</label>
                            <input
                                id="studentid"
                                type="text"
                                name="studentid"
                                class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                                placeholder="Student ID"
                                required
                            />
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700" for="age">Age</label>
                            <input
                                id="age"
                                type="text"
                                name="age"
                                class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                                placeholder="Age"
                                required
                            />
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700" for="phone">Phone Number</label>
                            <input
                                id="phone"
                                type="text"
                                name="phone"
                                class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                                placeholder="Phone Number"
                                required
                            />
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700" for="datejoined">Date Joined</label>
                            <input
                                id="datejoined"
                                type="date"
                                name="datejoined"
                                class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                                required
                            />
                        </div>
                        <div>
                            <button
                                type="submit"
                                class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                            >
                                Register
                            </button>
                        </div>
                        <div>
                            <a
                                href="/Assignment-war/login.jsp"
                                class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-blue-700 bg-transparent hover:bg-blue-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                            >
                                Login now
                            </a>
                        </div>
                    </form>
                </div>
            </div>
            <div class="flex w-1/2 justify-center items-center bg-black">
                <img
                    src="https://img.freepik.com/free-photo/freshly-baked-pastry-with-cup-coffee-wooden-table_23-2147892878.jpg?t=st=1720223422~exp=1720227022~hmac=92c5113c5afa4b098610a77b2567869050b379592e2e437c0f29bb5c164f4094&w=826"
                    alt="Cafeteria"
                    class="max-w-full h-auto"
                    style="object-fit: cover; width: 100%; height: 100%;"
                />
            </div>
        </section>
    </body>
</html>

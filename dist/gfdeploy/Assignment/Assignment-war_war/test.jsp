

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <!--        <div class="block p-6 rounded-lg shadow-lg bg-white max-w-md">
                    <form>
                        <div class="grid grid-cols-2 gap-4">
                            <div class="form-group mb-6">
                                <input type="text" class="form-control
                                       block
                                       w-full
                                       px-3
                                       py-1.5
                                       text-base
                                       font-normal
                                       text-gray-700
                                       bg-white bg-clip-padding
                                       border border-solid border-gray-300
                                       rounded
                                       transition
                                       ease-in-out
                                       m-0
                                       focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none" id="exampleInput123"
                                       aria-describedby="emailHelp123" placeholder="First name">
                            </div>
                            <div class="form-group mb-6">
                                <input type="text" class="form-control
                                       block
                                       w-full
                                       px-3
                                       py-1.5
                                       text-base
                                       font-normal
                                       text-gray-700
                                       bg-white bg-clip-padding
                                       border border-solid border-gray-300
                                       rounded
                                       transition
                                       ease-in-out
                                       m-0
                                       focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none" id="exampleInput124"
                                       aria-describedby="emailHelp124" placeholder="Last name">
                            </div>
                        </div>
                        <div class="form-group mb-6">
                            <input type="email" class="form-control block
                                   w-full
                                   px-3
                                   py-1.5
                                   text-base
                                   font-normal
                                   text-gray-700
                                   bg-white bg-clip-padding
                                   border border-solid border-gray-300
                                   rounded
                                   transition
                                   ease-in-out
                                   m-0
                                   focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none" id="exampleInput125"
                                   placeholder="Email address">
                        </div>
                        <div class="form-group mb-6">
                            <input type="password" class="form-control block
                                   w-full
                                   px-3
                                   py-1.5
                                   text-base
                                   font-normal
                                   text-gray-700
                                   bg-white bg-clip-padding
                                   border border-solid border-gray-300
                                   rounded
                                   transition
                                   ease-in-out
                                   m-0
                                   focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none" id="exampleInput126"
                                   placeholder="Password">
                        </div>
                        <div class="form-group form-check text-center mb-6">
                            <input type="checkbox"
                                   class="form-check-input appearance-none h-4 w-4 border border-gray-300 rounded-sm bg-white checked:bg-blue-600 checked:border-blue-600 focus:outline-none transition duration-200 mt-1 align-top bg-no-repeat bg-center bg-contain mr-2 cursor-pointer"
                                   id="exampleCheck25" checked>
                            <label class="form-check-label inline-block text-gray-800" for="exampleCheck25">Subscribe to our newsletter</label>
                        </div>
                        <button type="submit" class="
                                w-full
                                px-6
                                py-2.5
                                bg-blue-600
                                text-white
                                font-medium
                                text-xs
                                leading-tight
                                uppercase
                                rounded
                                shadow-md
                                hover:bg-blue-700 hover:shadow-lg
                                focus:bg-blue-700 focus:shadow-lg focus:outline-none focus:ring-0
                                active:bg-blue-800 active:shadow-lg
                                transition
                                duration-150
                                ease-in-out">Sign up</button>
                    </form>
                </div>-->
        <div class="h-screen flex flex-col items-center justify-center">
            <p class="text-blue-600 text-xl mb-3">
                New Account
            </p>

            <form method="POST" action="/Assignment-war/register">
                <input aria-label="Enter your email address" 
                       type="text" placeholder="Email address" 
                       class="text-sm text-gray-base w-full 
                       mr-3 py-5 px-4 h-2 border 
                       border-gray-200 rounded mb-2" />
                <input aria-label="Enter your password" 
                       type="password" placeholder="Password"
                       class="text-sm text-gray-base w-full mr-3 
                       py-5 px-4 h-2 border border-gray-200 
                       rounded mb-2" />

                <button type="submit"
                        class="bg-blue-400 w-full mt-4">
                    Login
                </button>
            </form>
        </div>
    </body>
</html>

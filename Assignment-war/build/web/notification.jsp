

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notification | EduCafe Booking Web-App</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <div class="container mx-auto md:w-1/3 ">
            <div class="flex flex-col p-5 rounded-lg shadow bg-white">
                <div class="flex">
                    <div>
                        <% if ((String) request.getAttribute("infotype") == "good") { %>
                        <svg class="w-6 h-6 fill-current text-green-500" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                        <path d="M0 0h24v24H0V0z" fill="none"/>
                        <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm4.59-12.42L10 14.17l-2.59-2.58L6 13l4 4 8-8z"/>
                        </svg>
                        <% } else {%>
                        <svg class="w-6 h-6 fill-current text-red-500" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                        <path d="M0 0h24v24H0V0z" fill="none"/>
                        <path d="M12 5.99L19.53 19H4.47L12 5.99M12 2L1 21h22L12 2zm1 14h-2v2h2v-2zm0-6h-2v4h2v-4z"/>
                        </svg>
                        <% }%>
                    </div>

                    <div class="ml-3">
                        <h2 class="font-semibold text-gray-800">
                            <%=request.getAttribute("info")%>
                        </h2>
                    </div>
                </div>
                <div class="flex items-center mt-3">
                    <a
                        class="flex-1 px-4 py-2 ml-2 bg-blue-600 hover:bg-blue-700 text-white text-sm font-medium rounded-md text-center"
                        style="background-color: #3b5998"
                        href=<%=request.getAttribute("url")%>
                        role="button"
                        >
                        Back
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>



<%@ page isErrorPage="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Error | EduCafe Booking Web-App</title>

        <!-- Mandatory CSS Library -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            body {
                background-image: url("https://myclouddoor.com/wp-content/uploads/2016/07/h-under-maintenance-background-1.jpg");
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
                min-height: 100vh;
            }
            .portlet.error {
                background-color: rgb(255 255 255 / 50%);
                padding: 4rem 1rem;
                min-height: 100vh;
                -webkit-transition: all .35s ease;
                transition: all .35s ease;
            }

            .portlet.error .portlet__header {
                display: flex;
                padding: 1.5625rem;
                justify-content: center;
                align-items: center;
            }

            .portlet.error .portlet__header .portlet__header-title {
                display: flex;
                justify-content: center;
                align-items: center;
                text-align: center;
                color: black;
                font-size: 3rem;
                font-weight: bold;
            }

            .portlet.error .portlet__header .portlet__header-icon {
                margin: 0 15px;
                color: red;
                font-size: 4rem;
            }

            .portlet.error .portlet__body {
                padding: 1rem .75rem;
            }

            .portlet.error .portlet__body .portlet__body-title {
                display: flex;
                justify-content: center;
                align-items: center;
                text-align: center;
                color: black;
                font-size: 1.8rem;
                font-weight: bold;
            }

            .portlet.error .portlet__body .portlet__body-description {
                display: flex;
                justify-content: center;
                align-items: center;
                text-align: center;
                color: black;
                font-size: 1.35rem;
            }

            .portlet.error .portlet__footer {
                display: flex;
                padding: 4rem 0;
                justify-content: center;
                align-items: center;
            }

            .portlet.error .portlet__footer .button {
                padding: 10px 25px;
                font-size: 1.125rem;
                font-weight: bold;
            }

            @media screen and (max-width: 575px) {
                .portlet.error {
                    padding-left: .75rem;
                    padding-right: .75rem;
                }
                .portlet.error .portlet__header {
                    padding-left: 1.25rem;
                    padding-right: 1.25rem;
                }
                .portlet.error .portlet__body {
                    padding-left: .5rem;
                    padding-right: .5rem;
                }

                .portlet.error .portlet__footer {
                    padding: 2rem 0;
                }
            }

            @media screen and (max-width: 400px) {
                .portlet.error {
                    padding-top: 2.5rem;
                    padding-bottom: 2.5rem;
                }

                .portlet.error .portlet__header .portlet__header-title {
                    font-size: 2.8rem;
                }

                .portlet.error .portlet__header .portlet__header-icon {
                    margin: 0 12px;
                    font-size: 3.8rem;
                }

                .portlet.error .portlet__footer {
                    padding: 1.25rem 0;
                }
            }

            @media screen and (max-width: 320px) {
                .portlet.error .portlet__header .portlet__header-title {
                    display: inline-grid;
                }

                .portlet.error .portlet__body .portlet__body-title {
                    font-size: 1.5rem;
                }

                portlet.error .portlet__body .portlet__body-description {
                    font-size: 1.25rem;
                }
            }
        </style>
        <!-- Mandatory JavaScript Library -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="portlet error">
            <div class="portlet__header">
                <h1 class="portlet__header-title">
                    <i class="portlet__header-icon fas fa-exclamation-triangle"></i>
                    <span>Oops!</span>
                </h1>
            </div>
            <div class="portlet__body">
                <p class="portlet__body-title">
                    <%=request.getAttribute("error")%>
                </p>
                <p class="portlet__body-description">
                    Please try again!
                </p>
            </div>
            <div class="portlet__footer">
                <a class="button btn btn-success" href="javascript: history.go(-1)" role="button">Back to Previous Page</a>
            </div>
        </div>
    </body>
</html>
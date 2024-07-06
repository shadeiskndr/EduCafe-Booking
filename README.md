![Demo](https://raw.githubusercontent.com/shadeiskndr/shadeiskndr.github.io/main/uploads/EduCafe%20Demo.gif?token=BAIEW3QQJDOCC5I5DMWEM3DGREMGM)

# EduCafe Booking Web-App

EduCafe Booking Web App is a full-stack school cafeteria service web app that allows students to order their meals remotely, enables staff to manage food bookings, and improves the manager’s workflow. Designed and developed the web app’s UI layer using JSPs & Servlets to provide a user-friendly experience. Implemented the business logic layer using EJBs to handle the application’s core functionalities. Integrated the MySQL database to manage and store all relevant data efficiently. This is a university project for the ISB37804 Reuse and Component Based Development class.

## Table of Contents

- [Features](#features)
- [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Usage](#usage)

## Features

- User authentication and authorization
- Dark mode toggle
- Profile management for customers and staff
- Booking creation, editing, and rating
- Staff update booking status, and rating system
- Manager functionalities for managing users and assigning bookings to staff

## Technologies Used

- Java EE
- JSP
- Servlets
- JDBC
- Tailwind CSS

## Getting Started

### Prerequisites

- JDK 8 or higher
- Apache NetBeans IDE
- GlassFish Server (or any other Java EE compatible server)
- XAMPP Apache MySQL

### Installation

1. **Clone the repository:**

   ```sh
   git clone https://github.com/yourusername/EduCafe-Booking-Web-App.git
   cd EduCafe-Booking-Web-App
   ```

2. **Set up the database:**

   - Create a new database in XAMPP Apache MySQL.
   - Run the provided SQL script cafe.sql to set up the necessary tables.

3. **Configure the database connection:**

   - Update the JDBC URL, username, and password in the `user` class located in `Assignment-ejb/src/java/cafe/user.java`.
   - Check the web app’s `web.xml` file to ensure that the database connection is configured correctly.
   - Check the Netbeans Services window and make sure that the MySQL database is connected to the XAMPP Apache MySQL server.

4. **Build and deploy the project:**

   - Open the project in NetBeans.
   - Right click on the Assignment project and select `Run on Server`.

## Project Structure

- **Assignment-war**: Contains the web module with JSP files, servlets, and web resources.
- **Assignment-ejb**: Contains the EJB module with business logic and database interaction.

### Key Files and Directories

- `Assignment-war/src/java/controller/mainServlet.java`: Main servlet handling various actions like login, profile editing, and booking management.
- `Assignment-war/web`: Contains JSP files for different views like login, change password, and edit profile.
- `Assignment-ejb/src/java/cafe`: Contains EJB classes for user and booking management.

## Usage

### Customer User Actions

- **Login**: Navigate to the login page and enter your credentials.
- **Edit Profile**: Update your personal information and save changes.
- **Change Password**: Change your account password.
- **Create Booking**: Make a new booking for the cafe.
- **Rate Booking**: Provide a rating and comment for a completed booking.

### Short Demonstration of EduCafe Booking

- https://www.youtube.com/watch?v=dj81v5J5NYU

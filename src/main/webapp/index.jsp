<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
          crossorigin="anonymous">
    <style>
        body {
            background-image: url('<%= request.getContextPath() %>/images/home.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            background-attachment: fixed;
        }
        
        /* Circular Logo */
        .logo {
            width: 50px;  /* Adjust size as needed */
            height: 50px;
            border-radius: 50%; /* Makes the logo circular */
            object-fit: cover; /* Ensures the image fits properly inside the circle */
            margin-right: 10px; /* Space between logo and text */
        }

        /* Align Logo and Brand Name */
        .brand-container {
            display: flex;
            align-items: center;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <header class="navbar navbar-dark px-3" style="background-color: #002144;">
        <div class="brand-container">
            <!-- Circular Logo -->
            <img src="<%= request.getContextPath() %>/images/logo.png" alt="MediCore Logo" class="logo">
            <a href="./index.jsp" class="navbar-brand">MediCore</a>
        </div>
        <ul class="navbar-nav d-flex flex-row ms-auto">
            <li class="nav-item"><a href="./login.jsp" class="nav-link mx-2">Doctor Login</a></li>
            <li class="nav-item"><a href="./adLogin.jsp" class="nav-link mx-2">Admin Login</a></li>
            <li class="nav-item"><a href="./bookLogin.jsp" class="nav-link mx-2">Book Appointment</a></li>
        </ul>
    </header>

    <!-- Main Content -->
    <main style="margin-top: 8%">
        <h1 class="text-center">WELCOME TO MEDICORE HOSPITAL</h1>
        <p class="text-center mx-auto" style="color: black; font-size: 20px;">
            Welcome to MediCore Hospital, the heart of compassionate and world-class healthcare in the Kandy district. 
            We are committed to providing affordable, top-quality treatment to all our patients. Whether you're seeking 
            preventive care, specialized treatments, or emergency services, our expert medical team is here to ensure 
            your well-being with the highest standards of care, all at prices that won’t break your budget. Experience 
            healthcare that cares for you and your family’s health like never before!
        </p>
    </main>

    <!-- Footer -->
    <footer class="fixed-bottom" style="background-color: #002144;">
        <p class="text-center text-light">2025 &copy; Hospital Management</p>
    </footer>

</body>
</html>

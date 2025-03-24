<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Login</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
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

    /* Custom style for the Register button */
    .register-link {
        text-align: center;
        margin-top: 20px;
    }

    .register-link a {
        font-weight: bold;
        color: #007bff;
        text-decoration: none;
    }

    .register-link a:hover {
        text-decoration: underline;
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
            <li class="nav-item"><a href="./plogin.jsp" class="nav-link mx-2">Patient Login</a></li>
            <li class="nav-item"><a href="./alogin.jsp" class="nav-link mx-2">Admin Login</a></li>
        </ul>
    </header>

    <main style="margin-top: 8%">
        <h1 class="text-center">Doctor Login</h1>
        <form class="w-25 mx-auto" action="DoctorLogin" method="POST">
            <div class="form-outline mb-4">
                <label class="form-label">Username</label>
                <input type="text" class="form-control border-primary" name="uname" placeholder="Enter your Username...">
            </div>
            <div class="form-outline mb-5">
                <label class="form-label">Password</label>
                <input type="password" class="form-control border-primary" name="upass" placeholder="Enter your Password...">
            </div>
            <input type="submit" class="btn btn-primary" value="Login">
        </form>

        <!-- Register Link -->
        <div class="register-link">
            <p>Don't have an account? <a href="register.jsp">Register Here</a></p>
        </div>
    </main>

    <footer class="fixed-bottom" style="background-color: #002144;">
        <p class="text-center text-light">2025 &copy; Hospital Management</p>
    </footer>
</body>
</html>

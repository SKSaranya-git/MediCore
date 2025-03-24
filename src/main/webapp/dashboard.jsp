<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Dashboard | MediCore</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <style>
        /* Global Styles */
        body {
            background-color: #f4f6f9;
            font-family: Arial, sans-serif;
        }
        
        /* Navbar */
        .navbar {
            background-color: #002144;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        .navbar-brand {
            color: white !important;
            display: flex;
            align-items: center;
        }

        .navbar-brand .logo {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 10px;
        }

        .navbar-nav .nav-link {
            color: white !important;
            font-size: 16px;
        }

        .navbar-nav .nav-link:hover {
            color: #1E90FF !important;
        }

        /* Main Container */
        .container {
            margin-top: 80px; /* Adjusted to prevent content being hidden behind fixed navbar */
        }

        /* Card Styles */
        .card {
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }

        .card-header {
            background-color: #002144;
            color: white;
        }

        .card-header h4 {
            margin-bottom: 0;
        }

        /* Table */
        .table thead {
            background-color: #002144;
            color: white;
        }

        .table tbody tr:hover {
            background-color: #f4f6f9;
        }

        /* Footer */
        footer {
            background-color: #002144;
            color: white;
            text-align: center;
            padding: 15px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        /* Button Styles */
        .btn-primary {
            background-color: #1E90FF;
            border-color: #1E90FF;
        }

        .btn-primary:hover {
            background-color: #4682B4;
            border-color: #4682B4;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .navbar-brand .logo {
                width: 40px;
                height: 40px;
            }

            .container {
                margin-top: 70px;
            }

            .navbar-nav .nav-link {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top px-3">
        <div class="container-fluid">
            <a class="navbar-brand d-flex align-items-center" href="./index.jsp">
                <img src="${pageContext.request.contextPath}/images/logo.png" alt="MediCore Logo" class="logo">
                MediCore
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="docProfile.jsp">Profile</a> <!-- Redirects to Doctor Profile -->
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn btn-light text-dark" href="#">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Container -->
    <div class="container">
        <h2 class="text-center mb-4">Doctor Dashboard</h2>

        <!-- Patient List -->
        <div class="card p-4 mb-4">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h4 class="mb-0">Patient List</h4>
                <!-- Add Patient Button -->
                <a href="addPatient.jsp" class="btn btn-primary">+ Add Patient</a>
            </div>

            <div class="table-responsive">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Age</th>
                            <th>Disease</th>
                            <th>Treatment</th>
                            <th>Prescription</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Example Patient Data -->
                        <tr>
                            <td>1</td>
                            <td>John Doe</td>
                            <td>30</td>
                            <td>Flu</td>
                            <td>Rest & Hydration</td>
                            <td>Paracetamol</td>
                            <td>
                                <a href="updatePatient.jsp?id=1" class="btn btn-warning btn-sm">Edit</a>
                                <a href="deletePatient.jsp?id=1" class="btn btn-danger btn-sm">Delete</a>
                            </td>
                        </tr>
                        <!-- Repeat for each patient -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 MediCore Hospital Management System. All rights reserved.</p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

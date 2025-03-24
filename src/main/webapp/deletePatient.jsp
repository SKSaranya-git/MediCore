<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Patient</title>
    <link rel="stylesheet" href="styles.css"> <!-- Ensure this file exists -->
    <style>
        /* General Body Styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #F4F6F8;
            margin: 0;
            padding: 0;
            color: #333;
        }

        /* Header Section */
        header {
            background-color: #002144;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        header h1 {
            margin: 0;
            font-size: 36px;
            font-weight: bold;
        }

        /* Footer Section */
        footer {
            background-color: #002144;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            width: 100%;
            bottom: 0;
            box-shadow: 0 -4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Main Content */
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #002144;
            font-size: 28px;
            margin-bottom: 20px;
            text-align: center;
            font-weight: 600;
        }

        /* Form Styles */
        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 5px;
            color: #002144;
        }

        p {
            font-size: 16px;
            color: #333;
            margin-bottom: 15px;
        }

        input[type="submit"] {
            background-color: #FF6347;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 18px;
            padding: 12px;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #FF4500;
        }

        a {
            text-decoration: none;
            color: #1E90FF;
            font-size: 16px;
            margin-top: 10px;
            text-align: center;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }
        }
    </style>
</head>
<body>

<header>
    <h1>Delete Patient</h1>
</header>

<div class="container">
    <h2>Confirm Patient Deletion</h2>

    <form action="patient" method="POST">
        <input type="hidden" name="id" value="${patient.id}">

        <p><strong>Name:</strong> ${patient.name}</p>
        <p><strong>Age:</strong> ${patient.age}</p>
        <p><strong>Disease:</strong> ${patient.disease}</p>
        <p><strong>Treatment:</strong> ${patient.treatment}</p>
        <p><strong>Prescription:</strong> ${patient.prescription}</p>

        <input type="submit" name="action" value="Delete Patient">
    </form>

    <a href="patient">Cancel</a> <!-- Link to go back to the patient list -->

</div>

<footer>
    <p>&copy; 2025 MediCore Hospital Management System</p>
</footer>

</body>
</html>

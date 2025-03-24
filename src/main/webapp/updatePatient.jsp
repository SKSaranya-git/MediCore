<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Patient</title>
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
            color: #fff;
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

        input, textarea {
            width: 100%;
            padding: 12px;
            border: 2px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            margin-bottom: 15px;
            transition: border-color 0.3s ease;
        }

        input:focus, textarea:focus {
            border-color: #1E90FF;
            outline: none;
        }

        input[type="submit"] {
            background-color: #1E90FF;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 18px;
            padding: 12px;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #4682B4;
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
    <h1>Edit Patient</h1>
</header>

<div class="container">
    <h2>Patient Edit Form</h2>
    <form action="editPatientAction.jsp" method="post"> <!-- Ensure action is correct -->
        <!-- Assuming patient data is dynamically populated -->
        <label for="id">Patient ID:</label>
        <input type="number" id="id" name="id" value="${patient.id}" readonly> <!-- Make sure this is populated with existing patient ID -->
        
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="${patient.name}" required>
        
        <label for="age">Age:</label>
        <input type="number" id="age" name="age" value="${patient.age}" required>
        
        <label for="disease">Disease:</label>
        <input type="text" id="disease" name="disease" value="${patient.disease}" required>
        
        <label for="treatment">Treatment:</label>
        <input type="text" id="treatment" name="treatment" value="${patient.treatment}" required>
        
        <label for="prescription">Prescription:</label>
        <textarea id="prescription" name="prescription" rows="3" required>${patient.prescription}</textarea>
        
        <label for="doctor_id">Doctor ID:</label>
        <input type="number" id="doctor_id" name="doctor_id" value="${patient.doctor_id}" required>
        
        <input type="submit" value="Update Patient">
    </form>
</div>

<footer>
    <p>&copy; 2025 MediCore Hospital Management System</p>
</footer>

</body>
</html>

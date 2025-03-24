<%@ page import="java.util.List" %>
<%@ page import="HMS.Patient,HMS.DBConnection,HMS.PatientDAO,HMS.PatientService,HMS.PatientServlet" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Patient List</title>
</head>
<body>
    <h1>Patient List</h1>
    <a href="addPatient.jsp">Add New Patient</a>
    <table border="1">
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
            <%
            List<Patient> patients = (List<Patient>) request.getAttribute("patients");
            if (patients != null && !patients.isEmpty()) {
                for (Patient patient : patients) {
            %>
            <tr>
                <td><%= patient.getId() %></td>
                <td><%= patient.getName() %></td>
                <td><%= patient.getAge() %></td>
                <td><%= patient.getDisease() %></td>
                <td><%= patient.getTreatment() %></td>
                <td><%= patient.getPrescription() %></td>
                <td>
                    <a href="editPatient.jsp?id=<%= patient.getId() %>">Edit</a> |
                    <a href="deletePatient?id=<%= patient.getId() %>">Delete</a>
                </td>
            </tr>
            <%  }
            } else { %>
            <tr>
                <td colspan="7">No patients found.</td>
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>

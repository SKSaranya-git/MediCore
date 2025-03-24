package HMS;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.List;

@WebServlet("/patient")
public class PatientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PatientService patientService = new PatientService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String patientIdStr = request.getParameter("id");

        if ("delete".equals(action) && patientIdStr != null) {
            handleDeleteConfirmation(request, response, patientIdStr);
        } else if ("edit".equals(action) && patientIdStr != null) {
            handleEditPatient(request, response, patientIdStr);
        } else {
            handleListPatients(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            handleAddPatient(request, response);
        } else if ("update".equals(action)) {
            handleUpdatePatient(request, response);
        } else if ("delete".equals(action)) {
            handleDeletePatient(request, response);
        }
    }

    private void handleAddPatient(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            int age = Integer.parseInt(request.getParameter("age"));
            String disease = request.getParameter("disease");
            String treatment = request.getParameter("treatment");
            String prescription = request.getParameter("prescription");
            int doctorId = Integer.parseInt(request.getParameter("doctor_id"));

            Patient patient = new Patient(0, doctorId, name, age, disease, treatment, prescription);
            patientService.addPatient(patient);
            response.sendRedirect("patientList");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error occurred while adding patient.");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    private void handleUpdatePatient(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int patientId = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            int age = Integer.parseInt(request.getParameter("age"));
            String disease = request.getParameter("disease");
            String treatment = request.getParameter("treatment");
            String prescription = request.getParameter("prescription");
            int doctorId = Integer.parseInt(request.getParameter("doctor_id"));

            Patient patient = new Patient(patientId, doctorId, name, age, disease, treatment, prescription);
            patientService.updatePatient(patient);
            response.sendRedirect("patient?id=" + patientId);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error occurred while updating patient.");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    private void handleDeletePatient(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int patientId = Integer.parseInt(request.getParameter("id"));
            patientService.deletePatient(patientId);
            response.sendRedirect("patient");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error occurred while deleting patient.");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    private void handleDeleteConfirmation(HttpServletRequest request, HttpServletResponse response, String patientIdStr)
            throws ServletException, IOException {
        try {
            int patientId = Integer.parseInt(patientIdStr);
            Patient patient = patientService.getPatientById(patientId);
            if (patient != null) {
                request.setAttribute("patient", patient);
                request.getRequestDispatcher("/deletePatient.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Patient not found.");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error occurred while retrieving patient details.");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    private void handleEditPatient(HttpServletRequest request, HttpServletResponse response, String patientIdStr)
            throws ServletException, IOException {
        try {
            int patientId = Integer.parseInt(patientIdStr);
            Patient patient = patientService.getPatientById(patientId);
            if (patient != null) {
                request.setAttribute("patient", patient);
                request.getRequestDispatcher("/editPatient.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Patient not found.");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error occurred while retrieving patient details.");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    private void handleListPatients(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Patient> patients = patientService.getAllPatients();
            request.setAttribute("patients", patients);
            request.getRequestDispatcher("/patient.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error occurred while retrieving patient list.");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}

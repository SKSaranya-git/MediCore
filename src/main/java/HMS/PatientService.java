package HMS;

import java.sql.*;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PatientService {
    private PatientDAO patientDAO;
    private static final Logger logger = Logger.getLogger(PatientService.class.getName());

    // Constructor
    public PatientService() {
        this.patientDAO = new PatientDAO();
    }

    // Add a new patient
    public void addPatient(Patient patient) throws SQLException {
        try {
            patientDAO.insertPatient(patient);
            logger.info("Patient added successfully: " + patient.getName());
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error while adding patient: " + patient.getName(), e);
            throw e;  // Rethrow exception after logging
        }
    }

    // Get all patients
    public List<Patient> getAllPatients() throws SQLException {
        try {
            return patientDAO.getAllPatients();
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error while fetching patients", e);
            throw e;  // Rethrow exception after logging
        }
    }

    // Get a patient by ID
    public Patient getPatientById(int patientId) throws SQLException {
        try {
            return patientDAO.getPatientById(patientId);
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error while fetching patient with ID: " + patientId, e);
            throw e;  // Rethrow exception after logging
        }
    }

    // Update an existing patient
    public void updatePatient(Patient patient) throws SQLException {
        try {
            patientDAO.updatePatient(patient);
            logger.info("Patient updated successfully: " + patient.getName());
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error while updating patient: " + patient.getName(), e);
            throw e;  // Rethrow exception after logging
        }
    }

    // Delete a patient by ID
    public void deletePatient(int patientId) throws SQLException {
        try {
            patientDAO.deletePatient(patientId);
            logger.info("Patient deleted successfully with ID: " + patientId);
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error while deleting patient with ID: " + patientId, e);
            throw e;  // Rethrow exception after logging
        }
    }
}

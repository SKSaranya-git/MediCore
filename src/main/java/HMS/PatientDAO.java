package HMS;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PatientDAO {
    private static final Logger logger = Logger.getLogger(PatientDAO.class.getName());

    // Insert a new patient into the database
    public void insertPatient(Patient patient) throws SQLException {
        String query = "INSERT INTO patient (doctor_id, name, age, disease, treatment, prescription) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            // Set the parameters for the query
            stmt.setInt(1, patient.getDoctorId());
            stmt.setString(2, patient.getName());
            stmt.setInt(3, patient.getAge());
            stmt.setString(4, patient.getDisease());
            stmt.setString(5, patient.getTreatment());
            stmt.setString(6, patient.getPrescription());

            // Execute the query
            int rowsInserted = stmt.executeUpdate();

            // Debugging output
            if (rowsInserted > 0) {
                logger.info("Patient added successfully: " + patient.getName());
                System.out.println("Executing query: " + stmt);
                System.out.println("Patient added successfully!");
            } else {
                System.out.println("No rows inserted. Check query.");
            }

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error while adding patient: " + patient.getName(), e);
            throw e;  // Rethrow exception after logging
        }
    }


    // Retrieve all patients from the database
    public List<Patient> getAllPatients() throws SQLException {
        List<Patient> patients = new ArrayList<>();
        String query = "SELECT * FROM patient";
        
        try (Connection connection = DBConnection.getConnection(); 
             PreparedStatement stmt = connection.prepareStatement(query)) {
            
            // Execute the query and get the result set
            ResultSet rs = stmt.executeQuery();

            // Process each row in the result set and create a patient object
            while (rs.next()) {
                Patient patient = new Patient(
                    rs.getInt("id"),
                    rs.getInt("doctor_id"),
                    rs.getString("name"),
                    rs.getInt("age"),
                    rs.getString("disease"),
                    rs.getString("treatment"),
                    rs.getString("prescription")
                );
                patients.add(patient);
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error while fetching patients", e);
            throw e;  // Rethrow exception after logging
        }
        
        return patients;
    }

    // Retrieve a specific patient by ID from the database
    public Patient getPatientById(int id) throws SQLException {
        Patient patient = null;
        String query = "SELECT * FROM patient WHERE id = ?";
        
        try (Connection connection = DBConnection.getConnection(); 
             PreparedStatement stmt = connection.prepareStatement(query)) {
            
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                patient = new Patient(
                    rs.getInt("id"),
                    rs.getInt("doctor_id"),
                    rs.getString("name"),
                    rs.getInt("age"),
                    rs.getString("disease"),
                    rs.getString("treatment"),
                    rs.getString("prescription")
                );
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error while fetching patient with ID: " + id, e);
            throw e;  // Rethrow exception after logging
        }
        
        return patient;
    }

    // Update patient details in the database
    public void updatePatient(Patient patient) throws SQLException {
        String query = "UPDATE patient SET doctor_id = ?, name = ?, age = ?, disease = ?, treatment = ?, prescription = ? WHERE id = ?";
        
        try (Connection connection = DBConnection.getConnection(); 
             PreparedStatement stmt = connection.prepareStatement(query)) {
            
            // Set the parameters for the update query
            stmt.setInt(1, patient.getDoctorId());
            stmt.setString(2, patient.getName());
            stmt.setInt(3, patient.getAge());
            stmt.setString(4, patient.getDisease());
            stmt.setString(5, patient.getTreatment());
            stmt.setString(6, patient.getPrescription());
            stmt.setInt(7, patient.getId());
            
            // Execute the update query
            stmt.executeUpdate();
            logger.info("Patient updated successfully: " + patient.getName());
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error while updating patient: " + patient.getName(), e);
            throw e;  // Rethrow exception after logging
        }
    }

    // Delete a patient from the database
    public void deletePatient(int id) throws SQLException {
        String query = "DELETE FROM patient WHERE id = ?";
        
        try (Connection connection = DBConnection.getConnection(); 
             PreparedStatement stmt = connection.prepareStatement(query)) {
            
            // Set the parameter for the patient ID
            stmt.setInt(1, id);
            
            // Execute the delete query
            stmt.executeUpdate();
            logger.info("Patient deleted successfully. Patient ID: " + id);
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error while deleting patient with ID: " + id, e);
            throw e;  // Rethrow exception after logging
        }
    }
}

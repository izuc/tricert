package bol.modules;

import bol.BusinessModule;
import bol.Constants;
import bol.Socket;
import bol.util.Response.ResponseMessage;
import bol.util.Response.ResponseType;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import dal.Dal;
import djn.config.annotations.DirectMethod;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class EmployeeQualification extends BusinessModule implements Serializable {

    public static final String SQL_FETCH = "SELECT * FROM employee_qualifications WHERE qualification_id = ? LIMIT 1";
    public static final String SQL_LIST = "SELECT * FROM employee_qualifications";
    public static final String SQL_DELETE = "DELETE FROM employee_qualifications WHERE qualification_id = ? LIMIT 1";
    public static final String SQL_TABLE = "employee_qualifications";
    private static final String SQL_UPDATE = "UPDATE employee_qualifications SET employee_id = ?, qualification_title = ?, qualification_level = ?, date_obtained = ?, institute = ? WHERE qualification_id = ?";
    private static final String SQL_INSERT = "INSERT INTO employee_qualifications (employee_id, qualification_title, qualification_level, date_obtained, institute) VALUES (?, ?, ?, ?, ?)";

    public enum QualificationLevel {

        Certification, Trade, Diploma, Degree
    }
    private int qualificationID;
    private int employeeID;
    private int qualificationLevel;
    private Date dateObtained;
    private String qualificationTitle;
    private String institute;

    public EmployeeQualification() {
    }

    public EmployeeQualification(ResultSet data) {
        try {
            super.setEntityState(EntityState.Unchanged);
            this.setQualificationID(data.getInt(Constants.DB_FIELD_QUALIFICATION_ID));
            this.setEmployeeID(data.getInt(Constants.DB_FIELD_EMPLOYEE_ID));
            this.setQualificationLevel(data.getInt(Constants.DB_FIELD_QUALIFICATION_LEVEL));
            this.setDateObtained(data.getDate(Constants.DB_FIELD_DATE_OBTAINED));
            this.setQualificationTitle(data.getString(Constants.DB_FIELD_QUALIFICATION_TITLE));
            this.setInstitute(data.getString(Constants.DB_FIELD_INSTITUTE));
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeQualification.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public EmployeeQualification(JsonObject data) {
        try {
            this.setQualificationID(data.get(Constants.PROPERTY_QUALIFICATION_ID).getAsInt());
            this.setEmployeeID(data.get(Constants.PROPERTY_EMPLOYEE_ID).getAsInt());
            this.setQualificationLevel(data.get(Constants.PROPERTY_QUALIFICATION_LEVEL).getAsInt());
            this.setDateObtained(new SimpleDateFormat("yyyy-MM-dd").parse(data.get(Constants.PROPERTY_DATE_OBTAINED).getAsString()));
            this.setQualificationTitle(data.get(Constants.PROPERTY_QUALIFICATION_TITLE).getAsString());
            this.setInstitute(data.get(Constants.PROPERTY_INSTITUTE).getAsString());
        } catch (Exception ex) {
            Logger.getLogger(EmployeeQualification.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getQualificationID() {
        return this.qualificationID;
    }

    public void setQualificationID(int qualificationID) {
        this.qualificationID = qualificationID;
    }

    public int getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }

    public String getQualificationTitle() {
        return this.qualificationTitle;
    }

    public void setQualificationTitle(String qualificationTitle) {
        this.qualificationTitle = qualificationTitle;
    }

    public int getQualificationLevel() {
        return this.qualificationLevel;
    }

    public void setQualificationLevel(int qualificationLevel) {
        this.qualificationLevel = qualificationLevel;
    }

    public Date getDateObtained() {
        return this.dateObtained;
    }

    public void setDateObtained(Date dateObtained) {
        this.dateObtained = dateObtained;
    }

    public String getInstitute() {
        return this.institute;
    }

    public void setInstitute(String institute) {
        this.institute = institute;
    }

    @DirectMethod
    public static ArrayList<ResponseType> qualificationLevels() {
        return ResponseType.<QualificationLevel>create(QualificationLevel.values());
    }

    @DirectMethod
    public ResponseMessage saveData(JsonArray json) {
        return Socket.saveData(json.get(0).getAsJsonObject(), Constants.PROPERTY_QUALIFICATION_ID, this.getClass());
    }

    @Override
    protected PreparedStatement insert() throws SQLException {
        return Dal.doMutation(new Object[]{this.getEmployeeID(), this.getQualificationTitle(), this.getQualificationLevel(), this.getDateObtained(), this.getInstitute()}, EmployeeQualification.SQL_INSERT);
    }

    @Override
    protected PreparedStatement update() throws SQLException {
        return Dal.doMutation(new Object[]{this.getEmployeeID(), this.getQualificationTitle(), this.getQualificationLevel(), this.getDateObtained(), this.getInstitute(), this.getQualificationID()}, EmployeeQualification.SQL_UPDATE);
    }
}

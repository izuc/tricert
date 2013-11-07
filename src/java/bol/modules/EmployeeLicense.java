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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class EmployeeLicense extends BusinessModule implements Serializable {

    public static final String SQL_FETCH = "SELECT * FROM employee_licenses WHERE license_id = ? LIMIT 1";
    public static final String SQL_LIST = "SELECT * FROM employee_licenses";
    public static final String SQL_DELETE = "DELETE FROM employee_licenses WHERE license_id = ? LIMIT 1";
    public static final String SQL_TABLE = "employee_licenses";
    private static final String SQL_UPDATE = "UPDATE employee_licenses SET employee_id = ?, license_type = ?, license_number = ?, license_class = ? WHERE license_id = ?";
    private static final String SQL_INSERT = "INSERT INTO employee_licenses (employee_id, license_type, license_number, license_class) VALUES (?, ?, ?, ?)";
    
    public enum LicenseType {Car, Forklift, Truck}
    private int licenseID;
    private int employeeID;
    private int licenseType;
    private String licenseNumber;
    private String licenseClass;

    public EmployeeLicense() {
    }

    public EmployeeLicense(ResultSet data) {
        try {
            super.setEntityState(EntityState.Unchanged);
            this.setLicenseID(data.getInt(Constants.DB_FIELD_LICENSE_ID));
            this.setEmployeeID(data.getInt(Constants.DB_FIELD_EMPLOYEE_ID));
            this.setLicenseType(data.getInt(Constants.DB_FIELD_LICENSE_TYPE));
            this.setLicenseNumber(data.getString(Constants.DB_FIELD_LICENSE_NUMBER));
            this.setLicenseClass(data.getString(Constants.DB_FIELD_LICENSE_CLASS));
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeLicense.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public EmployeeLicense(JsonObject data) {
        this.setLicenseID(data.get(Constants.PROPERTY_LICENSE_ID).getAsInt());
        this.setEmployeeID(data.get(Constants.PROPERTY_EMPLOYEE_ID).getAsInt());
        this.setLicenseType(data.get(Constants.PROPERTY_LICENSE_TYPE).getAsInt());
        this.setLicenseNumber(data.get(Constants.PROPERTY_LICENSE_NUMBER).getAsString());
        this.setLicenseClass(data.get(Constants.PROPERTY_LICENSE_CLASS).getAsString());
    }

    public int getLicenseID() {
        return this.licenseID;
    }

    public void setLicenseID(int licenseID) {
        this.licenseID = licenseID;
    }

    public int getEmployeeID() {
        return this.employeeID;
    }

    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }

    public int getLicenseType() {
        return this.licenseType;
    }

    public void setLicenseType(int licenseType) {
        this.licenseType = licenseType;
    }

    public String getLicenseNumber() {
        return this.licenseNumber;
    }

    public void setLicenseNumber(String licenseNumber) {
        this.licenseNumber = licenseNumber;
    }

    public String getLicenseClass() {
        return this.licenseClass;
    }

    public void setLicenseClass(String licenseClass) {
        this.licenseClass = licenseClass;
    }
    
    @DirectMethod
    public static ArrayList<ResponseType> licenseTypes() {
        return ResponseType.<LicenseType>create(LicenseType.values());
    }

    @DirectMethod
    public ResponseMessage saveData(JsonArray json) {
        return Socket.saveData(json.get(0).getAsJsonObject(), Constants.PROPERTY_LICENSE_ID, this.getClass());
    }

    @Override
    protected PreparedStatement insert() throws SQLException {
        return Dal.doMutation(new Object[]{this.getEmployeeID(), this.getLicenseType(), this.getLicenseNumber(), this.getLicenseClass()}, EmployeeLicense.SQL_INSERT);
    }

    @Override
    protected PreparedStatement update() throws SQLException {
        return Dal.doMutation(new Object[]{this.getEmployeeID(), this.getLicenseType(), this.getLicenseNumber(), this.getLicenseClass(), this.getLicenseID()}, EmployeeLicense.SQL_UPDATE);
    }
}

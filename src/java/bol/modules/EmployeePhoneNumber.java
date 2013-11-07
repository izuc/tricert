package bol.modules;

import bol.BusinessModule;
import bol.Constants;
import bol.Socket;
import bol.util.Response.ResponseMessage;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import dal.Dal;
import djn.config.annotations.DirectMethod;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class EmployeePhoneNumber extends BusinessModule implements Serializable {

    public static final String SQL_FETCH = "SELECT * FROM employee_phone_registry WHERE phone_id = ? LIMIT 1";
    public static final String SQL_LIST = "SELECT * FROM employee_phone_registry";
    public static final String SQL_DELETE = "DELETE FROM employee_phone_registry WHERE phone_id = ? LIMIT 1";
    public static final String SQL_TABLE = "employee_phone_registry";
    private static final String SQL_UPDATE = "UPDATE employee_phone_registry SET employee_id = ?, contact_information = ?, contact_number = ? WHERE phone_id = ?";
    private static final String SQL_INSERT = "INSERT INTO employee_phone_registry (employee_id, contact_information, contact_number) VALUES (?, ?, ?)";
    private int phoneID;
    private int employeeID;
    private String contactInformation;
    private String contactNumber;

    public EmployeePhoneNumber() {
    }

    public EmployeePhoneNumber(ResultSet data) {
        try {
            this.setPhoneID(data.getInt(Constants.DB_FIELD_PHONE_ID));
            this.setEmployeeID(data.getInt(Constants.DB_FIELD_EMPLOYEE_ID));
            this.setContactInformation(data.getString(Constants.DB_FIELD_CONTACT_INFORMATION));
            this.setContactNumber(data.getString(Constants.DB_FIELD_CONTACT_NUMBER));
        } catch (SQLException ex) {
            Logger.getLogger(EmployeePhoneNumber.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public EmployeePhoneNumber(JsonObject data) {
        this.setPhoneID(data.get(Constants.PROPERTY_PHONE_ID).getAsInt());
        this.setEmployeeID(data.get(Constants.PROPERTY_EMPLOYEE_ID).getAsInt());
        this.setContactInformation(data.get(Constants.PROPERTY_CONTACT_INFORMATION).getAsString());
        this.setContactNumber(data.get(Constants.PROPERTY_CONTACT_NUMBER).getAsString());
    }

    public int getPhoneID() {
        return this.phoneID;
    }

    public void setPhoneID(int phoneID) {
        this.phoneID = phoneID;
    }

    public int getEmployeeID() {
        return this.employeeID;
    }

    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }

    public String getContactInformation() {
        return this.contactInformation;
    }

    public void setContactInformation(String contactInformation) {
        this.contactInformation = contactInformation;
    }

    public String getContactNumber() {
        return this.contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    @DirectMethod
    public ResponseMessage saveData(JsonArray json) {
        return Socket.saveData(json.get(0).getAsJsonObject(), Constants.PROPERTY_PHONE_ID, this.getClass());
    }

    @Override
    protected PreparedStatement insert() throws SQLException {
        return Dal.doMutation(new Object[]{this.getEmployeeID(), this.getContactInformation(), this.getContactNumber()}, EmployeePhoneNumber.SQL_INSERT);
    }

    @Override
    protected PreparedStatement update() throws SQLException {
        return Dal.doMutation(new Object[]{this.getEmployeeID(), this.getContactInformation(), this.getContactNumber(), this.getPhoneID()}, EmployeePhoneNumber.SQL_UPDATE);
    }
}

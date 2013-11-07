package bol.modules;

import bol.*;
import bol.util.Response.ResponseType;
import dal.Dal;
import djn.config.annotations.DirectMethod;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Employee extends BusinessModule implements Serializable {

    public static final String SQL_FETCH = "SELECT * FROM employees WHERE employee_id = ? LIMIT 1";
    public static final String SQL_LIST = "SELECT * FROM employees";
    public static final String SQL_DELETE = "DELETE FROM employees WHERE employee_id = ? LIMIT 1";
    public static final String SQL_TABLE = "employees";
    private static final String SQL_UPDATE = "UPDATE employees SET employee_section_id = ?, department_id = ?, supervisor_id = ?, employee_type = ?, first_name = ?, last_name = ?, email_address = ?, street_address = ?, suburb = ?, postcode = ?, state = ? WHERE employee_id = ?";
    private static final String SQL_INSERT = "INSERT INTO employees (employee_section_id, department_id, supervisor_id, employee_type, first_name, last_name, email_address, street_address, suburb, postcode, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    public enum EmployeeType {

        FullTime, PartTime, Casual
    };

    public enum State {

        ACT, NSW, NT, QLD, SA, TAS, VIC, WA
    };
    private int employeeID;
    private int employeeSectionID;
    private int departmentID;
    private int supervisorID;
    private int employeeType;
    private String firstName;
    private String lastName;
    private String emailAddress;
    private String streetAddress;
    private String suburb;
    private String postcode;
    private String state;

    public Employee() {
    }

    public Employee(ResultSet data) {
        try {
            super.setEntityState(EntityState.Unchanged);
            this.setEmployeeID(data.getInt(Constants.DB_FIELD_EMPLOYEE_ID));
            this.setEmployeeSectionID(data.getInt(Constants.DB_FIELD_EMPLOYEE_SECTION_ID));
            this.setDepartmentID(data.getInt(Constants.DB_FIELD_DEPARTMENT_ID));
            this.setSupervisorID(data.getInt(Constants.DB_FIELD_SUPERVISOR_ID));
            this.setEmployeeType(data.getInt(Constants.DB_FIELD_EMPLOYEE_TYPE));
            this.setFirstName(data.getString(Constants.DB_FIELD_FIRST_NAME));
            this.setLastName(data.getString(Constants.DB_FIELD_LAST_NAME));
            this.setEmailAddress(data.getString(Constants.DB_FIELD_EMAIL_ADDRESS));
            this.setStreetAddress(data.getString(Constants.DB_FIELD_STREET_ADDRESS));
            this.setSuburb(data.getString(Constants.DB_FIELD_SUBURB));
            this.setPostcode(data.getString(Constants.DB_FIELD_POSTCODE));
            this.setState(data.getString(Constants.DB_FIELD_STATE));
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getEmployeeID() {
        return this.employeeID;
    }

    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }

    public int getEmployeeSectionID() {
        return employeeSectionID;
    }

    public void setEmployeeSectionID(int employeeSectionID) {
        this.employeeSectionID = employeeSectionID;
    }
    
    public int getDepartmentID() {
        return departmentID;
    }

    public void setDepartmentID(int departmentID) {
        this.departmentID = departmentID;
    }

    public int getSupervisorID() {
        return this.supervisorID;
    }

    public void setSupervisorID(int supervisorID) {
        this.supervisorID = supervisorID;
    }
    
    public int getEmployeeType() {
        return employeeType;
    }

    public void setEmployeeType(int employeeType) {
        this.employeeType = employeeType;
    }

    public String getFirstName() {
        return this.firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return this.lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmailAddress() {
        return this.emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getStreetAddress() {
        return this.streetAddress;
    }

    public void setStreetAddress(String streetAddress) {
        this.streetAddress = streetAddress;
    }

    public String getSuburb() {
        return this.suburb;
    }

    public void setSuburb(String suburb) {
        this.suburb = suburb;
    }
    
    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getState() {
        return this.state;
    }

    public void setState(String state) {
        this.state = state;
    }

    @DirectMethod
    public static ArrayList<ResponseType> stateTypes() {
        return ResponseType.<State>create(State.values());
    }
    
    @DirectMethod
    public static ArrayList<ResponseType> employeeTypes() {
        return ResponseType.<EmployeeType>create(EmployeeType.values());
    }
    
    @Override
    protected PreparedStatement insert() throws SQLException {
        return Dal.doMutation(new Object[]{this.getEmployeeSectionID(), this.getDepartmentID(), this.getSupervisorID(), this.getEmployeeType(), this.getFirstName(), this.getLastName(), this.getEmailAddress(), this.getStreetAddress(), this.getSuburb(), this.getPostcode(), this.getState()}, Employee.SQL_INSERT);
    }

    @Override
    protected PreparedStatement update() throws SQLException {
        return Dal.doMutation(new Object[]{this.getEmployeeSectionID(), this.getDepartmentID(), this.getSupervisorID(), this.getEmployeeType(), this.getFirstName(), this.getLastName(), this.getEmailAddress(), this.getStreetAddress(), this.getSuburb(), this.getPostcode(), this.getState(), this.getEmployeeID()}, Employee.SQL_UPDATE);
    }
}

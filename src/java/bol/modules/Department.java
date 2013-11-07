package bol.modules;

import bol.BusinessModule;
import bol.BusinessModule.EntityState;
import bol.Constants;
import dal.Dal;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Department extends BusinessModule implements Serializable {

    public static final String SQL_FETCH = "SELECT * FROM employee_departments WHERE department_id = ? LIMIT 1";
    public static final String SQL_LIST = "SELECT * FROM employee_departments";
    public static final String SQL_DELETE = "DELETE FROM employee_departments WHERE department_id = ? LIMIT 1";
    public static final String SQL_TABLE = "employee_departments";
    private static final String SQL_INSERT = "INSERT INTO employee_departments (department_name, street_address, suburb, postcode, state, reception_phone) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SQL_UPDATE = "UPDATE employee_departments SET department_name = ?, street_address = ?, suburb = ?, postcode = ?, state = ?, reception_phone = ? WHERE department_id = ?";
    private int departmentID;
    private String departmentName;
    private String streetAddress;
    private String suburb;
    private String postcode;
    private String state;
    private String receptionPhone;

    public Department() {
    }

    public Department(ResultSet data) {
        try {
            super.setEntityState(EntityState.Unchanged);
            this.setDepartmentID(data.getInt(Constants.DB_FIELD_DEPARTMENT_ID));
            this.setDepartmentName(data.getString(Constants.DB_FIELD_DEPARTMENT_NAME));
            this.setStreetAddress(data.getString(Constants.DB_FIELD_STREET_ADDRESS));
            this.setSuburb(data.getString(Constants.DB_FIELD_SUBURB));
            this.setPostcode(data.getString(Constants.DB_FIELD_POSTCODE));
            this.setState(data.getString(Constants.DB_FIELD_STATE));
            this.setReceptionPhone(data.getString(Constants.DB_FIELD_RECEPTION_PHONE));
        } catch (SQLException ex) {
            Logger.getLogger(Department.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getDepartmentID() {
        return this.departmentID;
    }

    public void setDepartmentID(int departmentID) {
        this.departmentID = departmentID;
    }

    public String getDepartmentName() {
        return this.departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
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
        return this.postcode;
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

    public String getReceptionPhone() {
        return this.receptionPhone;
    }

    public void setReceptionPhone(String receptionPhone) {
        this.receptionPhone = receptionPhone;
    }

    @Override
    protected PreparedStatement insert() throws SQLException {
        return Dal.doMutation(new Object[]{this.getDepartmentName(), this.getStreetAddress(), this.getSuburb(), this.getPostcode(), this.getState(), this.getReceptionPhone()}, Department.SQL_INSERT);
    }

    @Override
    protected PreparedStatement update() throws SQLException {
        return Dal.doMutation(new Object[]{this.getDepartmentName(), this.getStreetAddress(), this.getSuburb(), this.getPostcode(), this.getState(), this.getReceptionPhone(), this.getDepartmentID()}, Department.SQL_UPDATE);
    }
}

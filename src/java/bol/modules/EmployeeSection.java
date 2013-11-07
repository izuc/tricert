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

public class EmployeeSection extends BusinessModule implements Serializable {

    public static final String SQL_FETCH = "SELECT * FROM employee_sections WHERE employee_section_id = ? LIMIT 1";
    public static final String SQL_LIST = "SELECT * FROM employee_sections";
    public static final String SQL_DELETE = "DELETE FROM employee_sections WHERE employee_section_id = ? LIMIT 1";
    public static final String SQL_TABLE = "employee_sections";
    private static final String SQL_INSERT = "INSERT INTO employee_sections (section_title, section_description) VALUES (?, ?)";
    private static final String SQL_UPDATE = "UPDATE employee_sections SET section_title = ?, section_description = ? WHERE employee_section_id = ?";
    private int employeeSectionID;
    private String sectionTitle;
    private String sectionDescription;

    public EmployeeSection() {
    }

    public EmployeeSection(ResultSet data) {
        try {
            super.setEntityState(EntityState.Unchanged);
            this.setEmployeeSectionID(data.getInt(Constants.DB_FIELD_EMPLOYEE_SECTION_ID));
            this.setSectionTitle(data.getString(Constants.DB_FIELD_SECTION_TITLE));
            this.setSectionDescription(data.getString(Constants.DB_FIELD_SECTION_DESCRIPTION));
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeSection.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public EmployeeSection(JsonObject data) {
        this.setEmployeeSectionID(data.get(Constants.PROPERTY_EMPLOYEE_SECTION_ID).getAsInt());
        this.setSectionTitle(data.get(Constants.PROPERTY_SECTION_TITLE).getAsString());
        this.setSectionDescription(data.get(Constants.PROPERTY_SECTION_DESCRIPTION).getAsString());
    }

    public int getEmployeeSectionID() {
        return this.employeeSectionID;
    }

    public void setEmployeeSectionID(int employeeSectionID) {
        this.employeeSectionID = employeeSectionID;
    }

    public String getSectionTitle() {
        return this.sectionTitle;
    }

    public void setSectionTitle(String sectionTitle) {
        this.sectionTitle = sectionTitle;
    }

    public String getSectionDescription() {
        return this.sectionDescription;
    }

    public void setSectionDescription(String sectionDescription) {
        this.sectionDescription = sectionDescription;
    }

    @Override
    protected PreparedStatement insert() throws SQLException {
        return Dal.doMutation(new Object[]{this.getSectionTitle(), this.getSectionDescription()}, EmployeeSection.SQL_INSERT);
    }

    @Override
    protected PreparedStatement update() throws SQLException {
        return Dal.doMutation(new Object[]{this.getSectionTitle(), this.getSectionDescription(), this.getEmployeeSectionID()}, EmployeeSection.SQL_UPDATE);
    }

    @DirectMethod
    public ResponseMessage saveData(JsonArray json) {
        return Socket.saveData(json.get(0).getAsJsonObject(), Constants.PROPERTY_EMPLOYEE_SECTION_ID, this.getClass());
    }
}

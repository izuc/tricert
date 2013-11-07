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

public class TrainingModule extends BusinessModule implements Serializable {

    public static final String SQL_FETCH = "SELECT * FROM training_course_modules WHERE course_module_id = ? LIMIT 1";
    public static final String SQL_LIST = "SELECT * FROM training_course_modules";
    public static final String SQL_DELETE = "DELETE FROM training_course_modules WHERE course_module_id = ? LIMIT 1";
    public static final String SQL_TABLE = "training_course_modules";
    private static final String SQL_INSERT = "INSERT INTO training_course_modules (course_id, course_module_title, course_module_contents) VALUES (?, ?, ?)";
    private static final String SQL_UPDATE = "UPDATE training_course_modules SET course_id = ?, course_module_title = ?, course_module_contents = ? WHERE course_module_id = ?";
    private int courseModuleID;
    private int courseID;
    private String courseModuleTitle;
    private String courseModuleContents;

    public TrainingModule() {
    }

    public TrainingModule(ResultSet data) {
        try {
            super.setEntityState(EntityState.Unchanged);
            this.setCourseModuleID(data.getInt(Constants.DB_FIELD_COURSE_MODULE_ID));
            this.setCourseID(data.getInt(Constants.DB_FIELD_COURSE_ID));
            this.setCourseModuleTitle(data.getString(Constants.DB_FIELD_COURSE_MODULE_TITLE));
            this.setCourseModuleContents(data.getString(Constants.DB_FIELD_COURSE_MODULE_CONTENTS));
        } catch (SQLException ex) {
            Logger.getLogger(TrainingModule.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public TrainingModule(JsonObject data) {
        this.setCourseModuleID(data.get(Constants.PROPERTY_COURSE_MODULE_ID).getAsInt());
        this.setCourseID(data.get(Constants.PROPERTY_COURSE_ID).getAsInt());
        this.setCourseModuleTitle(data.get(Constants.PROPERTY_COURSE_MODULE_TITLE).getAsString());
        this.setCourseModuleContents(data.get(Constants.PROPERTY_COURSE_MODULE_CONTENTS).getAsString());
    }

    public int getCourseModuleID() {
        return this.courseModuleID;
    }

    public void setCourseModuleID(int courseModuleID) {
        this.courseModuleID = courseModuleID;
    }

    public int getCourseID() {
        return this.courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public String getCourseModuleTitle() {
        return this.courseModuleTitle;
    }

    public void setCourseModuleTitle(String courseModuleTitle) {
        this.courseModuleTitle = courseModuleTitle;
    }

    public String getCourseModuleContents() {
        return this.courseModuleContents;
    }

    public void setCourseModuleContents(String courseModuleContents) {
        this.courseModuleContents = courseModuleContents;
    }

    @DirectMethod
    public ResponseMessage saveData(JsonArray json) {
        return Socket.saveData(json.get(0).getAsJsonObject(), Constants.PROPERTY_COURSE_MODULE_ID, this.getClass());
    }

    @Override
    protected PreparedStatement insert() throws SQLException {
        return Dal.doMutation(new Object[]{this.getCourseID(), this.getCourseModuleTitle(), this.getCourseModuleContents()}, TrainingModule.SQL_INSERT);
    }

    @Override
    protected PreparedStatement update() throws SQLException {
        return Dal.doMutation(new Object[]{this.getCourseID(), this.getCourseModuleTitle(), this.getCourseModuleContents(), this.getCourseModuleID()}, TrainingModule.SQL_UPDATE);
    }
}

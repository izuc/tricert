package bol.modules;

import bol.BusinessModule;
import bol.Constants;
import dal.Dal;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TrainingCourse extends BusinessModule implements Serializable {
    public static final String SQL_FETCH = "SELECT * FROM training_courses WHERE course_id = ? LIMIT 1";
    public static final String SQL_LIST = "SELECT * FROM training_courses";
    public static final String SQL_DELETE = "DELETE FROM training_courses WHERE course_id = ? LIMIT 1";
    public static final String SQL_TABLE = "training_courses";
    private static final String SQL_INSERT = "INSERT INTO training_courses (course_title, course_description) VALUES (?, ?)";
    private static final String SQL_UPDATE = "UPDATE training_courses SET course_title = ?, course_description = ? WHERE course_id = ?";
    
    private int courseID;
    private String courseTitle;
    private String courseDescription;
    
    public TrainingCourse() {
        
    }
    
    public TrainingCourse(ResultSet data) {
        try {
            super.setEntityState(EntityState.Unchanged);
            this.setCourseID(data.getInt(Constants.DB_FIELD_COURSE_ID));
            this.setCourseTitle(data.getString(Constants.DB_FIELD_COURSE_TITLE));
            this.setCourseDescription(data.getString(Constants.DB_FIELD_COURSE_DESCRIPTION));
        } catch (SQLException ex) {
            Logger.getLogger(TrainingCourse.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getCourseID() {
        return this.courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public String getCourseTitle() {
        return this.courseTitle;
    }

    public void setCourseTitle(String courseTitle) {
        this.courseTitle = courseTitle;
    }

    public String getCourseDescription() {
        return this.courseDescription;
    }

    public void setCourseDescription(String courseDescription) {
        this.courseDescription = courseDescription;
    }

    @Override
    protected PreparedStatement insert() throws SQLException {
        return Dal.doMutation(new Object[]{this.getCourseTitle(), this.getCourseDescription()}, TrainingCourse.SQL_INSERT);
    }

    @Override
    protected PreparedStatement update() throws SQLException {
        return Dal.doMutation(new Object[]{this.getCourseTitle(), this.getCourseDescription(), this.getCourseID()}, TrainingCourse.SQL_UPDATE);
    }
}

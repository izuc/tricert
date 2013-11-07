package bol.modules;

import bol.BusinessModule;
import bol.Constants;
import bol.util.Response.ResponseType;
import com.google.gson.Gson;
import dal.Dal;
import djn.config.annotations.DirectMethod;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.fileupload.FileItem;

public class AccessGroup extends BusinessModule implements Serializable {

    public static final String SQL_UPDATE = "UPDATE system_access_groups SET group_name = ?, group_description  = ?, group_commands = ? WHERE group_id = ?";
    public static final String SQL_INSERT = "INSERT INTO system_access_groups (group_name, group_description, group_commands) VALUES (?, ?, ?)";
    public static final String SQL_DELETE = "DELETE FROM system_access_groups WHERE group_id = ? LIMIT 1";
    public static final String SQL_FETCH = "SELECT * FROM system_access_groups WHERE group_id = ? LIMIT 1";
    public static final String SQL_LIST = "SELECT * FROM system_access_groups ORDER BY group_name ASC";
    public static final String SQL_TABLE = "system_access_groups";

    public enum CommandType {

        Add, Save, Delete
    };
    private int groupID;
    private String groupName;
    private String groupDescription;
    private int[] groupCommands;

    public AccessGroup() {
    }

    public AccessGroup(ResultSet data) {
        try {
            super.setEntityState(EntityState.Unchanged);
            this.setGroupID(data.getInt(Constants.DB_FIELD_GROUP_ID));
            this.setGroupName(data.getString(Constants.DB_FIELD_GROUP_NAME));
            this.setGroupDescription(data.getString(Constants.DB_FIELD_GROUP_DESCRIPTION));
            this.setGroupCommands(data.getString(Constants.DB_FIELD_GROUP_COMMANDS));
        } catch (SQLException ex) {
            Logger.getLogger(AccessGroup.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getGroupID() {
        return this.groupID;
    }

    public void setGroupID(int groupID) {
        this.groupID = groupID;
    }

    public String getGroupName() {
        return this.groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getGroupDescription() {
        return this.groupDescription;
    }

    public void setGroupDescription(String groupDescription) {
        this.groupDescription = groupDescription;
    }

    public int[] getGroupCommands() {
        return this.groupCommands;
    }

    public void setGroupCommands(String groupCommands) {
        Gson gson = new Gson();
        this.groupCommands = gson.fromJson(groupCommands, int[].class);
    }

    @DirectMethod
    public static List<ResponseType> commandTypes() {
        return ResponseType.<CommandType>create(CommandType.values());
    }

    @Override
    protected PreparedStatement insert() throws SQLException {
        Gson gson = new Gson();
        return Dal.doMutation(new Object[]{this.getGroupName(), this.getGroupDescription(), gson.toJson(this.getGroupCommands(), int[].class)}, AccessGroup.SQL_INSERT);
    }

    @Override
    protected PreparedStatement update() throws SQLException {
        Gson gson = new Gson();
        return Dal.doMutation(new Object[]{this.getGroupName(), this.getGroupDescription(), gson.toJson(this.getGroupCommands(), int[].class), this.getGroupID()}, AccessGroup.SQL_UPDATE);
    }

    @Override
    public void save(Map<String, String> formParameters, Map<String, FileItem> fileFields) throws SQLException {
        this.setGroupCommands(formParameters.get(Constants.PROPERTY_GROUP_COMMANDS));
        switch (this.getEntityState()) {
            case Added:
                this.insert();
                break;
            case Modified:
                this.update();
                break;
        }
    }
}
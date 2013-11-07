package bol.modules;

import bol.BusinessModule;
import bol.Constants;
import bol.Socket;
import bol.util.Response.ResponseType;
import com.google.gson.Gson;
import djn.config.annotations.DirectMethod;
import dal.Dal;
import java.io.File;
import java.io.Serializable;
import java.net.URLDecoder;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.fileupload.FileItem;

public class Module extends BusinessModule implements Serializable {

    public static final String SQL_FETCH = "SELECT * FROM system_modules WHERE module_id = ? LIMIT 1";
    public static final String SQL_DELETE = "DELETE FROM system_modules WHERE module_id = ? LIMIT 1";
    public static final String SQL_LIST = "SELECT * FROM system_modules";
    public static final String SQL_TABLE = "system_modules";
    private static final String SQL_UPDATE = "UPDATE system_modules SET module_title = ?, module_icon = ?, module_source = ?, module_name = ?, module_commands = ? WHERE module_id = ?";
    private static final String SQL_INSERT = "INSERT INTO system_modules (module_title, module_icon, module_source, module_name, module_commands) VALUES (?, ?, ?, ?, ?)";
    private static final String DEFAULT_MODULE_ICON = "application.png";
    private int moduleID;
    private String moduleTitle;
    private String moduleIcon;
    private String moduleSource;
    private String moduleName;
    private int[] moduleCommands;

    public Module() {
    }

    public Module(ResultSet data) {
        try {
            super.setEntityState(EntityState.Unchanged);
            this.setModuleID(data.getInt(Constants.DB_FIELD_MODULE_ID));
            this.setModuleTitle(data.getString(Constants.DB_FIELD_MODULE_TITLE));
            this.setModuleIcon(data.getString(Constants.DB_FIELD_MODULE_ICON));
            this.setModuleSource(data.getString(Constants.DB_FIELD_MODULE_SOURCE));
            this.setModuleName(data.getString(Constants.DB_FIELD_MODULE_NAME));
            this.setModuleCommands(data.getString(Constants.DB_FIELD_MODULE_COMMANDS));
        } catch (SQLException ex) {
            Logger.getLogger(Module.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getModuleID() {
        return this.moduleID;
    }

    public void setModuleID(int moduleID) {
        this.moduleID = moduleID;
    }

    public String getModuleTitle() {
        return moduleTitle;
    }

    public void setModuleTitle(String moduleTitle) {
        this.moduleTitle = moduleTitle;
    }

    public String getModuleIcon() {
        return moduleIcon;
    }

    public String getIconPath() {
        return Constants.ICON_IMG_PATH + ((!this.getModuleIcon().equals(Constants.EMPTY_STRING)) ? this.getModuleIcon() + Constants.ICON_EXT : Module.DEFAULT_MODULE_ICON);
    }

    public void setModuleIcon(String moduleIcon) {
        this.moduleIcon = moduleIcon;
    }

    public String getModuleName() {
        return this.moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public int[] getModuleCommands() {
        return this.moduleCommands;
    }

    public void setModuleCommands(String moduleCommands) {
        Gson gson = new Gson();
        this.moduleCommands = gson.fromJson(moduleCommands, int[].class);
    }

    public String getModuleSource() {
        return this.moduleSource;
    }

    public void setModuleSource(String moduleSource) {
        this.moduleSource = moduleSource;
    }

    @Override
    protected PreparedStatement insert() throws SQLException {
        Gson gson = new Gson();
        return Dal.doMutation(new Object[]{this.getModuleTitle(), this.getModuleIcon(), this.getModuleSource(), this.getModuleName(), gson.toJson(this.getModuleCommands(), int[].class)}, Module.SQL_INSERT);
    }

    @Override
    protected PreparedStatement update() throws SQLException {
        Gson gson = new Gson();
        return Dal.doMutation(new Object[]{this.getModuleTitle(), this.getModuleIcon(), this.getModuleSource(), this.getModuleName(), gson.toJson(this.getModuleCommands(), int[].class), this.getModuleID()}, Module.SQL_UPDATE);
    }

    @Override
    public void save(Map<String, String> formParameters, Map<String, FileItem> fileFields) throws SQLException {
        this.setModuleCommands(formParameters.get(Constants.PROPERTY_MODULE_COMMANDS));
        switch (this.getEntityState()) {
            case Added:
                this.insert();
                break;
            case Modified:
                this.update();
                break;
        }
    }

    @DirectMethod
    public static ArrayList<ResponseType> getSimpleList() {
        ArrayList<ResponseType> list = new ArrayList<ResponseType>();
        for (Module module : Socket.<Module>list(new Object[]{}, Module.SQL_LIST, Module.class, Dal.StatmentType.preparedStatment)) {
            list.add(new ResponseType(module.getModuleID(), module.getModuleTitle()));
        }
        return list;
    }

    @DirectMethod
    public static ArrayList<ResponseType> getModuleList() {
        ArrayList<ResponseType> list = new ArrayList<ResponseType>();
        try {
            File directory = new File(URLDecoder.decode(Thread.currentThread().getContextClassLoader().getResource(Module.class.getPackage().getName().replace('.', '/')).getFile(), "UTF-8"));
            if (directory.isDirectory()) {
                int index = 0;
                for (File file : directory.listFiles()) {
                    if (file.getName().endsWith(Constants.DOT_CLASS)) {
                        Class clazz = Class.forName(Module.class.getPackage().getName() + Constants.DOT + file.getName().replace(Constants.DOT_CLASS, Constants.EMPTY_STRING));
                        if (clazz.getSuperclass().equals(BusinessModule.class)) {
                            list.add(new ResponseType(index, clazz.getSimpleName()));
                        }
                    }
                    index++;
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(Module.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}

package bol.modules;

import dal.Dal;
import bol.BusinessModule;
import bol.Constants;
import bol.Socket;
import bol.util.Response.ResponseMenuItem;
import bol.util.Response.ResponseNode;
import bol.util.Response.ResponseType;
import djn.config.annotations.DirectMethod;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Category extends BusinessModule implements Serializable {

    public static final String SQL_DELETE = "DELETE FROM system_categories WHERE category_id = ? LIMIT 1";
    public static final String SQL_FETCH = "SELECT * FROM system_categories WHERE category_id = ? LIMIT 1";
    public static final String SQL_LIST = "SELECT * FROM system_categories";
    public static final String SQL_TABLE = "system_categories";
    private static final String SQL_INSERT = "INSERT INTO system_categories (category_parent, category_title, category_type, category_icon) VALUES (?, ?, ?, ?)";
    private static final String SQL_UPDATE = "UPDATE system_categories SET category_parent = ?, category_title = ?, category_type = ?, category_icon = ? WHERE category_id = ?";
    private static final String SQL_LIST_PARENT_TYPE = "SELECT * FROM system_categories WHERE category_parent = ? AND category_type = ? ORDER BY category_title ASC";
    private static final String SQL_LIST_PARENT = "SELECT * FROM system_categories WHERE category_parent = ? ORDER BY category_title ASC";
    private static final String DEFAULT_CATEGORY_ICON = "folder.png";
    private static final String FN_CREATE_SUB_MENU = "TricertAssist.navigation.createMenu";
    private static final String FN_LOAD_MODULE = "TricertAssist.loadModule";

    public enum CategoryType {

        Navigation, Administration
    };
    private int categoryID;
    private int categoryParent;
    private String categoryTitle;
    private String categoryIcon;
    private int categoryType;

    public Category() {
    }

    public Category(ResultSet data) {
        try {
            super.setEntityState(EntityState.Unchanged);
            this.setCategoryID(data.getInt(Constants.DB_FIELD_CATEGORY_ID));
            this.setCategoryParent(data.getInt(Constants.DB_FIELD_CATEGORY_PARENT));
            this.setCategoryTitle(data.getString(Constants.DB_FIELD_CATEGORY_TITLE));
            this.setCategoryType(data.getInt(Constants.DB_FIELD_CATEGORY_TYPE));
            this.setCategoryIcon(data.getString(Constants.DB_FIELD_CATEGORY_ICON));
        } catch (SQLException ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getCategoryID() {
        return this.categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public int getCategoryParent() {
        return this.categoryParent;
    }

    public void setCategoryParent(int categoryParent) {
        this.categoryParent = categoryParent;
    }

    public String getCategoryTitle() {
        return this.categoryTitle;
    }

    public void setCategoryTitle(String categoryTitle) {
        if (this.getEntityState() == EntityState.Unchanged ||
                this.getValidation().validateLength(Constants.PROPERTY_CATEGORY_TITLE, categoryTitle, 5, 20)) {
            this.categoryTitle = categoryTitle;
        }
    }

    public String getCategoryIcon() {
        return this.categoryIcon;
    }

    public String getIconPath() {
        return Constants.ICON_IMG_PATH + ((!this.getCategoryIcon().equals(Constants.EMPTY_STRING)) ? this.getCategoryIcon() + Constants.ICON_EXT : Category.DEFAULT_CATEGORY_ICON);
    }

    public void setCategoryIcon(String categoryIcon) {
        this.categoryIcon = categoryIcon;
    }

    public int getCategoryType() {
        return this.categoryType;
    }

    public void setCategoryType(int categoryType) {
        this.categoryType = categoryType;
    }

    public static ArrayList<BusinessModule> list(int parent, CategoryType type) throws SQLException {
        return (ArrayList<BusinessModule>) Socket.<BusinessModule>list(new Object[]{parent, type.ordinal()}, Category.SQL_LIST_PARENT_TYPE, Category.class, Dal.StatmentType.preparedStatment);
    }

    @DirectMethod
    public static ArrayList<ResponseMenuItem> getMenu(int parent) {
        ArrayList<ResponseMenuItem> menu = new ArrayList<ResponseMenuItem>();
        try {
            ArrayList<BusinessModule> items = new ArrayList<BusinessModule>();
            User user = User.getLoggedInUser();
            if (user != null) {
                items.addAll(Category.list(parent, CategoryType.Navigation));
                if (user.isAdminAccount()) {
                    items.addAll(Category.list(parent, CategoryType.Administration));
                }
                items.addAll(Section.grantedSections(user.getAccessGroup(), parent));
                for (BusinessModule object : items) {
                    ResponseMenuItem item = new ResponseMenuItem();
                    if (object instanceof Category) {
                        Category category = (Category) object;
                        item.setText(category.getCategoryTitle());
                        item.setIcon(category.getIconPath());
                        item.setMenu(Category.FN_CREATE_SUB_MENU + "(" + category.getCategoryID() + ")");
                    } else if (object instanceof Section) {
                        Module module = ((Section) object).getModule();
                        item.setText(module.getModuleTitle());
                        item.setHandler("function () { " + Category.FN_LOAD_MODULE + "(" + module.getModuleID() + "); }");
                        item.setIcon(module.getIconPath());
                    }
                    item.setScale(ResponseMenuItem.SCALE);
                    item.setCls(ResponseMenuItem.CLS);

                    menu.add(item);
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(Category.class.getName()).log(Level.SEVERE, null, ex);
        }
        return menu;
    }

    @DirectMethod
    public static ArrayList<ResponseNode> getTree(String parent) throws SQLException {
        ArrayList<ResponseNode> tree = new ArrayList<ResponseNode>();
        for (Category c : Socket.<Category>list(new Object[]{Integer.valueOf(parent)}, Category.SQL_LIST_PARENT, Category.class, Dal.StatmentType.preparedStatment)) {
            tree.add(new ResponseNode(Integer.toString(c.getCategoryID()), c.getCategoryTitle(), (Dal.getCount(Category.SQL_TABLE, " WHERE category_parent = " + c.getCategoryID()) == 0)));
        }
        return tree;
    }

    @DirectMethod
    public static ArrayList<ResponseType> categoryTypes() {
        return ResponseType.<CategoryType>create(CategoryType.values());
    }

    @Override
    protected PreparedStatement insert() throws SQLException {
        return Dal.doMutation(new Object[]{this.getCategoryParent(), this.getCategoryTitle(), this.getCategoryType(), this.getCategoryIcon()}, Category.SQL_INSERT);
    }

    @Override
    protected PreparedStatement update() throws SQLException {
        return Dal.doMutation(new Object[]{this.getCategoryParent(), this.getCategoryTitle(), this.getCategoryType(), this.getCategoryIcon(), this.getCategoryID()}, Category.SQL_UPDATE);
    }
}

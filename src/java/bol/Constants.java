package bol;

public class Constants {

    public static final String SESSION_USER_PROPERTY = "User";
    public static final String SESSION_LOG_PROPERTY = "SessionLog";
    public static final String EMPTY_STRING = "";
    public static final String DOT_CLASS = ".class";
    public static final String DOT = ".";
    public static final String ICON_IMG_PATH = "theme/images/icons/";
    public static final String ICON_EXT = ".png";
    public static final String MSG_SAVE_SUCCESS = "The data has been saved successfully.";
    public static final String MSG_SAVE_FAILED = "The data entered does not meet the validation criteria";
    public static final String TITLE_SAVE_SUCCESS = "Data Saved Successfully";
    public static final String TITLE_SAVE_FAILED = "Save Failed";
    // Users
    public static final String PROPERTY_USER_ID = "userID";
    public static final String PROPERTY_USER_NAME = "userName";
    public static final String PROPERTY_PASSWORD = "password";
    public static final String PROPERTY_CONFIRMATION_PASSWORD = "confirmationPassword";
    public static final String PROPERTY_USER_TYPE = "userType";
    public static final String DB_FIELD_USER_ID = "user_id";
    public static final String DB_FIELD_USER_NAME = "user_name";
    public static final String DB_FIELD_PASSWORD = "user_password";
    public static final String DB_FIELD_USER_TYPE = "user_type";
    // Access Groups
    public static final String PROPERTY_GROUP_ID = "groupID";
    public static final String PROPERTY_GROUP_NAME = "groupName";
    public static final String PROPERTY_GROUP_DESCRIPTION = "groupDescription";
    public static final String PROPERTY_GROUP_COMMANDS = "groupCommands";
    public static final String DB_FIELD_GROUP_ID = "group_id";
    public static final String DB_FIELD_GROUP_NAME = "group_name";
    public static final String DB_FIELD_GROUP_DESCRIPTION = "group_description";
    public static final String DB_FIELD_GROUP_COMMANDS = "group_commands";
    // Category
    public static final String PROPERTY_CATEGORY_ID = "categoryID";
    public static final String PROPERTY_CATEGORY_PARENT = "categoryParent";
    public static final String PROPERTY_CATEGORY_TITLE = "categoryTitle";
    public static final String PROPERTY_CATEGORY_ICON = "categoryIcon";
    public static final String PROPERTY_CATEGORY_TYPE = "categoryType";
    public static final String DB_FIELD_CATEGORY_ID = "category_id";
    public static final String DB_FIELD_CATEGORY_PARENT = "category_parent";
    public static final String DB_FIELD_CATEGORY_TITLE = "category_title";
    public static final String DB_FIELD_CATEGORY_TYPE = "category_type";
    public static final String DB_FIELD_CATEGORY_ICON = "category_icon";
    // Session Logs
    public static final String PROPERTY_SESSION_ID = "sessionID";
    public static final String PROPERTY_SESSION_DATE = "sessionDate";
    public static final String PROPERTY_VISIT_ID = "visitID";
    public static final String PROPERTY_VISIT_TIME = "visitTime";
    public static final String DB_FIELD_SESSION_ID = "session_id";
    public static final String DB_FIELD_SESSION_DATE = "session_date";
    public static final String DB_FIELD_VISIT_ID = "visit_id";
    public static final String DB_FIELD_VISIT_TIME = "visit_time";
    // Section
    public static final String PROPERTY_SECTION_ID = "sectionID";
    public static final String DB_FIELD_SECTION_ID = "section_id";
    // Module
    public static final String PROPERTY_MODULE_ID = "moduleID";
    public static final String PROPERTY_MODULE_TITLE = "moduleTitle";
    public static final String PROPERTY_MODULE_ICON = "moduleIcon";
    public static final String PROPERTY_MODULE_NAME = "moduleName";
    public static final String PROPERTY_MODULE_COMMANDS = "moduleCommands";
    public static final String PROPERTY_MODULE_SOURCE = "moduleSource";
    public static final String DB_FIELD_MODULE_ID = "module_id";
    public static final String DB_FIELD_MODULE_TITLE = "module_title";
    public static final String DB_FIELD_MODULE_ICON = "module_icon";
    public static final String DB_FIELD_MODULE_NAME = "module_name";
    public static final String DB_FIELD_MODULE_COMMANDS = "module_commands";
    public static final String DB_FIELD_MODULE_SOURCE = "module_source";
    // Permission    
    public static final String PROPERTY_PERMISSION_ID = "permissionID";
    public static final String PROPERTY_LINK_ID = "linkID";
    public static final String PROPERTY_PERMISSION_TYPE = "permissionType";
    public static final String DB_FIELD_PERMISSION_ID = "permission_id";
    public static final String DB_FIELD_LINK_ID = "link_id";
    public static final String DB_FIELD_PERMISSION_TYPE = "permission_type";
    // Department
    public static String DB_FIELD_DEPARTMENT_ID = "department_id";
    public static String DB_FIELD_DEPARTMENT_NAME = "department_name";
    public static String DB_FIELD_RECEPTION_PHONE = "reception_phone";
    public static String DB_FIELD_EMPLOYEE_SECTION_ID = "employee_section_id";
    public static String DB_FIELD_MANAGER_ID = "manager_id";
    public static String PROPERTY_DEPARTMENT_ID = "departmentID";
    public static String PROPERTY_EMPLOYEE_SECTION_ID = "employeeSectionID";
    public static String PROPERTY_MANAGER_ID = "managerID";
    public static String PROPERTY_SECTION_TITLE = "sectionTitle";
    public static String PROPERTY_SECTION_DESCRIPTION = "sectionDescription";
    public static String DB_FIELD_SECTION_TITLE = "section_title";
    public static String DB_FIELD_SECTION_DESCRIPTION = "section_description";
    // Employee
    public static final String PROPERTY_EMPLOYEE_ID = "employeeID";
    public static final String PROPERTY_SUPERVISOR_ID = "supervisorID";
    public static final String PROPERTY_EMPLOYEE_TYPE = "employeeType";
    public static final String PROPERTY_FIRST_NAME = "firstName";
    public static final String PROPERTY_LAST_NAME = "lastName";
    public static final String PROPERTY_EMAIL_ADDRESS = "emailAddress";
    public static final String PROPERTY_STREET_ADDRESS = "streetAddress";
    public static final String PROPERTY_SUBURB = "suburb";
    public static final String PROPERTY_POSTCODE = "postcode";
    public static final String PROPERTY_STATE = "state";
    public static final String DB_FIELD_EMPLOYEE_ID = "employee_id";
    public static final String DB_FIELD_SECTIONALISED_ID = "sectionalised_id";
    public static final String DB_FIELD_SUPERVISOR_ID = "supervisor_id";
    public static final String DB_FIELD_EMPLOYEE_TYPE = "employee_type";
    public static final String DB_FIELD_FIRST_NAME = "first_name";
    public static final String DB_FIELD_LAST_NAME = "last_name";
    public static final String DB_FIELD_EMAIL_ADDRESS = "email_address";
    public static final String DB_FIELD_STREET_ADDRESS = "street_address";
    public static final String DB_FIELD_SUBURB = "suburb";
    public static final String DB_FIELD_POSTCODE = "postcode";
    public static final String DB_FIELD_STATE = "state";
    //Employee License
    public static final String DB_FIELD_LICENSE_ID = "license_id";
    public static final String DB_FIELD_LICENSE_TYPE = "license_type";
    public static final String DB_FIELD_LICENSE_NUMBER = "license_number";
    public static final String DB_FIELD_LICENSE_CLASS = "license_class";
    public static final String PROPERTY_LICENSE_ID = "licenseID";
    public static final String PROPERTY_LICENSE_TYPE = "licenseType";
    public static final String PROPERTY_LICENSE_NUMBER = "licenseNumber";
    public static final String PROPERTY_LICENSE_CLASS = "licenseClass";
    //Employee Qualifications
    public static final String DB_FIELD_QUALIFICATION_ID = "qualification_id";
    public static final String DB_FIELD_QUALIFICATION_LEVEL = "qualification_level";
    public static final String DB_FIELD_QUALIFICATION_TITLE = "qualification_title";
    public static final String DB_FIELD_DATE_OBTAINED = "date_obtained";
    public static final String DB_FIELD_INSTITUTE = "institute";
    public static final String PROPERTY_QUALIFICATION_ID = "qualificationID";
    public static final String PROPERTY_QUALIFICATION_LEVEL = "qualificationLevel";
    public static final String PROPERTY_QUALIFICATION_TITLE = "qualificationTitle";
    public static final String PROPERTY_DATE_OBTAINED = "dateObtained";
    public static final String PROPERTY_INSTITUTE = "institute";
    //Employee Phone Number
    public static final String DB_FIELD_PHONE_ID = "phone_id";
    public static final String DB_FIELD_CONTACT_INFORMATION = "contact_information";
    public static final String DB_FIELD_CONTACT_NUMBER = "contact_number";
    public static final String PROPERTY_PHONE_ID = "phoneID";
    public static final String PROPERTY_CONTACT_INFORMATION = "contactInformation";
    public static final String PROPERTY_CONTACT_NUMBER = "contactNumber";
    // Training Courses
    public static final String DB_FIELD_COURSE_ID = "course_id";
    public static final String DB_FIELD_COURSE_TITLE = "course_title";
    public static final String DB_FIELD_COURSE_DESCRIPTION = "course_description";
    public static final String PROPERTY_COURSE_ID = "courseID";
    public static final String PROPERTY_COURSE_TITLE = "courseTitle";
    public static final String PROPERTY_COURSE_DESCRIPTION = "courseDescription";
    // Training Course Modules
    public static final String DB_FIELD_COURSE_MODULE_ID = "course_module_id";
    public static final String DB_FIELD_COURSE_MODULE_TITLE = "course_module_title";
    public static final String DB_FIELD_COURSE_MODULE_CONTENTS = "course_module_contents";
    public static final String PROPERTY_COURSE_MODULE_ID = "courseModuleID";
    public static final String PROPERTY_COURSE_MODULE_TITLE = "courseModuleTitle";
    public static final String PROPERTY_COURSE_MODULE_CONTENTS = "courseModuleContents";
}

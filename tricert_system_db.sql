-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 10, 2010 at 11:10 PM
-- Server version: 5.0.51
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tricert_system`
--
CREATE DATABASE `tricert_system` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tricert_system`;

-- --------------------------------------------------------

--
-- Table structure for table `action_items_raised`
--

CREATE TABLE IF NOT EXISTS `action_items_raised` (
  `raised_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `link_id` int(11) NOT NULL,
  `raised_type` int(11) NOT NULL,
  PRIMARY KEY  (`raised_id`),
  KEY `user_id` (`user_id`),
  KEY `action_id` (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `action_items_raised`
--


-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE IF NOT EXISTS `actions` (
  `action_id` int(11) NOT NULL auto_increment,
  `employee_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `action_type` int(11) NOT NULL,
  `action_title` varchar(25) NOT NULL,
  `action_goal` varchar(100) NOT NULL,
  `action_taken` varchar(100) NOT NULL,
  `action_cause` varchar(100) NOT NULL,
  `action_corrective_plan` varchar(100) NOT NULL,
  `action_status` int(11) NOT NULL,
  `date_submitted` year(4) NOT NULL,
  `date_targeted` datetime NOT NULL,
  `date_completed` datetime NOT NULL,
  `require_more_training` int(11) NOT NULL,
  `require_more_documentation` int(11) NOT NULL,
  PRIMARY KEY  (`action_id`),
  KEY `employee_id` (`employee_id`),
  KEY `section_id` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `actions`
--


-- --------------------------------------------------------

--
-- Table structure for table `audit_items`
--

CREATE TABLE IF NOT EXISTS `audit_items` (
  `audit_item_id` int(11) NOT NULL auto_increment,
  `audit_id` int(11) NOT NULL,
  `audit_item_title` varchar(25) NOT NULL,
  `audit_item_content` varchar(500) NOT NULL,
  PRIMARY KEY  (`audit_item_id`),
  KEY `audit_id` (`audit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `audit_items`
--


-- --------------------------------------------------------

--
-- Table structure for table `audit_scheduled_item`
--

CREATE TABLE IF NOT EXISTS `audit_scheduled_item` (
  `scheduled_item_id` int(11) NOT NULL auto_increment,
  `audit_id` int(11) NOT NULL,
  `audit_item_id` int(11) NOT NULL,
  `item_date_scheduled` datetime NOT NULL,
  `item_findings` varchar(500) NOT NULL,
  `item_status` int(11) NOT NULL,
  PRIMARY KEY  (`scheduled_item_id`),
  KEY `audit_id` (`audit_id`),
  KEY `audit_item_id` (`audit_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `audit_scheduled_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `audits`
--

CREATE TABLE IF NOT EXISTS `audits` (
  `audit_id` int(11) NOT NULL auto_increment,
  `audit_title` varchar(25) NOT NULL,
  `audit_requirements` varchar(500) NOT NULL,
  PRIMARY KEY  (`audit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `audits`
--


-- --------------------------------------------------------

--
-- Table structure for table `document_access_log`
--

CREATE TABLE IF NOT EXISTS `document_access_log` (
  `document_log_id` int(11) NOT NULL auto_increment,
  `version_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `datetime_viewed` datetime NOT NULL,
  PRIMARY KEY  (`document_log_id`),
  KEY `version_id` (`version_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `document_access_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `document_versions`
--

CREATE TABLE IF NOT EXISTS `document_versions` (
  `version_id` int(11) NOT NULL auto_increment,
  `document_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `version_title` varchar(25) NOT NULL,
  `version_file` varchar(25) NOT NULL,
  `version_changes` varchar(250) NOT NULL,
  PRIMARY KEY  (`version_id`),
  KEY `user_id` (`user_id`),
  KEY `document_id` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `document_versions`
--


-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE IF NOT EXISTS `documents` (
  `document_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `document_name` varchar(25) NOT NULL,
  `document_submitted_date` datetime NOT NULL,
  `document_review_date` datetime NOT NULL,
  PRIMARY KEY  (`document_id`),
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `documents`
--


-- --------------------------------------------------------

--
-- Table structure for table `employee_departments`
--

CREATE TABLE IF NOT EXISTS `employee_departments` (
  `department_id` int(11) NOT NULL auto_increment,
  `department_name` varchar(20) NOT NULL,
  `street_address` varchar(25) NOT NULL,
  `suburb` varchar(15) NOT NULL,
  `postcode` char(4) NOT NULL,
  `state` char(3) NOT NULL,
  `reception_phone` char(10) NOT NULL,
  PRIMARY KEY  (`department_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `employee_departments`
--

INSERT INTO `employee_departments` (`department_id`, `department_name`, `street_address`, `suburb`, `postcode`, `state`, `reception_phone`) VALUES
(1, 'Gosford', '10 Wendy Drive', 'Point Clare', '2250', 'NSW', '651651'),
(2, 'Testomgg', '10 Oxley Place', 'Point Clare', '2250', 'NSW', '56642');

-- --------------------------------------------------------

--
-- Table structure for table `employee_licenses`
--

CREATE TABLE IF NOT EXISTS `employee_licenses` (
  `license_id` int(11) NOT NULL auto_increment,
  `employee_id` int(11) NOT NULL,
  `license_type` int(11) NOT NULL,
  `license_number` varchar(15) NOT NULL,
  `license_class` varchar(10) NOT NULL,
  PRIMARY KEY  (`license_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=11 ;

--
-- Dumping data for table `employee_licenses`
--

INSERT INTO `employee_licenses` (`license_id`, `employee_id`, `license_type`, `license_number`, `license_class`) VALUES
(4, 2, 1, 'tert55', 'ergrg'),
(7, 1, 0, '4645649g', 'ClassCd'),
(8, 1, 0, 'gfdgdfglll', 'dgdfgdfg'),
(10, 1, 1, 'hhhhhhhhhff', 'fdhgfh5');

-- --------------------------------------------------------

--
-- Table structure for table `employee_notifications`
--

CREATE TABLE IF NOT EXISTS `employee_notifications` (
  `notification_id` int(11) NOT NULL auto_increment,
  `employee_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `notification_status` int(11) NOT NULL,
  PRIMARY KEY  (`notification_id`),
  KEY `employee_id` (`employee_id`),
  KEY `section_id` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `employee_notifications`
--


-- --------------------------------------------------------

--
-- Table structure for table `employee_phone_registry`
--

CREATE TABLE IF NOT EXISTS `employee_phone_registry` (
  `phone_id` int(11) NOT NULL auto_increment,
  `employee_id` int(11) NOT NULL,
  `contact_information` varchar(25) NOT NULL,
  `contact_number` char(10) NOT NULL,
  PRIMARY KEY  (`phone_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=2 ;

--
-- Dumping data for table `employee_phone_registry`
--

INSERT INTO `employee_phone_registry` (`phone_id`, `employee_id`, `contact_information`, `contact_number`) VALUES
(1, 1, 'ggdfgdgdfg', '35345345');

-- --------------------------------------------------------

--
-- Table structure for table `employee_qualifications`
--

CREATE TABLE IF NOT EXISTS `employee_qualifications` (
  `qualification_id` int(11) NOT NULL auto_increment,
  `employee_id` int(11) NOT NULL,
  `qualification_title` varchar(50) NOT NULL,
  `qualification_level` int(11) NOT NULL,
  `date_obtained` datetime NOT NULL,
  `institute` varchar(25) NOT NULL,
  PRIMARY KEY  (`qualification_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `employee_qualifications`
--

INSERT INTO `employee_qualifications` (`qualification_id`, `employee_id`, `qualification_title`, `qualification_level`, `date_obtained`, `institute`) VALUES
(1, 1, 'dfgdfgdf', 0, '2010-02-04 00:00:00', 'dgdgg');

-- --------------------------------------------------------

--
-- Table structure for table `employee_sections`
--

CREATE TABLE IF NOT EXISTS `employee_sections` (
  `employee_section_id` int(11) NOT NULL auto_increment,
  `section_title` varchar(25) NOT NULL,
  `section_description` varchar(100) NOT NULL,
  PRIMARY KEY  (`employee_section_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=4 ;

--
-- Dumping data for table `employee_sections`
--

INSERT INTO `employee_sections` (`employee_section_id`, `section_title`, `section_description`) VALUES
(1, 'Human Resources', ''),
(3, 'Accounting', '');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE IF NOT EXISTS `employees` (
  `employee_id` int(11) NOT NULL auto_increment,
  `employee_section_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `supervisor_id` int(11) NOT NULL,
  `employee_type` int(11) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `email_address` varchar(50) NOT NULL,
  `street_address` varchar(25) NOT NULL,
  `suburb` varchar(15) NOT NULL,
  `postcode` char(4) NOT NULL,
  `state` char(3) NOT NULL,
  PRIMARY KEY  (`employee_id`),
  KEY `sectionalised_id` (`employee_section_id`),
  KEY `supervisor_id` (`supervisor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `employee_section_id`, `department_id`, `supervisor_id`, `employee_type`, `first_name`, `last_name`, `email_address`, `street_address`, `suburb`, `postcode`, `state`) VALUES
(1, 1, 1, 0, 1, 'Administration', 'Account', 'admin@tricert.com.au', '13 April Drive', 'Point Clare', '2250', 'NSW'),
(2, 1, 1, 0, 2, 'Lance', 'Baker', 'admin@izuc.net', '18 Jeff Drive', 'Point Clare', '2250', 'NSW');

-- --------------------------------------------------------

--
-- Table structure for table `form_data`
--

CREATE TABLE IF NOT EXISTS `form_data` (
  `form_data_id` int(11) NOT NULL auto_increment,
  `field_id` int(11) NOT NULL,
  `form_instance_id` int(11) NOT NULL,
  `field_data` varchar(500) NOT NULL,
  PRIMARY KEY  (`form_data_id`),
  KEY `field_id` (`field_id`),
  KEY `form_instance_id` (`form_instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `form_data`
--


-- --------------------------------------------------------

--
-- Table structure for table `form_fields`
--

CREATE TABLE IF NOT EXISTS `form_fields` (
  `field_id` int(11) NOT NULL auto_increment,
  `label_id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  PRIMARY KEY  (`field_id`),
  KEY `FKfields_label_id` (`label_id`),
  KEY `FKfields_form_id` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `form_fields`
--


-- --------------------------------------------------------

--
-- Table structure for table `form_instances`
--

CREATE TABLE IF NOT EXISTS `form_instances` (
  `form_instance_id` int(11) NOT NULL auto_increment,
  `form_id` int(11) NOT NULL,
  `form_submission_date` datetime NOT NULL,
  `form_status` int(11) NOT NULL,
  PRIMARY KEY  (`form_instance_id`),
  KEY `form_id` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT AUTO_INCREMENT=1 ;

--
-- Dumping data for table `form_instances`
--


-- --------------------------------------------------------

--
-- Table structure for table `form_labels`
--

CREATE TABLE IF NOT EXISTS `form_labels` (
  `label_id` int(11) NOT NULL auto_increment,
  `label_title` varchar(50) NOT NULL,
  PRIMARY KEY  (`label_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `form_labels`
--


-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE IF NOT EXISTS `forms` (
  `form_id` int(11) NOT NULL auto_increment,
  `category_id` int(11) NOT NULL,
  `form_title` varchar(25) NOT NULL,
  PRIMARY KEY  (`form_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `forms`
--


-- --------------------------------------------------------

--
-- Table structure for table `system_access_groups`
--

CREATE TABLE IF NOT EXISTS `system_access_groups` (
  `group_id` int(11) NOT NULL auto_increment,
  `group_name` varchar(25) NOT NULL,
  `group_description` varchar(250) NOT NULL,
  `group_commands` varchar(100) NOT NULL,
  PRIMARY KEY  (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `system_access_groups`
--

INSERT INTO `system_access_groups` (`group_id`, `group_name`, `group_description`, `group_commands`) VALUES
(1, 'Level 1 Access', 'gdfgf dfgdfgdgdfgdfgdfgdfg', '[1,0,2]'),
(2, 'Awesomeness', 'Too Goodfffff', '[1]'),
(3, 'Level 2 Accessd', 'GGGGGGGGGGGGGGG', '[0]');

-- --------------------------------------------------------

--
-- Table structure for table `system_categories`
--

CREATE TABLE IF NOT EXISTS `system_categories` (
  `category_id` int(11) NOT NULL auto_increment,
  `category_parent` int(11) NOT NULL,
  `category_title` varchar(25) NOT NULL,
  `category_type` int(11) NOT NULL,
  `category_icon` varchar(25) NOT NULL,
  PRIMARY KEY  (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `system_categories`
--

INSERT INTO `system_categories` (`category_id`, `category_parent`, `category_title`, `category_type`, `category_icon`) VALUES
(1, 0, 'Site Administration', 1, 'application_osx_terminal'),
(2, 1, 'User Management', 1, 'user_edit'),
(3, 0, 'Document Library', 0, 'book_edit'),
(4, 0, 'Schedule', 0, 'calendar_select_week'),
(5, 0, 'OH & S', 0, 'brick'),
(6, 0, 'Quality', 0, 'award_star_gold_1'),
(7, 0, 'Human Resources', 0, 'folder_user'),
(8, 7, 'Training', 0, 'shape_square_edit');

-- --------------------------------------------------------

--
-- Table structure for table `system_modules`
--

CREATE TABLE IF NOT EXISTS `system_modules` (
  `module_id` int(11) NOT NULL auto_increment,
  `module_title` varchar(25) NOT NULL,
  `module_icon` varchar(25) NOT NULL,
  `module_source` text NOT NULL,
  `module_name` varchar(25) NOT NULL,
  `module_commands` varchar(100) NOT NULL,
  PRIMARY KEY  (`module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `system_modules`
--

INSERT INTO `system_modules` (`module_id`, `module_title`, `module_icon`, `module_source`, `module_name`, `module_commands`) VALUES
(1, 'Manage Modules', 'application_form_edit', ' Ext.onReady(function(){Ext.ScriptMgr.load({scripts:[''js/plugins/Ext.ux.form.SuperBoxSelect.js'',''js/plugins/Ext.ux.form.IconBrowser.js'',''js/plugins/codepress/Codepress.js'',''js/plugins/Ext.ux.CodePress.js''],callback:function(){var jsEditorID=TricertAssist.generateUniqueID(''textarea'');var commandComboID=TricertAssist.generateUniqueID(''combobox'');var moduleStore=new Ext.data.DirectStore({directFn:Module.getSimpleList,paramsAsHash:false,idProperty:''id'',fields:[{name:''id''},{name:''name''}]});var recordType=Ext.data.Record.create({name:''moduleID'',type:''int''},{name:''moduleTitle''},{name:''moduleIcon''},{name:''moduleSource''},{name:''moduleName''},{name:''moduleCommands''});var commandList=new Ext.data.DirectStore({directFn:AccessGroup.commandTypes,paramsAsHash:false,idProperty:''id'',fields:[{name:''id''},{name:''name''}]});commandList.load();var commandComboList=new Ext.data.DirectStore({directFn:AccessGroup.commandTypes,paramsAsHash:false,idProperty:''id'',fields:[{name:''id''},{name:''name''}]});commandComboList.load();var moduleList=new Ext.data.DirectStore({directFn:Module.getModuleList,paramsAsHash:false,idProperty:''id'',fields:[{name:''id''},{name:''moduleName'',mapping:''name''}]});moduleList.load();var form=new Ext.FormPanel({title:''Module Management'',border:true,region:''center'',defaultType:''textfield'',bodyStyle:''padding:10px 10px 0'',margins:''3 3 3 3'',plugins:[new Ext.ux.FormClear()],items:[{xtype:''hidden'',name:''moduleID''},{xtype:''hidden'',name:''moduleCommands''},{xtype:''fieldset'',title:''Module Settings'',autoHeight:true,width:400,items:[{layout:''form'',labelAlign:''left'',border:false,items:[new Ext.form.ComboBox({fieldLabel:''Module'',hiddenName:''moduleName'',store:moduleList,valueField:''moduleName'',displayField:''moduleName'',mode:''remote'',editable:false,triggerAction:''all'',emptyText:''Select a Module ...'',allowBlank:false,blankText:''Please Select a Module'',width:230}),{allowBlank:true,id:commandComboID,xtype:''superboxselect'',fieldLabel:''Commands'',resizable:true,name:''commandSelection'',hiddenName:''commandSelection'',value:''moduleCommands'',store:commandComboList,mode:''remote'',displayField:''name'',displayFieldTpl:''{name}'',valueField:''id'',triggerAction:''all'',width:230},{xtype:''textfield'',fieldLabel:''Module Title'',name:''moduleTitle'',width:230},new Ext.ux.form.IconBrowserField({fieldLabel:''Select an icon'',name:''moduleIcon'',width:230,buttonText:'''',buttonCfg:{iconCls:''upload-icon''}})]}]},{xtype:''fieldset'',title:''JavaScript Source'',labelAlign:''top'',width:400,autoHeight:true,items:[new Ext.ux.CodePress({id:jsEditorID,language:''javascript'',name:''moduleSource'',hiddenName:''moduleSource'',height:200,width:375})]}],api:{load:Module.create,submit:Module.commit},paramOrder:[''identifier''],listeners:{beforeaction:function(form,action){if(action.type==''directsubmit''){form.findField(''moduleCommands'').setRawValue(''[''+Ext.getCmp(commandComboID).getValue().trim()+'']'');form.findField(''moduleSource'').setRawValue(Ext.getCmp(jsEditorID).getMinifiedValue());}},actioncomplete:function(form,action){if(action.type==''directload''){Ext.getCmp(commandComboID).setValue(form.findField(''moduleCommands'').getValue().trim());}}}});FormActions.initFields(form,module);var grid=new Ext.grid.GridPanel({title:''System Modules'',store:moduleStore,collapsible:true,border:true,region:''west'',width:200,cm:new Ext.grid.ColumnModel([{header:''Module Name'',sortable:false,dataIndex:''name''}]),sm:new Ext.grid.RowSelectionModel({singleSelect:true}),viewConfig:{forceFit:true},listeners:{beforerender:function(grid){moduleStore.load();}}});grid.getSelectionModel().on(''rowselect'',function(sm,index,r){FormActions.triggerLoad(form,grid.getStore().getAt(index).id);});grid.getStore().on(''load'',function(){grid.getSelectionModel().selectFirstRow();});var defaultData={moduleID:0,moduleName:'''',moduleTitle:'''',moduleIcon:'''',moduleSource:''alert(\\''new module\\'');'',commandList:''0,1,2''};var newFn=function(){};var successFn=function(){moduleStore.load();};var deleteFn=function(){var sm=grid.getSelectionModel();if(sm.hasSelection()){Module.remove(sm.getSelected().get(''moduleID''),function(result,e){form.getForm().clear();moduleStore.reload();});}};FormActions.defaultHandler(commands,form,recordType,defaultData,newFn,successFn,deleteFn);TricertAssist.showWindow([grid,form],{text:module.moduleTitle,commands:commands,layout:''border'',width:650,height:450});}});});', 'Module', '[0,1]'),
(2, 'Manage Users', 'user_edit', ' Ext.onReady(function(){Ext.ScriptMgr.load({scripts:[''js/plugins/Ext.ux.PasswordMeter.js'',''js/plugins/Ext.ux.grid.RowExpander.js''],callback:function(){Ext.apply(Ext.form.VTypes,{password:function(val,field){if(field.initialPassField){var pwd=Ext.getCmp(field.initialPassField);return(val==pwd.getValue());} return true;},passwordText:''Passwords do not match''});var passwordID=TricertAssist.generateUniqueID(''textinput'');var tabPanel=new Ext.TabPanel({id:TricertAssist.generateUniqueID(''body''),region:''center'',margins:''3 3 3 0'',activeTab:0,defaults:{autoScroll:true},items:[{title:''List View'',items:[],listeners:{beforeshow:function(){tabPanel.get(1).setDisabled(true);}}},{title:''Record View'',items:[]}]});var dataSets={userStore:new Ext.data.GroupingStore({proxy:new Ext.data.DirectProxy({paramsAsHash:false,directFn:User.pagination,paramOrder:''start|limit|sort|dir|where''}),reader:new Ext.data.JsonReader({idProperty:''userID'',totalProperty:''totalRows'',root:''data'',fields:[{name:''userID'',field:''user_id'',type:''int''},{name:''userName'',field:''user_name''},{name:''groupID'',field:''group_id'',type:''int''},{name:''employeeID'',field:''employee_id'',type:''int''},{name:''userType'',field:''user_type'',type:''int''}]}),groupField:''userType'',remoteSort:true,baseParams:{start:0,limit:10,where:''''},sortInfo:{field:''user_id'',direction:''ASC''}}),groupStore:new Ext.data.DirectStore({idProperty:''groupID'',directFn:AccessGroup.list,paramsAsHash:false,fields:[{name:''groupID'',type:''int''},{name:''groupName''}]}),employeeList:new Ext.data.DirectStore({idProperty:''employeeID'',directFn:Employee.list,paramsAsHash:false,fields:[{name:''employeeID'',type:''int''},{name:''firstName''},{name:''lastName''}]}),userTypes:new Ext.data.DirectStore({directFn:User.userTypes,paramsAsHash:false,fields:[{name:''id'',type:''int''},{name:''name''}]}),load:function(){dataSets.userTypes.load();dataSets.groupStore.load();dataSets.employeeList.load();}};var sessionExpander=new Ext.ux.grid.RowExpander({tpl:new Ext.XTemplate(''<div class="detailData">'','''',''</div>''),listeners:{expand:function(expander,record,body,index){if(Ext.DomQuery.select("div.x-panel-bwrap",body).length==0){new Ext.list.ListView({multiSelect:false,store:new Ext.data.JsonStore({data:record.json.history,fields:[{name:''visitID'',type:''int''},{name:''sessionID'',type:''int''},{name:''moduleID'',type:''int''},{name:''moduleTitle''},{name:''visitTime'',type:''date''}]}),columns:[{dataIndex:''moduleTitle'',header:''Module'',width:.5},{dataIndex:''visitTime'',header:''Time Accessed'',tpl:''{visitTime:date("H:i:s")}'',width:.5}],renderTo:Ext.DomQuery.select("div.detailData",body)[0]});}}}});var sessionList=new Ext.data.DirectStore({directFn:SessionLog.list,paramsAsHash:false,paramOrder:''start|limit|sort|dir|userID'',root:''data'',idProperty:''sessionID'',totalProperty:''totalRows'',sortInfo:{field:''session_id'',direction:''ASC''},fields:[{name:''sessionID'',field:''session_id''},{name:''sessionDate'',field:''session_date''}],remoteSort:true,paramNames:{start:''start'',limit:''limit'',sort:''sort'',dir:''dir'',userID:''userID''},baseParams:{start:0,limit:10,userID:0}});var sessionPanel=new Ext.Panel({xtype:''container'',autoEl:{},region:''center'',layout:''fit'',title:''Session Log'',collapsible:true,border:true,items:[new Ext.grid.GridPanel({store:sessionList,border:true,autoHeight:true,disableSelection:true,cm:new Ext.grid.ColumnModel([sessionExpander,{header:''Session Date'',width:100,sortable:true,dataIndex:''sessionDate''}]),plugins:sessionExpander,viewConfig:{forceFit:true}})],bbar:new Ext.PagingToolbar({pageSize:10,store:sessionList,displayInfo:true})});var renderEmployee=function(value){return dataSets.employeeList.getById(parseInt(value)).get(''firstName'');};var renderUserType=function(value){return dataSets.userTypes.getById(parseInt(value)).get(''name'');};var userManagement={form:new Ext.FormPanel({border:true,bodyStyle:''padding:10px 10px 0'',title:''User Management Form'',collapsible:true,autoHeight:true,plugins:[new Ext.ux.FormClear()],items:[{xtype:''hidden'',name:''userID''},{xtype:''fieldset'',title:''Basic Settings'',autoHeight:true,anchor:''100% -20'',layout:''column'',items:[{columnWidth:''.5'',layout:''form'',labelAlign:''top'',border:false,items:[{xtype:''textfield'',fieldLabel:''User Name'',name:''userName'',width:150},new Ext.ux.PasswordMeter({id:passwordID,fieldLabel:''Password'',name:''password'',inputType:''password'',width:150}),new Ext.ux.PasswordMeter({fieldLabel:''Confirm Password'',name:''confirmationPassword'',vtype:''password'',initialPassField:passwordID,inputType:''password'',width:150})]},{columnWidth:''.5'',layout:''form'',labelAlign:''top'',anchor:''100% -20'',border:false,items:[new Ext.form.ComboBox({fieldLabel:''Access Group'',hiddenName:''groupID'',store:dataSets.groupStore,valueField:''groupID'',displayField:''groupName'',mode:''local'',editable:false,triggerAction:''all'',emptyText:''Select a group...'',allowBlank:false,blankText:''Select a Access Group'',width:150}),new Ext.form.ComboBox({fieldLabel:''Employee'',hiddenName:''employeeID'',store:dataSets.employeeList,valueField:''employeeID'',displayField:''firstName'',mode:''remote'',editable:false,triggerAction:''all'',emptyText:''Select a employee...'',allowBlank:false,blankText:''Select a Employee'',width:150}),new Ext.form.ComboBox({fieldLabel:''User Type'',hiddenName:''userType'',store:dataSets.userTypes,valueField:''id'',displayField:''name'',mode:''remote'',editable:false,triggerAction:''all'',emptyText:''Select a type ...'',allowBlank:false,blankText:''Select a User Type'',width:150})]}]}],api:{load:User.create,submit:User.commit},paramOrder:[''identifier''],listeners:{beforeaction:function(form,action){if(action.type==''directsubmit''){}},actioncomplete:function(form,action){if(action.type==''directload''){sessionList.setBaseParam(''userID'',parseInt(form.findField(''userID'').getValue()));sessionList.load();}}}}),grid:new Ext.grid.GridPanel({store:dataSets.userStore,border:false,autoHeight:true,cm:new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(),{header:''User Name'',width:100,sortable:true,dataIndex:''userName''},{header:''Employee File'',width:100,sortable:true,renderer:renderEmployee,dataIndex:''employeeID''},{header:''User Type'',width:100,sortable:true,renderer:renderUserType,dataIndex:''userType'',hidden:true}]),listeners:{rowdblclick:function(grid,index,e){tabPanel.get(1).setDisabled(false).show();FormActions.triggerLoad(userManagement.form,grid.getStore().getAt(index).id);}},view:new Ext.grid.GroupingView({forceFit:true,groupTextTpl:''{text}''}),tbar:new Ext.PagingToolbar({pageSize:10,store:dataSets.userStore,displayInfo:true})}),defaultData:{userID:0,userName:'''',groupID:'''',employeeID:'''',userType:''''}};var groupGrid=new Ext.grid.GridPanel({title:''Access Groups'',store:dataSets.groupStore,border:true,region:''west'',width:200,cm:new Ext.grid.ColumnModel([{header:''Group Name'',sortable:false,dataIndex:''groupName''}]),sm:new Ext.grid.RowSelectionModel({singleSelect:true}),viewConfig:{forceFit:true},listeners:{beforerender:function(grid){dataSets.load();}}});groupGrid.getSelectionModel().on(''rowselect'',function(sm,index,r){tabPanel.get(0).show();dataSets.userStore.setBaseParam(''where'','' WHERE group_id = ''+groupGrid.getStore().getAt(index).id);dataSets.userStore.load();});groupGrid.getStore().on(''load'',function(){groupGrid.getSelectionModel().selectFirstRow();});tabPanel.get(0).add(userManagement.grid);tabPanel.get(1).add([userManagement.form,sessionPanel]);tabPanel.doLayout();var newFn=function(){tabPanel.get(1).setDisabled(false).show();};var successFn=function(){dataSets.userStore.load();};var deleteFn=function(){var sm=userManagement.grid.getSelectionModel();if(sm.hasSelection()){User.remove(sm.getSelected().get(''userID''),function(result,e){dataSets.userStore.load();});}};FormActions.initFields(userManagement.form,module);FormActions.defaultHandler(commands,userManagement.form,dataSets.userStore.recordType,userManagement.defaultData,newFn,successFn,deleteFn);TricertAssist.showWindow([groupGrid,tabPanel],{text:module.moduleTitle,commands:commands,layout:''border'',width:625,height:390});}});});', 'User', '[0,1,2]'),
(3, 'Manage Categories', 'page_edit', ' Ext.onReady(function(){Ext.ScriptMgr.load({scripts:[''js/plugins/Ext.ux.grid.RowEditor.js'',''js/plugins/Ext.ux.form.IconBrowser.js''],callback:function(){var categoryList=new Ext.data.DirectStore({directFn:Category.list,paramsAsHash:false,idProperty:''categoryID'',fields:[{name:''categoryID''},{name:''categoryTitle''}]});categoryList.on(''load'',function(){categoryList.add(new categoryList.recordType({categoryID:0,categoryTitle:''Main Category'',},0));});categoryList.load();var categoryTypes=new Ext.data.DirectStore({directFn:Category.categoryTypes,paramsAsHash:false,fields:[{name:''id''},{name:''name''}]});categoryTypes.load();var form=new Ext.FormPanel({border:true,region:''center'',title:''Category Management'',bodyStyle:''padding:10px 10px 10px'',plugins:[new Ext.ux.FormClear()],fileUpload:true,items:[{xtype:''hidden'',name:''categoryID''},{xtype:''fieldset'',title:''Category Settings'',autoHeight:true,width:350,items:[{xtype:''textfield'',fieldLabel:''Category Title'',name:''categoryTitle'',width:200},new Ext.ux.form.IconBrowserField({fieldLabel:''Select an icon'',name:''categoryIcon'',width:200,buttonText:'''',buttonCfg:{iconCls:''upload-icon''}}),new Ext.form.ComboBox({fieldLabel:''Category Parent'',hiddenName:''categoryParent'',store:categoryList,valueField:''categoryID'',displayField:''categoryTitle'',mode:''remote'',editable:false,triggerAction:''all'',allowBlank:false,width:200}),new Ext.form.ComboBox({fieldLabel:''Category Type'',hiddenName:''categoryType'',store:categoryTypes,valueField:''id'',displayField:''name'',mode:''remote'',editable:false,triggerAction:''all'',emptyText:''Select a type ...'',allowBlank:false,blankText:''Select a Category Type'',width:200})]}],api:{load:Category.create,submit:Category.commit},paramOrder:[''identifier''],listeners:{beforeaction:function(form,action){if(action.type==''directsubmit''){}},actioncomplete:function(form,action){if(action.type==''directload''){}}}});FormActions.initFields(form,module);var recordType=Ext.data.Record.create({name:''categoryID'',type:''int''},{name:''categoryParent'',type:''int''},{name:''categoryTitle''},{name:''categoryIcon''},{name:''categoryType''});var defaultData={categoryID:0,categoryTitle:'''',categoryParent:0,categoryIcon:'''',categoryType:''''};var rootNode=new Ext.tree.AsyncTreeNode({id:''0''});var tree=new Ext.tree.TreePanel({title:''Category List'',border:true,region:''west'',width:200,split:true,collapsible:true,loader:new Ext.tree.TreeLoader({directFn:Category.getTree}),root:rootNode,rootVisible:false,listeners:{click:function(node,e){FormActions.triggerLoad(form,parseInt(node.id));}}});rootNode.expand();var newFn=function(){};var reloadCategories=function(){tree.getLoader().load(rootNode);TricertAssist.navigation.load();};var successFn=function(){reloadCategories();};var deleteFn=function(){Category.remove(parseInt(tree.getSelectionModel().getSelectedNode().id),function(result,e){form.getForm().clear();reloadCategories();});};FormActions.defaultHandler(commands,form,recordType,defaultData,newFn,successFn,deleteFn);tree.on(''load'',function(){var node=rootNode.item(0);tree.selectPath(node.getPath());node.fireEvent(''click'',node);});TricertAssist.showWindow([tree,form],{text:module.moduleTitle,commands:commands,layout:''border'',width:600,height:400});}});});', 'Category', '[0,1,2]'),
(4, 'Group Management', 'group_edit', ' Ext.onReady(function(){Ext.ScriptMgr.load({scripts:[''js/plugins/Ext.ux.form.SuperBoxSelect.js''],callback:function(){var commandComboID=TricertAssist.generateUniqueID(''combobox'');var groupStore=new Ext.data.DirectStore({idProperty:''groupID'',directFn:AccessGroup.list,paramsAsHash:false,fields:[{name:''groupID'',type:''int''},{name:''groupName''}]});var recordType=Ext.data.Record.create({name:''groupID'',type:''int''},{name:''groupName''},{name:''groupCommands''},{name:''groupDescription''});var commandList=new Ext.data.DirectStore({directFn:AccessGroup.commandTypes,paramsAsHash:false,idProperty:''id'',fields:[{name:''id''},{name:''name''}]});commandList.load();var commandComboList=new Ext.data.DirectStore({directFn:AccessGroup.commandTypes,paramsAsHash:false,idProperty:''id'',fields:[{name:''id''},{name:''name''}]});commandComboList.load();var sectionList=new Ext.data.DirectStore({paramsAsHash:false,directFn:Section.pagination,paramOrder:''start|limit|sort|dir|where'',root:''data'',idProperty:''sectionID'',totalProperty:''totalRows'',sortInfo:{field:''section_id'',direction:''ASC''},fields:[{name:''sectionID'',field:''section_id'',type:''int''},{name:''categoryID'',field:''category_id'',type:''int''},{name:''moduleID'',field:''module_id'',type:''int''},{name:''groupID'',field:''group_id'',type:''int''}],remoteSort:true,paramNames:{start:''start'',limit:''limit'',sort:''sort'',dir:''dir'',where:''where''},baseParams:{start:0,limit:10,where:''''}});var form=new Ext.FormPanel({border:true,bodyStyle:''padding:10px 10px 0'',title:''Group Management Form'',collapsible:true,autoHeight:true,autoWidth:true,region:''center'',layout:''fit'',plugins:[new Ext.ux.FormClear()],items:[{xtype:''hidden'',name:''groupID''},{xtype:''hidden'',name:''groupCommands''},{xtype:''fieldset'',title:''Group Settings'',autoHeight:true,autoWidth:true,items:[{xtype:''textfield'',fieldLabel:''Group Name'',name:''groupName'',width:230},{allowBlank:true,id:commandComboID,xtype:''superboxselect'',fieldLabel:''Commands'',resizable:true,name:''commandSelection'',hiddenName:''commandSelection'',value:''groupCommands'',store:commandComboList,mode:''remote'',displayField:''name'',displayFieldTpl:''{name}'',valueField:''id'',triggerAction:''all'',width:230},new Ext.form.TextArea({fieldLabel:''Description'',width:230,name:''groupDescription''})]}],api:{load:AccessGroup.create,submit:AccessGroup.commit},paramOrder:[''identifier''],listeners:{beforeaction:function(form,action){if(action.type==''directsubmit''){form.findField(''groupCommands'').setRawValue(''[''+Ext.getCmp(commandComboID).getValue().trim()+'']'');}},actioncomplete:function(form,action){if(action.type==''directload''){Ext.getCmp(commandComboID).setValue(form.findField(''groupCommands'').getValue().trim());sectionList.setBaseParam(''where'','' WHERE group_id = ''+form.findField(''groupID'').getValue());sectionList.load();}}}});var moduleList=new Ext.data.DirectStore({directFn:Module.getSimpleList,paramsAsHash:false,idProperty:''id'',fields:[{name:''id'',type:''int''},{name:''name''}]});moduleList.load();var groupList=new Ext.data.DirectStore({idProperty:''groupID'',directFn:AccessGroup.list,paramsAsHash:false,fields:[{name:''groupID'',type:''int''},{name:''groupName''}]});var categoryList=new Ext.data.DirectStore({directFn:Category.list,paramsAsHash:false,idProperty:''categoryID'',fields:[{name:''categoryID''},{name:''categoryTitle''}]});categoryList.load();var moduleComboBox=new Ext.form.ComboBox({fieldLabel:''Module'',hiddenName:''moduleID'',store:moduleList,valueField:''id'',displayField:''name'',mode:''remote'',editable:false,triggerAction:''all'',emptyText:''Select a module ...'',allowBlank:false,blankText:''Select a Module'',width:200});var categoryComboBox=new Ext.form.ComboBox({fieldLabel:''Category'',hiddenName:''categoryID'',store:categoryList,valueField:''categoryID'',displayField:''categoryTitle'',mode:''remote'',editable:false,triggerAction:''all'',emptyText:''Select a category ...'',allowBlank:false,blankText:''Select a Category'',width:200});var groupComboBox=new Ext.form.ComboBox({fieldLabel:''Group'',hiddenName:''groupID'',store:groupList,valueField:''groupID'',displayField:''groupName'',mode:''local'',editable:false,triggerAction:''all'',emptyText:''Select a category ...'',allowBlank:false,blankText:''Select a Category'',width:200});var sectionGrid=new Ext.ux.GridEditor({store:sectionList,idProperty:''sectionID'',defaultData:function(){return{sectionID:0,categoryID:'''',groupID:form.getForm().findField(''groupID'').getValue(),moduleID:''''};},api:{submit:Section.saveData,remove:Section.remove},cm:new Ext.grid.ColumnModel([{header:''Module'',width:100,sortable:true,dataIndex:''moduleID'',renderer:Ext.ux.renderer.Combo(moduleComboBox),editor:moduleComboBox},{header:''Category'',width:100,sortable:true,dataIndex:''categoryID'',renderer:Ext.ux.renderer.Combo(categoryComboBox),editor:categoryComboBox},{header:''Group'',width:100,sortable:true,dataIndex:''groupID'',renderer:Ext.ux.renderer.Combo(groupComboBox),editor:groupComboBox}])});var sections=new Ext.Panel({layout:''fit'',title:''Assigned Sections'',collapsible:true,border:true,items:[sectionGrid],bbar:new Ext.PagingToolbar({pageSize:10,store:sectionList,displayInfo:true})});FormActions.initFields(form,module);var grid=new Ext.grid.GridPanel({title:''Access Groups'',store:groupStore,collapsible:true,border:true,region:''west'',width:200,cm:new Ext.grid.ColumnModel([{header:''Access Group'',sortable:false,dataIndex:''groupName''}]),sm:new Ext.grid.RowSelectionModel({singleSelect:true}),viewConfig:{forceFit:true},listeners:{beforerender:function(grid){groupStore.load();}}});grid.getSelectionModel().on(''rowselect'',function(sm,index,r){FormActions.triggerLoad(form,grid.getStore().getAt(index).id);});groupStore.on(''load'',function(){grid.getSelectionModel().selectFirstRow();groupList.add(groupStore.getRange(0,groupStore.getCount()));});var defaultData={groupID:0,groupName:'''',groupDescription:'''',commandList:''0,1,2''};var newFn=function(){};var successFn=function(){groupStore.load();};var deleteFn=function(){var sm=grid.getSelectionModel();if(sm.hasSelection()){AccessGroup.remove(sm.getSelected().get(''groupID''),function(result,e){form.getForm().clear();groupStore.reload();});}};FormActions.defaultHandler(commands,form,recordType,defaultData,newFn,successFn,deleteFn);TricertAssist.showWindow([grid,new Ext.Panel({margins:''3 3 3 3'',region:''center'',layout:''fit'',items:[form,sections]})],{text:module.moduleTitle,commands:commands,layout:''border'',width:650,height:450});}});});', 'AccessGroup', '[0,1,2]'),
(5, 'Employee Departments', 'building_edit', ' Ext.onReady(function(){Ext.ScriptMgr.load({scripts:[''js/plugins/Ext.ux.GMapPanel.js''],callback:function(){var departmentStore=new Ext.data.DirectStore({idProperty:''departmentID'',directFn:Department.list,paramsAsHash:false,fields:[{name:''departmentID'',type:''int''},{name:''departmentName''}]});var recordType=Ext.data.Record.create({name:''departmentID'',type:''int''},{name:''departmentName''},{name:''streetAddress''},{name:''suburb''},{name:''postcode''},{name:''state''},{name:''receptionPhone''});var stateList=new Ext.data.DirectStore({directFn:Employee.stateTypes,paramsAsHash:false,idProperty:''id'',fields:[{name:''id''},{name:''name''}]});stateList.load();var map=new Ext.ux.GMapPanel({zoomLevel:14,title:''Google Map'',gmapType:''map'',border:true,autoWidth:true,height:400,collapsible:true,mapConfOpts:[''enableScrollWheelZoom'',''enableDoubleClickZoom'',''enableDragging''],mapControls:[''GSmallMapControl'',''GMapTypeControl'',''NonExistantControl'']});var form=new Ext.FormPanel({border:true,bodyStyle:''padding:10px 10px 0'',title:''Employee Departments'',collapsible:true,autoHeight:true,autoWidth:true,region:''center'',layout:''fit'',plugins:[new Ext.ux.FormClear()],items:[{xtype:''hidden'',name:''departmentID''},{xtype:''fieldset'',title:''Department Information'',autoHeight:true,anchor:''100% -20'',layout:''column'',items:[{columnWidth:''.5'',layout:''form'',labelAlign:''top'',border:false,items:[{xtype:''textfield'',fieldLabel:''Department Name'',name:''departmentName'',width:150},{xtype:''textfield'',fieldLabel:''Street Address'',name:''streetAddress'',width:150},new Ext.form.ComboBox({fieldLabel:''State'',hiddenName:''state'',store:stateList,valueField:''name'',displayField:''name'',mode:''remote'',editable:false,triggerAction:''all'',emptyText:''Select a state ...'',allowBlank:false,blankText:''Select a state'',width:150})]},{columnWidth:''.5'',layout:''form'',labelAlign:''top'',anchor:''100% -20'',border:false,items:[{xtype:''textfield'',fieldLabel:''Reception Phone'',name:''receptionPhone'',width:150},{xtype:''textfield'',fieldLabel:''Suburb'',name:''suburb'',width:150},{xtype:''textfield'',fieldLabel:''Postcode'',name:''postcode'',width:150}]}]}],api:{load:Department.create,submit:Department.commit},paramOrder:[''identifier''],listeners:{beforeaction:function(form,action){if(action.type==''directsubmit''){}},actioncomplete:function(form,action){if(action.type==''directload''){map.setCenter({geoCodeAddr:(form.findField(''streetAddress'').getValue()+'' ''+form.findField(''suburb'').getValue()+'', ''+form.findField(''state'').getValue()+'' ''+form.findField(''postcode'').getValue()),marker:{title:form.findField(''departmentName'').getValue()}});}}}});var bodyPanel=new Ext.Panel({margins:''3 3 3 3'',region:''center'',layout:''fit'',items:[form,map]});FormActions.initFields(form,module);var grid=new Ext.grid.GridPanel({title:''Department'',store:departmentStore,collapsible:true,border:true,region:''west'',width:200,cm:new Ext.grid.ColumnModel([{header:''Department'',sortable:false,dataIndex:''departmentName''}]),sm:new Ext.grid.RowSelectionModel({singleSelect:true}),viewConfig:{forceFit:true},listeners:{beforerender:function(grid){departmentStore.load();}}});grid.getSelectionModel().on(''rowselect'',function(sm,index,r){FormActions.triggerLoad(form,grid.getStore().getAt(index).id);});departmentStore.on(''load'',function(){grid.getSelectionModel().selectFirstRow();});var defaultData={departmentID:0,departmentName:'''',streetAddress:'''',suburb:'''',postcode:'''',state:'''',receptionPhone:''''};var newFn=function(){};var successFn=function(){departmentStore.load();};var deleteFn=function(){var sm=grid.getSelectionModel();if(sm.hasSelection()){Department.remove(sm.getSelected().get(''departmentID''),function(result,e){form.getForm().clear();departmentStore.reload();});}};FormActions.defaultHandler(commands,form,recordType,defaultData,newFn,successFn,deleteFn);TricertAssist.showWindow([grid,bodyPanel],{text:module.moduleTitle,commands:commands,layout:''border'',width:650,height:450});}});});', 'Department', '[0,1,2]'),
(6, 'Employee Sections', 'folder_user', ' Ext.onReady(function(){Ext.ScriptMgr.load({scripts:[''js/plugins/Ext.ux.grid.RowEditor.js''],callback:function(){var store=new Ext.data.DirectStore({paramsAsHash:false,directFn:EmployeeSection.pagination,paramOrder:''start|limit|sort|dir|where'',root:''data'',idProperty:''employeeSectionID'',totalProperty:''totalRows'',sortInfo:{field:''employee_section_id'',direction:''ASC''},fields:[{name:''employeeSectionID'',field:''employee_section_id'',type:''int''},{name:''sectionTitle'',field:''section_title''},{name:''sectionDescription'',field:''section_description''}],remoteSort:true,paramNames:{start:''start'',limit:''limit'',sort:''sort'',dir:''dir'',where:''where''},baseParams:{start:0,limit:10,where:''''}});var editor=new Ext.ux.grid.RowEditor({saveText:''Update''});editor.on({scope:this,afteredit:function(roweditor,changes,record,rowIndex){EmployeeSection.saveData(record.data,function(result,e){TricertAssist.showNotification({title:result.title,message:result.message});if(result.success){store.commitChanges();}});},canceledit:function(roweditor){var record=store.getAt(roweditor.rowIndex);if(record.get(''employeeSectionID'')===0){store.removeAt(roweditor.rowIndex);grid.getView().refresh();} return true;}});var grid=new Ext.grid.GridPanel({store:store,autoHeight:true,autoWidth:true,disableSelection:true,plugins:[editor],bodyStyle:''padding:0px 0px 10px'',sm:new Ext.grid.RowSelectionModel({singleSelect:true}),cm:new Ext.grid.ColumnModel([{header:''Title'',width:100,sortable:true,dataIndex:''sectionTitle'',editor:{xtype:''textfield'',allowBlank:false}},{header:''Description'',width:100,sortable:true,dataIndex:''sectionDescription'',editor:{xtype:''textfield'',allowBlank:true}}]),listeners:{beforerender:function(grid){store.load();}},viewConfig:{forceFit:true}});var panel=new Ext.Panel({xtype:''container'',autoEl:{},layout:''fit'',title:''Employee Sections'',region:''center'',collapsible:true,border:true,items:[grid],bbar:new Ext.PagingToolbar({pageSize:10,store:store,displayInfo:true})});Ext.each(commands,function(command,index){command.handler=function(){switch(command.id){case 0:var defaultData=new store.recordType({employeeSectionID:0,sectionTitle:'''',sectionDescription:''''});editor.stopEditing();store.insert(0,defaultData);editor.startEditing(0);break;case 2:var record=grid.getSelectionModel().getSelected();if(record){EmployeeSection.remove(record.get(''employeeSectionID''),function(result,e){store.remove(record);store.reload();});} break;}}});TricertAssist.showWindow([panel],{text:module.moduleTitle,commands:commands,layout:''fit'',width:350,height:300});}});});', 'EmployeeSection', '[0,2]'),
(7, 'Employee Management', 'user_suit', ' Ext.onReady(function(){var dataSets={departmentStore:new Ext.data.DirectStore({idProperty:''departmentID'',directFn:Department.list,paramsAsHash:false,fields:[{name:''departmentID'',type:''int''},{name:''departmentName''}]}),employeeStore:new Ext.data.GroupingStore({proxy:new Ext.data.DirectProxy({paramsAsHash:false,directFn:Employee.pagination,paramOrder:''start|limit|sort|dir|where''}),reader:new Ext.data.JsonReader({idProperty:''employeeID'',totalProperty:''totalRows'',root:''data'',fields:[{name:''employeeID'',field:''employee_id'',type:''int''},{name:''employeeSectionID'',field:''employee_section_id'',type:''int''},{name:''departmentID'',field:''department_id'',type:''int''},{name:''supervisorID'',field:''supervisor_id'',type:''int''},{name:''employeeType'',field:''employee_type'',type:''int''},{name:''firstName'',field:''first_name''},{name:''lastName'',field:''last_name''},{name:''emailAddress'',field:''email_address''},{name:''streetAddress'',field:''street_address''},{name:''suburb'',field:''suburb''},{name:''postcode'',field:''postcode''},{name:''state'',field:''state''}]}),groupField:''employeeSectionID'',remoteSort:true,baseParams:{start:0,limit:10,where:''''},sortInfo:{field:''employee_id'',direction:''ASC''}}),employeeList:new Ext.data.DirectStore({idProperty:''employeeID'',directFn:Employee.list,paramsAsHash:false,fields:[{name:''employeeID'',type:''int''},{name:''firstName''},{name:''lastName''}]}),employeeSectionList:new Ext.data.DirectStore({idProperty:''employeeSectionID'',directFn:EmployeeSection.list,paramsAsHash:false,fields:[{name:''employeeSectionID'',type:''int''},{name:''sectionTitle''}]}),employeeTypes:new Ext.data.DirectStore({directFn:Employee.employeeTypes,paramsAsHash:false,idProperty:''id'',fields:[{name:''id'',type:''int''},{name:''name''}]}),stateList:new Ext.data.DirectStore({directFn:Employee.stateTypes,paramsAsHash:false,idProperty:''id'',fields:[{name:''id''},{name:''name''}]})};var licenseTypes=new Ext.data.DirectStore({directFn:EmployeeLicense.licenseTypes,paramsAsHash:false,idProperty:''id'',fields:[{name:''id''},{name:''name''}]});licenseTypes.load();var qualificationLevels=new Ext.data.DirectStore({directFn:EmployeeQualification.qualificationLevels,paramsAsHash:false,idProperty:''id'',fields:[{name:''id''},{name:''name''}]});qualificationLevels.load();var licenseStore=new Ext.data.DirectStore({paramsAsHash:false,directFn:EmployeeLicense.pagination,paramOrder:''start|limit|sort|dir|where'',root:''data'',idProperty:''licenseID'',totalProperty:''totalRows'',sortInfo:{field:''license_id'',direction:''ASC''},fields:[{name:''licenseID'',field:''license_id'',type:''int''},{name:''employeeID'',field:''employee_id'',type:''int''},{name:''licenseType'',field:''license_type'',type:''int''},{name:''licenseNumber'',field:''license_number''},{name:''licenseClass'',field:''license_class''}],remoteSort:true,paramNames:{start:''start'',limit:''limit'',sort:''sort'',dir:''dir'',where:''where''},baseParams:{start:0,limit:10,where:''''}});var qualificationStore=new Ext.data.DirectStore({paramsAsHash:false,directFn:EmployeeQualification.pagination,paramOrder:''start|limit|sort|dir|where'',root:''data'',idProperty:''qualificationID'',totalProperty:''totalRows'',sortInfo:{field:''qualification_id'',direction:''ASC''},fields:[{name:''qualificationID'',field:''qualification_id'',type:''int''},{name:''employeeID'',field:''employee_id'',type:''int''},{name:''qualificationLevel'',field:''qualification_level'',type:''int''},{name:''qualificationTitle'',field:''qualification_title''},{name:''dateObtained'',field:''date_obtained''},{name:''institute'',field:''institute''}],remoteSort:true,paramNames:{start:''start'',limit:''limit'',sort:''sort'',dir:''dir'',where:''where''},baseParams:{start:0,limit:10,where:''''}});var phoneStore=new Ext.data.DirectStore({paramsAsHash:false,directFn:EmployeePhoneNumber.pagination,paramOrder:''start|limit|sort|dir|where'',root:''data'',idProperty:''phoneID'',totalProperty:''totalRows'',sortInfo:{field:''phone_id'',direction:''ASC''},fields:[{name:''phoneID'',field:''phone_id'',type:''int''},{name:''employeeID'',field:''employee_id'',type:''int''},{name:''contactInformation'',field:''contact_information''},{name:''contactNumber'',field:''contact_number''}],remoteSort:true,paramNames:{start:''start'',limit:''limit'',sort:''sort'',dir:''dir'',where:''where''},baseParams:{start:0,limit:10,where:''''}});var licenseTypeComboBox=new Ext.form.ComboBox({fieldLabel:''License Type'',hiddenName:''licenseType'',store:licenseTypes,valueField:''id'',displayField:''name'',mode:''remote'',editable:false,triggerAction:''all'',emptyText:''Select a type ...'',allowBlank:false,blankText:''Select a type'',width:200});var qualificationLevelComboBox=new Ext.form.ComboBox({fieldLabel:''Qualification'',hiddenName:''qualificationLevel'',store:qualificationLevels,valueField:''id'',displayField:''name'',mode:''remote'',editable:false,triggerAction:''all'',emptyText:''Select a level ...'',allowBlank:false,blankText:''Select a level'',width:200});var employeeManagement={form:new Ext.FormPanel({border:true,bodyStyle:''padding:10px 10px 0'',title:''Employee Details'',collapsible:true,autoWidth:true,autoHeight:true,layout:''fit'',plugins:[new Ext.ux.FormClear()],items:[{xtype:''hidden'',name:''employeeID''},{xtype:''fieldset'',autoHeight:true,anchor:''100% -20'',layout:''column'',items:[{columnWidth:''.5'',layout:''form'',labelAlign:''top'',border:false,items:[{xtype:''textfield'',fieldLabel:''First Name'',name:''firstName'',tabIndex:1,width:150},new Ext.form.ComboBox({fieldLabel:''Department'',hiddenName:''departmentID'',store:dataSets.departmentStore,valueField:''departmentID'',displayField:''departmentName'',mode:''local'',editable:false,triggerAction:''all'',emptyText:''Select a department ...'',allowBlank:false,blankText:''Select a department'',tabIndex:3,width:150}),{xtype:''textfield'',fieldLabel:''Street Address'',name:''streetAddress'',tabIndex:5,width:150},{xtype:''textfield'',fieldLabel:''Postcode'',name:''postcode'',tabIndex:7,width:150},{xtype:''textfield'',fieldLabel:''Email Address'',name:''emailAddress'',tabIndex:9,width:150}]},{columnWidth:''.5'',layout:''form'',labelAlign:''top'',border:false,items:[{xtype:''textfield'',fieldLabel:''Last Name'',name:''lastName'',tabIndex:2,width:150},new Ext.form.ComboBox({fieldLabel:''Section'',hiddenName:''employeeSectionID'',store:dataSets.employeeSectionList,valueField:''employeeSectionID'',displayField:''sectionTitle'',mode:''local'',editable:false,triggerAction:''all'',emptyText:''Select a section ...'',allowBlank:false,blankText:''Select a section'',tabIndex:4,width:150}),{xtype:''textfield'',fieldLabel:''Suburb'',name:''suburb'',tabIndex:6,width:150},new Ext.form.ComboBox({fieldLabel:''State'',hiddenName:''state'',store:dataSets.stateList,valueField:''name'',displayField:''name'',mode:''remote'',editable:false,triggerAction:''all'',emptyText:''Select a state ...'',allowBlank:false,blankText:''Select a state'',tabIndex:8,width:150}),new Ext.form.ComboBox({fieldLabel:''Employee Type'',hiddenName:''employeeType'',store:dataSets.employeeTypes,valueField:''id'',displayField:''name'',mode:''remote'',editable:false,triggerAction:''all'',emptyText:''Select a type ...'',allowBlank:false,blankText:''Select a type'',tabIndex:10,width:150})]}]}],api:{load:Employee.create,submit:Employee.commit},paramOrder:[''identifier''],listeners:{beforeaction:function(form,action){if(action.type==''directsubmit''){}},actioncomplete:function(form,action){if(action.type==''directload''){var where='' WHERE employee_id = ''+form.findField(''employeeID'').getValue();licenseStore.setBaseParam(''where'',where);qualificationStore.setBaseParam(''where'',where);phoneStore.setBaseParam(''where'',where);licenseStore.load();qualificationStore.load();phoneStore.load();recordPanel.show();}}}}),grid:new Ext.grid.GridPanel({store:dataSets.employeeStore,border:false,autoHeight:true,autoWidth:true,cm:new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(),{header:''First Name'',width:100,sortable:true,dataIndex:''firstName''},{header:''Last Name'',width:100,sortable:true,dataIndex:''lastName''},{header:''Section'',width:100,sortable:true,renderer:function(value){return dataSets.employeeSectionList.getById(parseInt(value)).get(''sectionTitle'');},dataIndex:''employeeSectionID'',hidden:true}]),view:new Ext.grid.GroupingView({forceFit:true,groupTextTpl:''{text}''}),tbar:new Ext.PagingToolbar({pageSize:10,store:dataSets.employeeStore,displayInfo:true}),listeners:{rowdblclick:function(grid,index,e){tabPanel.get(1).setDisabled(false).show();FormActions.triggerLoad(employeeManagement.form,grid.getStore().getAt(index).id);}}}),defaultData:{employeeID:0,sectionalisedID:'''',supervisorID:'''',employeeType:0,firstName:'''',lastName:'''',streetAddress:'''',suburb:'''',postcode:'''',state:'''',emailAddress:''''}};var licenseGrid=new Ext.ux.GridEditor({store:licenseStore,idProperty:''licenseID'',autoHeight:true,autoWidth:true,defaultData:function(){return{licenseID:0,employeeID:employeeManagement.form.getForm().findField(''employeeID'').getValue(),licenseType:0,licenseNumber:'''',licenseClass:''''};},api:{submit:EmployeeLicense.saveData,remove:EmployeeLicense.remove},cm:new Ext.grid.ColumnModel([{header:''License Number'',width:100,sortable:true,dataIndex:''licenseNumber'',editor:{xtype:''textfield'',allowBlank:false}},{header:''License Class'',width:100,sortable:true,dataIndex:''licenseClass'',editor:{xtype:''textfield'',allowBlank:false}},{header:''License Type'',width:100,sortable:true,dataIndex:''licenseType'',renderer:Ext.ux.renderer.Combo(licenseTypeComboBox),editor:licenseTypeComboBox}])});var qualificationGrid=new Ext.ux.GridEditor({store:qualificationStore,idProperty:''qualificationID'',autoHeight:true,autoWidth:true,defaultData:function(){return{qualificationID:0,employeeID:employeeManagement.form.getForm().findField(''employeeID'').getValue(),qualificationLevel:0,dateObtained:'''',qualificationTitle:'''',institute:''''};},api:{submit:EmployeeQualification.saveData,remove:EmployeeQualification.remove},cm:new Ext.grid.ColumnModel([{header:''Qualification Title'',width:100,sortable:true,dataIndex:''qualificationTitle'',editor:{xtype:''textfield'',allowBlank:false}},{header:''Institute'',width:100,sortable:true,dataIndex:''institute'',editor:{xtype:''textfield'',allowBlank:false}},{header:''Date Obtained'',width:100,sortable:true,dataIndex:''dateObtained'',editor:{xtype:''datefield'',allowBlank:false},renderer:Ext.util.Format.dateRenderer(''d-m-Y'')},{header:''Level'',width:100,sortable:true,dataIndex:''qualificationLevel'',renderer:Ext.ux.renderer.Combo(qualificationLevelComboBox),editor:qualificationLevelComboBox}])});var phoneRegistryGrid=new Ext.ux.GridEditor({store:phoneStore,idProperty:''phoneID'',autoHeight:true,autoWidth:true,defaultData:function(){return{phoneID:0,employeeID:employeeManagement.form.getForm().findField(''employeeID'').getValue(),contactInformation:'''',contactNumber:''''};},api:{submit:EmployeePhoneNumber.saveData,remove:EmployeePhoneNumber.remove},cm:new Ext.grid.ColumnModel([{header:''Contact Information'',width:100,sortable:true,dataIndex:''contactInformation'',editor:{xtype:''textfield'',allowBlank:false}},{header:''Phone Number'',width:100,sortable:true,dataIndex:''contactNumber'',editor:{xtype:''textfield'',allowBlank:false}}])});var gridPanel=new Ext.grid.GridPanel({title:''Department'',store:dataSets.departmentStore,collapsible:true,border:true,region:''west'',width:200,cm:new Ext.grid.ColumnModel([{header:''Department'',sortable:false,dataIndex:''departmentName''}]),sm:new Ext.grid.RowSelectionModel({singleSelect:true}),viewConfig:{forceFit:true},listeners:{beforerender:function(grid){dataSets.employeeSectionList.load();dataSets.employeeTypes.load();dataSets.departmentStore.load();}}});gridPanel.getSelectionModel().on(''rowselect'',function(sm,index,r){tabPanel.get(0).show();dataSets.employeeStore.setBaseParam(''where'','' WHERE department_id = ''+gridPanel.getStore().getAt(index).id);dataSets.employeeStore.load();});dataSets.departmentStore.on(''load'',function(){gridPanel.getSelectionModel().selectFirstRow();});var recordPanel=new Ext.TabPanel({region:''center'',margins:''3 3 3 3'',activeTab:0,autoHeight:true,items:[{title:''Licenses'',layout:''fit'',items:[new Ext.Panel({layout:''fit'',border:false,autoHeight:true,autoWidth:true,items:[licenseGrid],bbar:new Ext.PagingToolbar({pageSize:10,store:licenseStore,displayInfo:true})})]},{title:''Qualifications'',layout:''fit'',items:[new Ext.Panel({layout:''fit'',border:false,autoHeight:true,autoWidth:true,items:[qualificationGrid],bbar:new Ext.PagingToolbar({pageSize:10,store:qualificationStore,displayInfo:true})})]},{title:''Phone Registry'',layout:''fit'',items:[new Ext.Panel({layout:''fit'',border:false,autoHeight:true,autoWidth:true,items:[phoneRegistryGrid],bbar:new Ext.PagingToolbar({pageSize:10,store:phoneStore,displayInfo:true})})]}]});recordPanel.doLayout();var tabPanel=new Ext.TabPanel({region:''center'',margins:''3 3 3 3'',activeTab:0,defaults:{autoScroll:true},items:[{title:''List View'',layout:''fit'',items:[employeeManagement.grid],listeners:{beforeshow:function(){tabPanel.get(1).setDisabled(true);}}},{title:''Record View'',layout:''fit'',items:[employeeManagement.form,recordPanel]}]});tabPanel.doLayout();var newFn=function(){tabPanel.get(1).setDisabled(false).show();recordPanel.hide();};var successFn=function(){dataSets.employeeStore.load();};var deleteFn=function(){var sm=employeeManagement.grid.getSelectionModel();if(sm.hasSelection()){Employee.remove(sm.getSelected().get(''employeeID''),function(result,e){dataSets.employeeStore.load();});}};FormActions.initFields(employeeManagement.form,module);FormActions.defaultHandler(commands,employeeManagement.form,dataSets.employeeStore.recordType,employeeManagement.defaultData,newFn,successFn,deleteFn);TricertAssist.showWindow([gridPanel,tabPanel],{text:module.moduleTitle,commands:commands,layout:''border'',width:625,height:390,});});', 'Employee', '[0,1,2]'),
(8, 'Training Courses', 'clipboard', ' Ext.onReady(function(){var courseStore=new Ext.data.DirectStore({idProperty:''courseID'',directFn:TrainingCourse.list,paramsAsHash:false,fields:[{name:''courseID'',type:''int''},{name:''courseTitle''}]});var moduleStore=new Ext.data.DirectStore({paramsAsHash:false,directFn:TrainingModule.pagination,paramOrder:''start|limit|sort|dir|where'',root:''data'',idProperty:''courseModuleID'',totalProperty:''totalRows'',sortInfo:{field:''course_module_id'',direction:''ASC''},fields:[{name:''courseModuleID'',field:''course_module_id'',type:''int''},{name:''courseID'',field:''course_id'',type:''int''},{name:''courseModuleTitle'',field:''course_module_title''},{name:''courseModuleContents'',field:''course_module_contents''}],remoteSort:true,paramNames:{start:''start'',limit:''limit'',sort:''sort'',dir:''dir'',where:''where''},baseParams:{start:0,limit:10,where:''''}});var recordType=Ext.data.Record.create({name:''courseID'',type:''int''},{name:''courseTitle''},{name:''courseDescription''});var form=new Ext.FormPanel({border:true,bodyStyle:''padding:10px 10px 0'',title:''Training Course'',collapsible:true,autoHeight:true,autoWidth:true,region:''center'',layout:''fit'',plugins:[new Ext.ux.FormClear()],items:[{xtype:''hidden'',name:''courseID''},{xtype:''fieldset'',autoHeight:true,autoWidth:true,items:[{xtype:''textfield'',fieldLabel:''Course Title'',name:''courseTitle'',width:230,allowBlank:false,blankText:''Enter a Course Title''},new Ext.form.TextArea({fieldLabel:''Description'',width:230,name:''courseDescription'',allowBlank:false,blankText:''Enter a Course Description''})]}],api:{load:TrainingCourse.create,submit:TrainingCourse.commit},paramOrder:[''identifier''],listeners:{beforeaction:function(form,action){if(action.type==''directsubmit''){}},actioncomplete:function(form,action){if(action.type==''directload''){moduleStore.setBaseParam(''where'','' WHERE course_id = ''+form.findField(''courseID'').getValue());moduleStore.load();modulePanel.show();}}}});var moduleGrid=new Ext.ux.GridEditor({store:moduleStore,idProperty:''courseModuleID'',autoHeight:true,autoWidth:true,defaultData:function(){return{courseModuleID:0,courseID:form.getForm().findField(''courseID'').getValue(),courseModuleTitle:'''',courseModuleContents:''''};},api:{submit:TrainingModule.saveData,remove:TrainingModule.remove},cm:new Ext.grid.ColumnModel([{header:''Module Title'',sortable:false,width:100,dataIndex:''courseModuleTitle'',editor:{xtype:''textfield'',allowBlank:false}},{header:''Contents'',sortable:false,width:200,dataIndex:''courseModuleContents'',editor:{xtype:''textfield'',allowBlank:false}}])});var modulePanel=new Ext.Panel({title:''Course Modules'',collapsible:true,border:true,layout:''fit'',items:[moduleGrid],bbar:new Ext.PagingToolbar({pageSize:10,store:moduleStore,displayInfo:true})});FormActions.initFields(form,module);var grid=new Ext.grid.GridPanel({title:''Training Courses'',store:courseStore,border:true,region:''west'',width:200,cm:new Ext.grid.ColumnModel([{header:''Course Title'',sortable:false,dataIndex:''courseTitle''}]),sm:new Ext.grid.RowSelectionModel({singleSelect:true}),viewConfig:{forceFit:true},listeners:{beforerender:function(grid){courseStore.load();}}});grid.getSelectionModel().on(''rowselect'',function(sm,index,r){FormActions.triggerLoad(form,grid.getStore().getAt(index).id);});courseStore.on(''load'',function(){grid.getSelectionModel().selectFirstRow();});var defaultData={courseID:0,courseTitle:'''',courseDescription:''''};var newFn=function(){modulePanel.hide();};var successFn=function(){courseStore.load();};var deleteFn=function(){var sm=grid.getSelectionModel();if(sm.hasSelection()){TrainingCourse.remove(sm.getSelected().get(''courseID''),function(result,e){form.getForm().clear();courseStore.load();});}};FormActions.defaultHandler(commands,form,recordType,defaultData,newFn,successFn,deleteFn);TricertAssist.showWindow([grid,new Ext.Panel({margins:''3 3 3 3'',region:''center'',layout:''fit'',autoHeight:true,items:[form,modulePanel],defaults:{autoScroll:true}})],{text:module.moduleTitle,commands:commands,layout:''border'',width:650,height:450});});', 'TrainingCourse', '[0,1,2]');

-- --------------------------------------------------------

--
-- Table structure for table `system_sections`
--

CREATE TABLE IF NOT EXISTS `system_sections` (
  `section_id` int(11) NOT NULL auto_increment,
  `module_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY  (`section_id`),
  KEY `category_id` (`category_id`),
  KEY `module_id` (`module_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `system_sections`
--

INSERT INTO `system_sections` (`section_id`, `module_id`, `group_id`, `category_id`) VALUES
(1, 3, 1, 1),
(2, 1, 1, 1),
(3, 2, 1, 2),
(4, 4, 1, 2),
(6, 4, 2, 3),
(7, 5, 1, 7),
(8, 6, 1, 7),
(9, 7, 1, 7),
(10, 8, 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `system_security_log`
--

CREATE TABLE IF NOT EXISTS `system_security_log` (
  `log_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `log_date` datetime NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  PRIMARY KEY  (`log_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `system_security_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `system_session_history`
--

CREATE TABLE IF NOT EXISTS `system_session_history` (
  `visit_id` int(11) NOT NULL auto_increment,
  `session_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `visit_time` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`visit_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=815 ;

--
-- Dumping data for table `system_session_history`
--

INSERT INTO `system_session_history` (`visit_id`, `session_id`, `section_id`, `visit_time`) VALUES
(1, 171, 3, '2010-02-08 23:30:07'),
(2, 171, 4, '2010-02-08 23:30:59'),
(3, 171, 4, '2010-02-08 23:31:21'),
(4, 171, 2, '2010-02-08 23:31:32'),
(5, 171, 3, '2010-02-08 23:31:38'),
(6, 171, 4, '2010-02-08 23:32:11'),
(7, 171, 2, '2010-02-08 23:32:16'),
(8, 171, 4, '2010-02-08 23:47:24'),
(9, 171, 2, '2010-02-08 23:48:53'),
(10, 171, 4, '2010-02-08 23:49:08'),
(11, 171, 2, '2010-02-08 23:50:25'),
(12, 171, 4, '2010-02-08 23:50:43'),
(13, 171, 2, '2010-02-08 23:52:34'),
(14, 171, 2, '2010-02-08 23:56:02'),
(15, 171, 4, '2010-02-08 23:56:23'),
(16, 171, 2, '2010-02-08 23:57:06'),
(17, 171, 4, '2010-02-08 23:57:18'),
(18, 171, 2, '2010-02-08 23:58:09'),
(19, 171, 4, '2010-02-08 23:58:39'),
(20, 171, 2, '2010-02-08 23:59:57'),
(21, 171, 4, '2010-02-09 00:00:21'),
(22, 171, 2, '2010-02-09 00:03:47'),
(23, 171, 4, '2010-02-09 00:04:08'),
(24, 171, 2, '2010-02-09 00:04:47'),
(25, 171, 4, '2010-02-09 00:05:00'),
(26, 171, 2, '2010-02-09 00:05:45'),
(27, 171, 4, '2010-02-09 00:05:55'),
(28, 171, 2, '2010-02-09 00:07:09'),
(29, 171, 4, '2010-02-09 00:07:21'),
(30, 171, 2, '2010-02-09 00:08:58'),
(31, 171, 4, '2010-02-09 00:09:12'),
(32, 171, 4, '2010-02-09 00:12:33'),
(33, 171, 2, '2010-02-09 00:14:03'),
(34, 171, 4, '2010-02-09 00:16:04'),
(35, 171, 2, '2010-02-09 00:16:48'),
(36, 171, 4, '2010-02-09 00:17:03'),
(37, 171, 3, '2010-02-09 00:17:51'),
(38, 1, 5, '2010-02-09 00:18:58'),
(39, 2, 4, '2010-02-09 00:19:29'),
(40, 3, 5, '2010-02-09 00:20:01'),
(41, 4, 1, '2010-02-09 00:21:07'),
(42, 4, 4, '2010-02-09 00:22:31'),
(43, 4, 2, '2010-02-09 00:23:07'),
(44, 5, 2, '2010-02-09 00:29:00'),
(45, 5, 3, '2010-02-09 00:29:32'),
(46, 6, 2, '2010-02-09 01:30:45'),
(47, 6, 4, '2010-02-09 01:32:57'),
(48, 6, 7, '2010-02-09 01:33:20'),
(49, 6, 7, '2010-02-09 01:33:33'),
(50, 6, 2, '2010-02-09 01:33:39'),
(51, 6, 7, '2010-02-09 01:39:12'),
(52, 6, 2, '2010-02-09 01:50:13'),
(53, 6, 7, '2010-02-09 01:50:32'),
(54, 6, 7, '2010-02-09 01:50:53'),
(55, 6, 2, '2010-02-09 01:52:59'),
(56, 6, 7, '2010-02-09 01:53:19'),
(57, 6, 2, '2010-02-09 01:54:03'),
(58, 6, 7, '2010-02-09 01:54:16'),
(59, 6, 2, '2010-02-09 01:55:12'),
(60, 6, 7, '2010-02-09 01:55:24'),
(61, 6, 7, '2010-02-09 01:59:34'),
(62, 6, 7, '2010-02-09 02:00:45'),
(63, 7, 7, '2010-02-09 02:02:51'),
(64, 8, 7, '2010-02-09 02:04:37'),
(65, 8, 2, '2010-02-09 02:05:39'),
(66, 8, 7, '2010-02-09 02:05:53'),
(67, 8, 7, '2010-02-09 02:09:25'),
(68, 8, 7, '2010-02-09 02:10:24'),
(69, 9, 7, '2010-02-09 02:11:55'),
(70, 9, 4, '2010-02-09 02:15:27'),
(71, 9, 7, '2010-02-09 02:18:36'),
(72, 9, 3, '2010-02-09 02:20:39'),
(73, 10, 7, '2010-02-09 02:31:29'),
(74, 10, 4, '2010-02-09 02:32:02'),
(75, 10, 7, '2010-02-09 02:33:37'),
(76, 10, 4, '2010-02-09 02:33:43'),
(77, 10, 4, '2010-02-09 02:33:52'),
(78, 10, 7, '2010-02-09 02:34:12'),
(79, 10, 3, '2010-02-09 02:34:17'),
(80, 10, 3, '2010-02-09 02:34:21'),
(81, 10, 1, '2010-02-09 02:34:25'),
(82, 10, 2, '2010-02-09 02:34:29'),
(83, 10, 7, '2010-02-09 02:34:35'),
(84, 10, 7, '2010-02-09 02:34:55'),
(85, 10, 2, '2010-02-09 02:35:31'),
(86, 10, 4, '2010-02-09 02:35:38'),
(87, 10, 2, '2010-02-09 02:41:00'),
(88, 10, 4, '2010-02-09 02:42:17'),
(89, 10, 8, '2010-02-09 02:42:46'),
(90, 10, 8, '2010-02-09 02:47:05'),
(91, 10, 7, '2010-02-09 02:47:07'),
(92, 10, 4, '2010-02-09 02:47:36'),
(93, 10, 1, '2010-02-09 02:47:52'),
(94, 10, 8, '2010-02-09 02:48:13'),
(95, 10, 3, '2010-02-09 02:48:24'),
(96, 11, 7, '2010-02-09 08:48:28'),
(97, 11, 8, '2010-02-09 08:48:38'),
(98, 12, 8, '2010-02-09 23:47:16'),
(99, 12, 7, '2010-02-09 23:47:19'),
(100, 12, 3, '2010-02-09 23:52:00'),
(101, 12, 1, '2010-02-09 23:52:09'),
(102, 12, 2, '2010-02-09 23:52:13'),
(103, 12, 4, '2010-02-09 23:52:19'),
(104, 13, 2, '2010-02-10 00:07:44'),
(105, 13, 2, '2010-02-10 00:08:01'),
(106, 13, 1, '2010-02-10 00:08:07'),
(107, 13, 1, '2010-02-10 00:09:04'),
(108, 13, 4, '2010-02-10 00:09:10'),
(109, 13, 4, '2010-02-10 00:13:00'),
(110, 14, 2, '2010-02-10 01:18:00'),
(111, 15, 4, '2010-02-10 01:21:37'),
(112, 15, 8, '2010-02-10 01:21:46'),
(113, 15, 8, '2010-02-10 01:21:50'),
(114, 15, 2, '2010-02-10 01:22:16'),
(115, 15, 8, '2010-02-10 01:22:29'),
(116, 15, 2, '2010-02-10 01:24:36'),
(117, 15, 8, '2010-02-10 01:24:48'),
(118, 16, 8, '2010-02-10 01:36:48'),
(119, 16, 2, '2010-02-10 01:37:22'),
(120, 16, 8, '2010-02-10 01:38:11'),
(121, 17, 8, '2010-02-10 01:39:56'),
(122, 17, 8, '2010-02-10 01:40:08'),
(123, 17, 8, '2010-02-10 01:40:33'),
(124, 17, 2, '2010-02-10 01:43:25'),
(125, 17, 8, '2010-02-10 01:43:39'),
(126, 17, 2, '2010-02-10 01:45:03'),
(127, 17, 8, '2010-02-10 01:45:12'),
(128, 17, 2, '2010-02-10 01:46:38'),
(129, 17, 8, '2010-02-10 01:46:49'),
(130, 17, 2, '2010-02-10 01:47:44'),
(131, 17, 4, '2010-02-10 01:48:24'),
(132, 17, 8, '2010-02-10 01:49:17'),
(133, 17, 8, '2010-02-10 02:13:43'),
(134, 17, 2, '2010-02-10 02:15:45'),
(135, 17, 8, '2010-02-10 02:15:58'),
(136, 17, 2, '2010-02-10 02:21:22'),
(137, 18, 7, '2010-02-10 03:03:18'),
(138, 22, 7, '2010-02-10 03:16:33'),
(139, 22, 8, '2010-02-10 03:17:01'),
(140, 22, 2, '2010-02-10 03:18:48'),
(141, 22, 2, '2010-02-10 03:24:02'),
(142, 22, 7, '2010-02-10 03:25:05'),
(143, 22, 2, '2010-02-10 03:25:18'),
(144, 22, 7, '2010-02-10 03:32:08'),
(145, 22, 2, '2010-02-10 03:32:20'),
(146, 22, 8, '2010-02-10 03:32:57'),
(147, 22, 8, '2010-02-10 03:33:44'),
(148, 22, 7, '2010-02-10 03:34:13'),
(149, 22, 2, '2010-02-10 03:34:37'),
(150, 22, 7, '2010-02-10 04:02:45'),
(151, 22, 2, '2010-02-10 04:03:01'),
(152, 22, 3, '2010-02-10 04:04:26'),
(153, 22, 3, '2010-02-10 04:21:17'),
(154, 22, 3, '2010-02-10 04:22:29'),
(155, 22, 3, '2010-02-10 04:22:37'),
(156, 22, 2, '2010-02-10 04:22:59'),
(157, 22, 3, '2010-02-10 04:23:13'),
(158, 22, 3, '2010-02-10 04:23:27'),
(159, 22, 2, '2010-02-10 04:24:01'),
(160, 22, 3, '2010-02-10 04:24:19'),
(161, 22, 2, '2010-02-10 04:25:13'),
(162, 22, 3, '2010-02-10 04:25:23'),
(163, 22, 2, '2010-02-10 04:27:42'),
(164, 22, 3, '2010-02-10 04:27:54'),
(165, 22, 2, '2010-02-10 04:28:46'),
(166, 22, 3, '2010-02-10 04:28:57'),
(167, 22, 2, '2010-02-10 04:29:32'),
(168, 22, 3, '2010-02-10 04:29:44'),
(169, 22, 2, '2010-02-10 04:30:27'),
(170, 22, 3, '2010-02-10 04:30:38'),
(171, 22, 3, '2010-02-10 04:31:49'),
(172, 22, 3, '2010-02-10 04:31:59'),
(173, 22, 2, '2010-02-10 04:33:53'),
(174, 22, 3, '2010-02-10 04:34:03'),
(175, 22, 2, '2010-02-10 04:38:01'),
(176, 22, 3, '2010-02-10 04:38:11'),
(177, 22, 2, '2010-02-10 04:43:56'),
(178, 22, 3, '2010-02-10 04:44:11'),
(179, 22, 3, '2010-02-10 04:44:31'),
(180, 22, 2, '2010-02-10 04:47:35'),
(181, 22, 3, '2010-02-10 04:47:47'),
(182, 22, 8, '2010-02-10 04:47:56'),
(183, 22, 7, '2010-02-10 04:48:01'),
(184, 22, 2, '2010-02-10 04:48:08'),
(185, 22, 7, '2010-02-10 05:14:07'),
(186, 22, 7, '2010-02-10 05:14:57'),
(187, 22, 7, '2010-02-10 05:15:04'),
(188, 22, 2, '2010-02-10 05:15:43'),
(189, 22, 7, '2010-02-10 05:16:01'),
(190, 22, 4, '2010-02-10 05:16:04'),
(191, 22, 7, '2010-02-10 05:16:10'),
(192, 22, 2, '2010-02-10 05:17:34'),
(193, 22, 7, '2010-02-10 05:17:48'),
(194, 22, 2, '2010-02-10 05:17:55'),
(195, 22, 7, '2010-02-10 05:18:10'),
(196, 23, 7, '2010-02-10 05:19:39'),
(197, 23, 7, '2010-02-10 05:20:11'),
(198, 23, 8, '2010-02-10 05:23:47'),
(199, 23, 8, '2010-02-10 05:24:44'),
(200, 23, 7, '2010-02-10 05:24:47'),
(201, 23, 7, '2010-02-10 05:25:47'),
(202, 23, 2, '2010-02-10 05:27:18'),
(203, 23, 7, '2010-02-10 05:27:35'),
(204, 24, 7, '2010-02-10 05:29:18'),
(205, 24, 7, '2010-02-10 05:31:45'),
(206, 24, 7, '2010-02-10 05:37:34'),
(207, 25, 7, '2010-02-10 05:38:57'),
(208, 26, 7, '2010-02-10 05:39:50'),
(209, 26, 2, '2010-02-10 05:40:51'),
(210, 26, 7, '2010-02-10 05:41:07'),
(211, 27, 7, '2010-02-10 05:42:03'),
(212, 27, 7, '2010-02-10 05:42:19'),
(213, 27, 2, '2010-02-10 05:43:32'),
(214, 27, 7, '2010-02-10 05:43:44'),
(215, 27, 4, '2010-02-10 05:44:00'),
(216, 27, 2, '2010-02-10 05:44:11'),
(217, 27, 7, '2010-02-10 05:45:52'),
(218, 27, 8, '2010-02-10 05:46:54'),
(219, 27, 3, '2010-02-10 05:47:16'),
(220, 27, 8, '2010-02-10 05:47:29'),
(221, 27, 3, '2010-02-10 05:48:12'),
(222, 27, 2, '2010-02-10 05:48:18'),
(223, 27, 1, '2010-02-10 05:48:22'),
(224, 27, 7, '2010-02-10 05:48:27'),
(225, 27, 1, '2010-02-10 05:48:51'),
(226, 28, 7, '2010-02-10 14:43:38'),
(227, 28, 2, '2010-02-10 14:44:00'),
(228, 28, 4, '2010-02-10 14:45:37'),
(229, 28, 9, '2010-02-10 14:46:00'),
(230, 28, 4, '2010-02-10 14:46:11'),
(231, 28, 3, '2010-02-10 14:46:15'),
(232, 28, 1, '2010-02-10 14:46:39'),
(233, 28, 3, '2010-02-10 14:46:47'),
(234, 28, 2, '2010-02-10 14:46:54'),
(235, 28, 7, '2010-02-10 14:53:54'),
(236, 28, 2, '2010-02-10 14:54:17'),
(237, 28, 1, '2010-02-10 14:54:30'),
(238, 28, 7, '2010-02-10 15:23:34'),
(239, 28, 3, '2010-02-10 15:23:47'),
(240, 28, 2, '2010-02-10 15:23:54'),
(241, 28, 8, '2010-02-10 15:23:59'),
(242, 28, 7, '2010-02-10 15:24:07'),
(243, 28, 2, '2010-02-10 15:38:09'),
(244, 28, 9, '2010-02-10 15:44:30'),
(245, 28, 2, '2010-02-10 15:45:45'),
(246, 28, 9, '2010-02-10 15:45:58'),
(247, 28, 2, '2010-02-10 15:46:44'),
(248, 28, 9, '2010-02-10 15:46:56'),
(249, 28, 2, '2010-02-10 15:47:37'),
(250, 28, 9, '2010-02-10 15:47:48'),
(251, 28, 2, '2010-02-10 15:49:03'),
(252, 28, 9, '2010-02-10 15:49:11'),
(253, 28, 2, '2010-02-10 15:49:59'),
(254, 28, 9, '2010-02-10 15:50:09'),
(255, 28, 2, '2010-02-10 15:50:31'),
(256, 28, 9, '2010-02-10 15:50:40'),
(257, 29, 9, '2010-02-10 15:53:14'),
(258, 29, 9, '2010-02-10 15:53:30'),
(259, 29, 2, '2010-02-10 15:54:00'),
(260, 29, 2, '2010-02-10 15:55:36'),
(261, 29, 9, '2010-02-10 15:55:45'),
(262, 29, 9, '2010-02-10 15:55:59'),
(263, 29, 9, '2010-02-10 15:57:03'),
(264, 29, 7, '2010-02-10 15:58:03'),
(265, 29, 8, '2010-02-10 15:58:08'),
(266, 29, 9, '2010-02-10 15:58:12'),
(267, 29, 2, '2010-02-10 16:00:51'),
(268, 29, 9, '2010-02-10 16:01:10'),
(269, 29, 9, '2010-02-10 16:01:27'),
(270, 30, 9, '2010-02-10 16:03:41'),
(271, 30, 9, '2010-02-10 16:04:05'),
(272, 30, 9, '2010-02-10 16:04:25'),
(273, 30, 2, '2010-02-10 16:07:17'),
(274, 30, 9, '2010-02-10 16:07:29'),
(275, 30, 9, '2010-02-10 16:08:11'),
(276, 30, 7, '2010-02-10 16:09:32'),
(277, 30, 2, '2010-02-10 16:12:17'),
(278, 30, 9, '2010-02-10 16:12:29'),
(279, 30, 9, '2010-02-10 16:14:24'),
(280, 30, 2, '2010-02-10 16:17:20'),
(281, 30, 9, '2010-02-10 16:17:35'),
(282, 30, 7, '2010-02-10 16:48:47'),
(283, 30, 2, '2010-02-10 17:24:11'),
(284, 30, 9, '2010-02-10 17:24:22'),
(285, 31, 9, '2010-02-10 17:25:29'),
(286, 31, 9, '2010-02-10 17:27:07'),
(287, 31, 2, '2010-02-10 17:28:33'),
(288, 31, 9, '2010-02-10 17:28:45'),
(289, 31, 9, '2010-02-10 17:29:20'),
(290, 31, 7, '2010-02-10 17:33:50'),
(291, 31, 2, '2010-02-10 17:35:52'),
(292, 31, 7, '2010-02-10 17:50:14'),
(293, 31, 7, '2010-02-10 17:53:10'),
(294, 31, 2, '2010-02-10 17:57:50'),
(295, 31, 7, '2010-02-10 17:58:02'),
(296, 31, 7, '2010-02-10 17:58:53'),
(297, 31, 7, '2010-02-10 17:59:31'),
(298, 31, 7, '2010-02-10 18:00:09'),
(299, 31, 7, '2010-02-10 18:00:59'),
(300, 31, 7, '2010-02-10 18:03:26'),
(301, 31, 7, '2010-02-10 18:03:44'),
(302, 31, 2, '2010-02-10 18:04:15'),
(303, 31, 7, '2010-02-10 18:04:27'),
(304, 31, 7, '2010-02-10 18:06:37'),
(305, 31, 7, '2010-02-10 18:08:18'),
(306, 31, 7, '2010-02-10 18:10:57'),
(307, 31, 2, '2010-02-10 18:12:40'),
(308, 31, 7, '2010-02-10 18:12:51'),
(309, 31, 2, '2010-02-10 18:13:53'),
(310, 31, 7, '2010-02-10 18:14:04'),
(311, 31, 7, '2010-02-10 18:14:20'),
(312, 31, 2, '2010-02-10 18:15:53'),
(313, 31, 7, '2010-02-10 18:16:04'),
(314, 31, 7, '2010-02-10 18:17:22'),
(315, 31, 7, '2010-02-10 18:18:10'),
(316, 31, 2, '2010-02-10 18:19:44'),
(317, 31, 7, '2010-02-10 18:19:54'),
(318, 31, 7, '2010-02-10 18:23:26'),
(319, 31, 2, '2010-02-10 18:29:50'),
(320, 31, 7, '2010-02-10 18:30:01'),
(321, 31, 7, '2010-02-10 18:30:24'),
(322, 32, 2, '2010-02-10 19:33:08'),
(323, 32, 7, '2010-02-10 19:33:21'),
(324, 32, 7, '2010-02-10 19:36:27'),
(325, 32, 7, '2010-02-10 19:36:39'),
(326, 32, 2, '2010-02-10 19:37:45'),
(327, 32, 7, '2010-02-10 19:37:56'),
(328, 32, 7, '2010-02-10 19:38:53'),
(329, 32, 7, '2010-02-10 19:39:11'),
(330, 32, 2, '2010-02-10 19:49:51'),
(331, 32, 7, '2010-02-10 19:50:05'),
(332, 32, 7, '2010-02-10 19:50:28'),
(333, 32, 2, '2010-02-10 19:56:36'),
(334, 32, 7, '2010-02-10 19:56:53'),
(335, 32, 7, '2010-02-10 20:01:34'),
(336, 32, 7, '2010-02-10 20:13:05'),
(337, 32, 2, '2010-02-10 20:13:37'),
(338, 32, 7, '2010-02-10 20:13:53'),
(339, 32, 9, '2010-02-10 20:15:17'),
(340, 32, 2, '2010-02-10 20:16:30'),
(341, 32, 2, '2010-02-10 20:21:00'),
(342, 32, 2, '2010-02-10 20:27:45'),
(343, 32, 2, '2010-02-10 20:28:38'),
(344, 32, 2, '2010-02-10 20:32:15'),
(345, 32, 2, '2010-02-10 20:33:04'),
(346, 32, 2, '2010-02-10 20:33:55'),
(347, 32, 2, '2010-02-10 20:42:02'),
(348, 32, 2, '2010-02-10 21:00:18'),
(349, 32, 7, '2010-02-10 21:00:39'),
(350, 32, 8, '2010-02-10 21:01:05'),
(351, 32, 9, '2010-02-10 21:01:24'),
(352, 33, 9, '2010-02-10 21:28:16'),
(353, 33, 2, '2010-02-10 21:29:32'),
(354, 33, 9, '2010-02-10 21:30:00'),
(355, 33, 9, '2010-02-10 21:30:09'),
(356, 33, 2, '2010-02-10 21:30:37'),
(357, 33, 9, '2010-02-10 21:30:50'),
(358, 33, 2, '2010-02-10 21:31:12'),
(359, 33, 9, '2010-02-10 21:31:26'),
(360, 33, 8, '2010-02-10 21:32:26'),
(361, 33, 9, '2010-02-10 21:32:49'),
(362, 33, 7, '2010-02-10 21:34:00'),
(363, 33, 2, '2010-02-10 21:36:28'),
(364, 33, 9, '2010-02-10 21:36:47'),
(365, 33, 2, '2010-02-10 21:37:24'),
(366, 33, 2, '2010-02-10 21:37:33'),
(367, 33, 9, '2010-02-10 21:37:51'),
(368, 33, 2, '2010-02-10 21:38:30'),
(369, 33, 9, '2010-02-10 21:38:43'),
(370, 33, 2, '2010-02-10 21:39:34'),
(371, 33, 9, '2010-02-10 21:39:47'),
(372, 33, 9, '2010-02-10 21:40:41'),
(373, 33, 7, '2010-02-10 21:40:57'),
(374, 33, 1, '2010-02-10 21:42:08'),
(375, 33, 3, '2010-02-10 21:42:19'),
(376, 33, 1, '2010-02-10 21:42:35'),
(377, 33, 2, '2010-02-10 21:42:40'),
(378, 33, 8, '2010-02-10 21:43:00'),
(379, 33, 9, '2010-02-10 21:43:05'),
(380, 33, 4, '2010-02-10 21:44:06'),
(381, 33, 4, '2010-02-10 21:44:21'),
(382, 33, 9, '2010-02-10 21:44:33'),
(383, 33, 2, '2010-02-10 21:45:47'),
(384, 33, 9, '2010-02-10 21:46:03'),
(385, 33, 9, '2010-02-10 21:50:31'),
(386, 34, 2, '2010-02-10 22:00:54'),
(387, 34, 9, '2010-02-10 22:01:11'),
(388, 34, 9, '2010-02-10 22:01:24'),
(389, 34, 9, '2010-02-10 22:01:29'),
(390, 34, 9, '2010-02-10 22:02:22'),
(391, 34, 2, '2010-02-10 22:07:18'),
(392, 34, 9, '2010-02-10 22:07:35'),
(393, 34, 9, '2010-02-10 22:08:24'),
(394, 34, 9, '2010-02-10 22:09:19'),
(395, 34, 2, '2010-02-10 22:16:25'),
(396, 34, 9, '2010-02-10 22:16:36'),
(397, 34, 2, '2010-02-10 22:16:45'),
(398, 34, 2, '2010-02-10 22:18:17'),
(399, 34, 9, '2010-02-10 22:18:27'),
(400, 34, 2, '2010-02-10 22:21:31'),
(401, 34, 9, '2010-02-10 22:21:42'),
(402, 35, 9, '2010-02-10 22:23:08'),
(403, 35, 9, '2010-02-10 22:24:10'),
(404, 35, 9, '2010-02-10 22:24:39'),
(405, 35, 9, '2010-02-10 22:24:44'),
(406, 35, 2, '2010-02-10 22:25:57'),
(407, 35, 9, '2010-02-10 22:26:08'),
(408, 35, 2, '2010-02-10 22:33:50'),
(409, 35, 9, '2010-02-10 22:34:02'),
(410, 35, 2, '2010-02-10 22:36:07'),
(411, 35, 9, '2010-02-10 22:36:17'),
(412, 35, 9, '2010-02-10 22:36:28'),
(413, 35, 2, '2010-02-10 22:37:56'),
(414, 35, 9, '2010-02-10 22:38:05'),
(415, 35, 9, '2010-02-10 22:39:15'),
(416, 35, 2, '2010-02-10 22:39:33'),
(417, 35, 3, '2010-02-10 22:39:39'),
(418, 35, 2, '2010-02-10 22:43:01'),
(419, 35, 9, '2010-02-10 22:43:12'),
(420, 35, 2, '2010-02-10 22:43:53'),
(421, 35, 9, '2010-02-10 22:44:01'),
(422, 35, 2, '2010-02-10 22:45:20'),
(423, 35, 9, '2010-02-10 22:45:29'),
(424, 35, 2, '2010-02-10 22:51:58'),
(425, 35, 9, '2010-02-10 22:52:09'),
(426, 35, 2, '2010-02-10 22:52:39'),
(427, 35, 9, '2010-02-10 22:52:50'),
(428, 35, 2, '2010-02-10 22:53:22'),
(429, 35, 2, '2010-02-10 22:57:06'),
(430, 35, 9, '2010-02-10 22:57:15'),
(431, 35, 9, '2010-02-10 22:59:11'),
(432, 36, 2, '2010-02-10 23:32:22'),
(433, 36, 9, '2010-02-10 23:32:34'),
(434, 36, 2, '2010-02-10 23:33:26'),
(435, 36, 9, '2010-02-10 23:33:39'),
(436, 36, 9, '2010-02-10 23:34:21'),
(437, 36, 3, '2010-02-10 23:37:32'),
(438, 36, 3, '2010-02-10 23:37:54'),
(439, 36, 2, '2010-02-10 23:39:28'),
(440, 36, 9, '2010-02-10 23:39:35'),
(441, 36, 9, '2010-02-10 23:42:54'),
(442, 36, 2, '2010-02-10 23:43:47'),
(443, 36, 9, '2010-02-10 23:43:56'),
(444, 36, 9, '2010-02-10 23:44:29'),
(445, 36, 2, '2010-02-10 23:47:37'),
(446, 36, 9, '2010-02-10 23:47:46'),
(447, 37, 9, '2010-02-10 23:50:00'),
(448, 37, 9, '2010-02-10 23:50:32'),
(449, 37, 2, '2010-02-10 23:52:55'),
(450, 37, 9, '2010-02-10 23:53:06'),
(451, 37, 2, '2010-02-10 23:54:43'),
(452, 37, 9, '2010-02-10 23:54:52'),
(453, 37, 2, '2010-02-10 23:56:05'),
(454, 37, 9, '2010-02-10 23:56:15'),
(455, 37, 9, '2010-02-10 23:56:28'),
(456, 37, 2, '2010-02-10 23:57:08'),
(457, 37, 9, '2010-02-10 23:57:19'),
(458, 37, 9, '2010-02-10 23:57:29'),
(459, 37, 2, '2010-02-10 23:59:42'),
(460, 37, 9, '2010-02-10 23:59:53'),
(461, 37, 7, '2010-02-11 00:01:26'),
(462, 38, 9, '2010-02-11 00:29:23'),
(463, 38, 2, '2010-02-11 00:29:40'),
(464, 38, 3, '2010-02-11 00:29:49'),
(465, 38, 1, '2010-02-11 00:29:54'),
(466, 39, 9, '2010-02-11 01:30:13'),
(467, 39, 2, '2010-02-11 01:30:27'),
(468, 39, 2, '2010-02-11 01:50:12'),
(469, 39, 9, '2010-02-11 01:53:56'),
(470, 39, 9, '2010-02-11 01:54:50'),
(471, 39, 9, '2010-02-11 01:55:10'),
(472, 39, 7, '2010-02-11 01:56:10'),
(473, 39, 2, '2010-02-11 01:58:54'),
(474, 39, 9, '2010-02-11 01:59:07'),
(475, 39, 9, '2010-02-11 01:59:20'),
(476, 39, 2, '2010-02-11 02:01:33'),
(477, 39, 9, '2010-02-11 02:01:46'),
(478, 39, 2, '2010-02-11 02:04:42'),
(479, 39, 9, '2010-02-11 02:04:52'),
(480, 39, 2, '2010-02-11 02:05:41'),
(481, 39, 9, '2010-02-11 02:05:53'),
(482, 39, 2, '2010-02-11 02:07:45'),
(483, 39, 9, '2010-02-11 02:07:59'),
(484, 39, 2, '2010-02-11 02:08:46'),
(485, 39, 9, '2010-02-11 02:08:55'),
(486, 39, 9, '2010-02-11 02:10:58'),
(487, 39, 9, '2010-02-11 02:14:07'),
(488, 39, 2, '2010-02-11 02:15:11'),
(489, 39, 9, '2010-02-11 02:15:24'),
(490, 39, 2, '2010-02-11 02:18:54'),
(491, 39, 9, '2010-02-11 02:19:11'),
(492, 39, 9, '2010-02-11 02:19:57'),
(493, 39, 2, '2010-02-11 02:23:19'),
(494, 39, 9, '2010-02-11 02:23:30'),
(495, 39, 2, '2010-02-11 02:26:38'),
(496, 39, 2, '2010-02-11 02:26:53'),
(497, 39, 9, '2010-02-11 02:27:08'),
(498, 39, 2, '2010-02-11 02:30:12'),
(499, 39, 9, '2010-02-11 02:30:23'),
(500, 39, 2, '2010-02-11 02:31:23'),
(501, 39, 9, '2010-02-11 02:31:35'),
(502, 39, 2, '2010-02-11 02:32:24'),
(503, 39, 9, '2010-02-11 02:32:40'),
(504, 39, 2, '2010-02-11 02:33:31'),
(505, 39, 9, '2010-02-11 02:33:42'),
(506, 39, 2, '2010-02-11 02:36:48'),
(507, 39, 9, '2010-02-11 02:37:01'),
(508, 39, 2, '2010-02-11 02:37:27'),
(509, 39, 9, '2010-02-11 02:37:40'),
(510, 39, 2, '2010-02-11 02:38:16'),
(511, 39, 9, '2010-02-11 02:38:27'),
(512, 39, 9, '2010-02-11 02:38:46'),
(513, 39, 2, '2010-02-11 02:41:31'),
(514, 39, 9, '2010-02-11 02:41:46'),
(515, 39, 2, '2010-02-11 02:42:45'),
(516, 39, 9, '2010-02-11 02:42:55'),
(517, 39, 2, '2010-02-11 02:44:27'),
(518, 39, 9, '2010-02-11 02:44:37'),
(519, 39, 2, '2010-02-11 02:45:27'),
(520, 39, 9, '2010-02-11 02:50:55'),
(521, 39, 9, '2010-02-11 02:51:04'),
(522, 39, 2, '2010-02-11 02:52:19'),
(523, 39, 9, '2010-02-11 02:52:30'),
(524, 39, 9, '2010-02-11 02:52:41'),
(525, 39, 2, '2010-02-11 02:58:27'),
(526, 39, 9, '2010-02-11 02:58:39'),
(527, 39, 2, '2010-02-11 02:59:36'),
(528, 39, 9, '2010-02-11 02:59:48'),
(529, 39, 9, '2010-02-11 02:59:57'),
(530, 39, 9, '2010-02-11 03:00:04'),
(531, 39, 2, '2010-02-11 03:01:24'),
(532, 39, 9, '2010-02-11 03:01:37'),
(533, 40, 9, '2010-02-11 03:04:14'),
(534, 40, 7, '2010-02-11 03:04:24'),
(535, 40, 2, '2010-02-11 03:05:02'),
(536, 40, 9, '2010-02-11 03:06:37'),
(537, 40, 9, '2010-02-11 03:06:52'),
(538, 40, 9, '2010-02-11 03:07:42'),
(539, 40, 2, '2010-02-11 03:08:39'),
(540, 40, 2, '2010-02-11 03:15:32'),
(541, 40, 9, '2010-02-11 03:15:46'),
(542, 40, 9, '2010-02-11 03:17:23'),
(543, 40, 2, '2010-02-11 03:22:29'),
(544, 40, 9, '2010-02-11 03:22:42'),
(545, 40, 2, '2010-02-11 03:24:14'),
(546, 40, 9, '2010-02-11 03:24:25'),
(547, 41, 2, '2010-02-11 04:03:03'),
(548, 41, 2, '2010-02-11 04:03:17'),
(549, 41, 9, '2010-02-11 04:03:37'),
(550, 41, 2, '2010-02-11 04:05:01'),
(551, 41, 9, '2010-02-11 04:05:14'),
(552, 41, 9, '2010-02-11 04:06:46'),
(553, 41, 9, '2010-02-11 04:07:39'),
(554, 41, 9, '2010-02-11 04:08:32'),
(555, 41, 9, '2010-02-11 04:10:52'),
(556, 41, 2, '2010-02-11 04:12:28'),
(557, 41, 2, '2010-02-11 04:12:36'),
(558, 41, 9, '2010-02-11 04:12:49'),
(559, 41, 9, '2010-02-11 04:15:56'),
(560, 41, 2, '2010-02-11 04:17:01'),
(561, 41, 9, '2010-02-11 04:17:13'),
(562, 41, 9, '2010-02-11 04:17:27'),
(563, 41, 2, '2010-02-11 04:17:55'),
(564, 41, 2, '2010-02-11 04:18:03'),
(565, 41, 9, '2010-02-11 04:18:18'),
(566, 41, 2, '2010-02-11 04:22:24'),
(567, 41, 9, '2010-02-11 04:22:36'),
(568, 41, 9, '2010-02-11 04:22:47'),
(569, 41, 9, '2010-02-11 04:25:39'),
(570, 41, 9, '2010-02-11 04:26:20'),
(571, 41, 9, '2010-02-11 04:27:04'),
(572, 41, 9, '2010-02-11 04:28:31'),
(573, 41, 9, '2010-02-11 04:31:31'),
(574, 41, 9, '2010-02-11 04:32:14'),
(575, 41, 9, '2010-02-11 04:37:12'),
(576, 41, 2, '2010-02-11 04:39:16'),
(577, 41, 9, '2010-02-11 04:39:29'),
(578, 41, 9, '2010-02-11 04:40:19'),
(579, 41, 9, '2010-02-11 04:40:40'),
(580, 41, 2, '2010-02-11 04:42:27'),
(581, 41, 9, '2010-02-11 04:42:40'),
(582, 41, 9, '2010-02-11 04:42:57'),
(583, 41, 9, '2010-02-11 04:45:01'),
(584, 41, 9, '2010-02-11 04:46:57'),
(585, 41, 9, '2010-02-11 04:47:15'),
(586, 41, 7, '2010-02-11 04:48:38'),
(587, 41, 9, '2010-02-11 04:49:27'),
(588, 41, 2, '2010-02-11 05:17:27'),
(589, 41, 2, '2010-02-11 05:17:27'),
(590, 41, 9, '2010-02-11 05:17:43'),
(591, 41, 2, '2010-02-11 05:20:22'),
(592, 41, 9, '2010-02-11 05:20:35'),
(593, 41, 2, '2010-02-11 05:21:06'),
(594, 41, 9, '2010-02-11 05:21:17'),
(595, 41, 9, '2010-02-11 05:21:26'),
(596, 42, 9, '2010-02-11 05:22:04'),
(597, 42, 9, '2010-02-11 05:22:18'),
(598, 43, 9, '2010-02-11 05:23:16'),
(599, 43, 9, '2010-02-11 05:23:48'),
(600, 44, 9, '2010-02-11 05:30:24'),
(601, 44, 2, '2010-02-11 05:33:06'),
(602, 44, 9, '2010-02-11 05:33:18'),
(603, 44, 2, '2010-02-11 05:34:10'),
(604, 44, 9, '2010-02-11 05:34:22'),
(605, 44, 2, '2010-02-11 05:34:52'),
(606, 44, 9, '2010-02-11 05:35:02'),
(607, 44, 2, '2010-02-11 05:36:11'),
(608, 44, 9, '2010-02-11 05:36:24'),
(609, 44, 2, '2010-02-11 05:40:16'),
(610, 44, 9, '2010-02-11 05:49:02'),
(611, 44, 2, '2010-02-11 05:50:18'),
(612, 44, 9, '2010-02-11 05:50:29'),
(613, 44, 9, '2010-02-11 05:50:55'),
(614, 44, 2, '2010-02-11 05:51:37'),
(615, 44, 9, '2010-02-11 05:51:46'),
(616, 45, 9, '2010-02-11 05:53:48'),
(617, 45, 2, '2010-02-11 05:56:06'),
(618, 45, 9, '2010-02-11 05:56:18'),
(619, 46, 9, '2010-02-11 05:57:38'),
(620, 46, 2, '2010-02-11 06:00:49'),
(621, 46, 9, '2010-02-11 06:00:59'),
(622, 46, 2, '2010-02-11 06:02:06'),
(623, 46, 9, '2010-02-11 06:02:15'),
(624, 46, 2, '2010-02-11 06:03:11'),
(625, 46, 9, '2010-02-11 06:03:20'),
(626, 46, 2, '2010-02-11 06:03:34'),
(627, 46, 9, '2010-02-11 06:03:44'),
(628, 46, 2, '2010-02-11 06:04:16'),
(629, 46, 9, '2010-02-11 06:04:26'),
(630, 46, 2, '2010-02-11 06:05:04'),
(631, 46, 2, '2010-02-11 06:05:27'),
(632, 46, 1, '2010-02-11 06:06:50'),
(633, 46, 3, '2010-02-11 06:06:55'),
(634, 46, 2, '2010-02-11 06:07:04'),
(635, 46, 7, '2010-02-11 06:07:09'),
(636, 46, 8, '2010-02-11 06:07:14'),
(637, 46, 2, '2010-02-11 06:07:40'),
(638, 46, 8, '2010-02-11 06:08:10'),
(639, 46, 7, '2010-02-11 06:08:24'),
(640, 46, 2, '2010-02-11 06:08:56'),
(641, 46, 9, '2010-02-11 06:10:35'),
(642, 46, 8, '2010-02-11 06:11:35'),
(643, 46, 9, '2010-02-11 06:11:38'),
(644, 46, 7, '2010-02-11 06:11:45'),
(645, 46, 2, '2010-02-11 06:14:27'),
(646, 46, 9, '2010-02-11 06:14:38'),
(647, 46, 9, '2010-02-11 06:15:56'),
(648, 46, 1, '2010-02-11 06:16:22'),
(649, 46, 8, '2010-02-11 06:16:29'),
(650, 46, 1, '2010-02-11 06:17:12'),
(651, 46, 2, '2010-02-11 06:17:40'),
(652, 46, 2, '2010-02-11 06:22:45'),
(653, 46, 9, '2010-02-11 06:22:50'),
(654, 46, 8, '2010-02-11 06:35:30'),
(655, 47, 4, '2010-02-11 06:36:33'),
(656, 47, 2, '2010-02-11 06:36:55'),
(657, 47, 4, '2010-02-11 06:37:58'),
(658, 47, 1, '2010-02-11 06:38:31'),
(659, 47, 4, '2010-02-11 06:39:48'),
(660, 47, 10, '2010-02-11 06:40:11'),
(661, 47, 2, '2010-02-11 06:40:26'),
(662, 47, 4, '2010-02-11 06:48:06'),
(663, 47, 4, '2010-02-11 06:48:36'),
(664, 47, 4, '2010-02-11 06:48:52'),
(665, 47, 2, '2010-02-11 06:49:52'),
(666, 47, 1, '2010-02-11 06:50:13'),
(667, 47, 4, '2010-02-11 06:50:17'),
(668, 47, 2, '2010-02-11 06:50:25'),
(669, 47, 4, '2010-02-11 06:51:52'),
(670, 47, 7, '2010-02-11 06:53:19'),
(671, 47, 8, '2010-02-11 06:53:23'),
(672, 47, 2, '2010-02-11 06:53:29'),
(673, 47, 8, '2010-02-11 06:57:09'),
(674, 47, 9, '2010-02-11 06:57:16'),
(675, 47, 4, '2010-02-11 06:57:28'),
(676, 47, 3, '2010-02-11 06:57:35'),
(677, 47, 8, '2010-02-11 06:57:47'),
(678, 47, 10, '2010-02-11 06:57:52'),
(679, 47, 7, '2010-02-11 07:02:36'),
(680, 47, 8, '2010-02-11 07:02:40'),
(681, 47, 9, '2010-02-11 07:02:49'),
(682, 47, 10, '2010-02-11 07:03:01'),
(683, 47, 2, '2010-02-11 07:04:42'),
(684, 47, 4, '2010-02-11 07:05:42'),
(685, 47, 2, '2010-02-11 07:06:03'),
(686, 47, 10, '2010-02-11 07:14:10'),
(687, 47, 2, '2010-02-11 07:15:21'),
(688, 47, 10, '2010-02-11 07:15:31'),
(689, 47, 10, '2010-02-11 07:16:55'),
(690, 47, 2, '2010-02-11 07:18:00'),
(691, 47, 9, '2010-02-11 07:18:14'),
(692, 47, 10, '2010-02-11 07:18:19'),
(693, 47, 10, '2010-02-11 07:19:01'),
(694, 48, 10, '2010-02-11 07:19:41'),
(695, 48, 10, '2010-02-11 07:19:52'),
(696, 49, 2, '2010-02-11 07:21:51'),
(697, 49, 10, '2010-02-11 07:22:03'),
(698, 49, 10, '2010-02-11 07:23:09'),
(699, 49, 2, '2010-02-11 07:23:33'),
(700, 49, 10, '2010-02-11 07:23:45'),
(701, 49, 10, '2010-02-11 07:24:09'),
(702, 49, 2, '2010-02-11 07:24:41'),
(703, 49, 2, '2010-02-11 07:25:37'),
(704, 49, 10, '2010-02-11 07:28:00'),
(705, 49, 10, '2010-02-11 07:28:28'),
(706, 49, 2, '2010-02-11 07:28:43'),
(707, 49, 10, '2010-02-11 07:31:00'),
(708, 49, 10, '2010-02-11 07:32:20'),
(709, 49, 10, '2010-02-11 07:34:51'),
(710, 49, 10, '2010-02-11 07:39:07'),
(711, 49, 7, '2010-02-11 07:40:15'),
(712, 49, 10, '2010-02-11 07:50:39'),
(713, 49, 10, '2010-02-11 07:51:48'),
(714, 49, 9, '2010-02-11 07:53:23'),
(715, 49, 9, '2010-02-11 07:54:55'),
(716, 49, 8, '2010-02-11 07:55:00'),
(717, 49, 10, '2010-02-11 07:55:30'),
(718, 49, 2, '2010-02-11 08:08:27'),
(719, 49, 10, '2010-02-11 08:09:11'),
(720, 49, 3, '2010-02-11 08:09:29'),
(721, 49, 1, '2010-02-11 08:09:42'),
(722, 49, 8, '2010-02-11 08:09:55'),
(723, 49, 7, '2010-02-11 08:10:00'),
(724, 49, 10, '2010-02-11 08:31:44'),
(725, 49, 2, '2010-02-11 08:33:23'),
(726, 49, 9, '2010-02-11 08:35:05'),
(727, 49, 10, '2010-02-11 08:46:18'),
(728, 50, 10, '2010-02-11 08:46:54'),
(729, 50, 10, '2010-02-11 08:47:01'),
(730, 51, 10, '2010-02-11 08:47:58'),
(731, 51, 10, '2010-02-11 08:48:27'),
(732, 51, 2, '2010-02-11 08:49:01'),
(733, 51, 2, '2010-02-11 08:49:09'),
(734, 51, 10, '2010-02-11 08:49:24'),
(735, 51, 2, '2010-02-11 08:50:13'),
(736, 51, 10, '2010-02-11 08:50:27'),
(737, 51, 2, '2010-02-11 08:52:05'),
(738, 51, 10, '2010-02-11 08:52:17'),
(739, 51, 2, '2010-02-11 08:53:19'),
(740, 51, 10, '2010-02-11 08:53:30'),
(741, 51, 2, '2010-02-11 08:54:53'),
(742, 51, 9, '2010-02-11 08:58:17'),
(743, 51, 9, '2010-02-11 08:58:28'),
(744, 51, 2, '2010-02-11 08:58:48'),
(745, 51, 9, '2010-02-11 09:00:07'),
(746, 51, 2, '2010-02-11 09:00:57'),
(747, 51, 9, '2010-02-11 09:01:10'),
(748, 51, 2, '2010-02-11 09:02:05'),
(749, 51, 2, '2010-02-11 09:02:13'),
(750, 51, 9, '2010-02-11 09:02:28'),
(751, 51, 9, '2010-02-11 09:03:25'),
(752, 51, 2, '2010-02-11 09:08:35'),
(753, 51, 9, '2010-02-11 09:08:55'),
(754, 51, 10, '2010-02-11 09:10:01'),
(755, 51, 9, '2010-02-11 09:10:22'),
(756, 51, 9, '2010-02-11 09:10:59'),
(757, 51, 3, '2010-02-11 09:11:29'),
(758, 51, 1, '2010-02-11 09:11:34'),
(759, 51, 1, '2010-02-11 09:11:39'),
(760, 51, 2, '2010-02-11 09:11:42'),
(761, 51, 7, '2010-02-11 09:11:50'),
(762, 51, 9, '2010-02-11 09:11:56'),
(763, 51, 10, '2010-02-11 09:12:22'),
(764, 51, 2, '2010-02-11 09:23:23'),
(765, 51, 10, '2010-02-11 09:31:50'),
(766, 51, 2, '2010-02-11 09:32:17'),
(767, 51, 2, '2010-02-11 09:32:27'),
(768, 51, 10, '2010-02-11 09:32:42'),
(769, 51, 2, '2010-02-11 09:34:11'),
(770, 51, 10, '2010-02-11 09:34:27'),
(771, 51, 2, '2010-02-11 09:34:45'),
(772, 52, 10, '2010-02-11 09:38:59'),
(773, 52, 2, '2010-02-11 09:41:38'),
(774, 52, 10, '2010-02-11 09:41:53'),
(775, 53, 10, '2010-02-11 09:43:45'),
(776, 54, 10, '2010-02-11 09:44:57'),
(777, 54, 10, '2010-02-11 09:45:17'),
(778, 54, 2, '2010-02-11 09:47:29'),
(779, 54, 10, '2010-02-11 09:47:40'),
(780, 54, 10, '2010-02-11 09:47:56'),
(781, 54, 2, '2010-02-11 09:49:01'),
(782, 54, 10, '2010-02-11 09:49:12'),
(783, 54, 3, '2010-02-11 09:50:02'),
(784, 54, 2, '2010-02-11 09:54:03'),
(785, 55, 3, '2010-02-11 09:55:58'),
(786, 55, 10, '2010-02-11 09:56:29'),
(787, 55, 2, '2010-02-11 09:56:45'),
(788, 55, 10, '2010-02-11 09:57:16'),
(789, 55, 2, '2010-02-11 09:57:26'),
(790, 55, 10, '2010-02-11 09:58:07'),
(791, 55, 10, '2010-02-11 09:58:21'),
(792, 55, 2, '2010-02-11 09:59:02'),
(793, 55, 10, '2010-02-11 09:59:14'),
(794, 55, 2, '2010-02-11 09:59:32'),
(795, 55, 10, '2010-02-11 09:59:42'),
(796, 55, 2, '2010-02-11 10:00:52'),
(797, 55, 10, '2010-02-11 10:01:01'),
(798, 55, 7, '2010-02-11 10:01:34'),
(799, 55, 3, '2010-02-11 10:01:53'),
(800, 55, 1, '2010-02-11 10:02:05'),
(801, 55, 2, '2010-02-11 10:02:17'),
(802, 55, 9, '2010-02-11 10:02:32'),
(803, 55, 8, '2010-02-11 10:02:58'),
(804, 55, 9, '2010-02-11 10:03:11'),
(805, 55, 10, '2010-02-11 10:03:25'),
(806, 55, 7, '2010-02-11 10:03:48'),
(807, 55, 8, '2010-02-11 10:03:57'),
(808, 55, 7, '2010-02-11 10:04:10'),
(809, 55, 9, '2010-02-11 10:04:19'),
(810, 55, 1, '2010-02-11 10:04:36'),
(811, 55, 10, '2010-02-11 10:04:55'),
(812, 55, 2, '2010-02-11 10:06:40'),
(813, 55, 9, '2010-02-11 10:08:43'),
(814, 55, 3, '2010-02-11 10:09:03');

-- --------------------------------------------------------

--
-- Table structure for table `system_sessions`
--

CREATE TABLE IF NOT EXISTS `system_sessions` (
  `session_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `session_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`session_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `system_sessions`
--

INSERT INTO `system_sessions` (`session_id`, `user_id`, `session_date`) VALUES
(1, 4, '2010-02-09 00:18:52'),
(2, 1, '2010-02-09 00:19:24'),
(3, 4, '2010-02-09 00:19:57'),
(4, 1, '2010-02-09 00:21:03'),
(5, 1, '2010-02-09 00:28:47'),
(6, 1, '2010-02-09 01:30:35'),
(7, 1, '2010-02-09 02:02:48'),
(8, 1, '2010-02-09 02:04:34'),
(9, 1, '2010-02-09 02:11:52'),
(10, 1, '2010-02-09 02:31:20'),
(11, 1, '2010-02-09 08:48:20'),
(12, 1, '2010-02-09 23:47:02'),
(13, 1, '2010-02-10 00:07:40'),
(14, 1, '2010-02-10 01:17:58'),
(15, 1, '2010-02-10 01:21:32'),
(16, 1, '2010-02-10 01:36:45'),
(17, 1, '2010-02-10 01:39:52'),
(18, 1, '2010-02-10 03:03:07'),
(19, 1, '2010-02-10 03:11:55'),
(20, 1, '2010-02-10 03:12:32'),
(21, 1, '2010-02-10 03:12:42'),
(22, 1, '2010-02-10 03:16:24'),
(23, 1, '2010-02-10 05:19:35'),
(24, 1, '2010-02-10 05:29:16'),
(25, 1, '2010-02-10 05:38:54'),
(26, 1, '2010-02-10 05:39:46'),
(27, 1, '2010-02-10 05:42:00'),
(28, 1, '2010-02-10 14:43:27'),
(29, 1, '2010-02-10 15:53:12'),
(30, 1, '2010-02-10 16:03:38'),
(31, 1, '2010-02-10 17:25:26'),
(32, 1, '2010-02-10 19:33:04'),
(33, 1, '2010-02-10 21:28:12'),
(34, 1, '2010-02-10 22:00:52'),
(35, 1, '2010-02-10 22:23:05'),
(36, 1, '2010-02-10 23:32:16'),
(37, 1, '2010-02-10 23:49:58'),
(38, 1, '2010-02-11 00:29:17'),
(39, 1, '2010-02-11 01:30:10'),
(40, 1, '2010-02-11 03:04:12'),
(41, 1, '2010-02-11 04:03:00'),
(42, 1, '2010-02-11 05:22:00'),
(43, 1, '2010-02-11 05:23:13'),
(44, 1, '2010-02-11 05:30:21'),
(45, 1, '2010-02-11 05:53:44'),
(46, 1, '2010-02-11 05:57:34'),
(47, 1, '2010-02-11 06:36:29'),
(48, 1, '2010-02-11 07:19:37'),
(49, 1, '2010-02-11 07:21:46'),
(50, 1, '2010-02-11 08:46:51'),
(51, 1, '2010-02-11 08:47:54'),
(52, 1, '2010-02-11 09:38:54'),
(53, 1, '2010-02-11 09:43:41'),
(54, 1, '2010-02-11 09:44:53'),
(55, 1, '2010-02-11 09:55:52');

-- --------------------------------------------------------

--
-- Table structure for table `system_user_accounts`
--

CREATE TABLE IF NOT EXISTS `system_user_accounts` (
  `user_id` int(11) NOT NULL auto_increment,
  `group_id` int(11) NOT NULL,
  `employee_id` int(11) default NULL,
  `user_name` varchar(10) NOT NULL,
  `user_password` char(40) NOT NULL,
  `user_type` int(11) NOT NULL,
  PRIMARY KEY  (`user_id`),
  KEY `group_id` (`group_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `system_user_accounts`
--

INSERT INTO `system_user_accounts` (`user_id`, `group_id`, `employee_id`, `user_name`, `user_password`, `user_type`) VALUES
(1, 1, 1, 'admin', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 1),
(2, 1, 1, 'test2', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 1),
(4, 2, 1, 'freddrick', '6cbe8a8b80b7279c132877bdb7f0e621d5a90707', 0),
(5, 3, 1, 'test222', 'dc724af18fbdd4e59189f5fe768a5f8311527050', 0);

-- --------------------------------------------------------

--
-- Table structure for table `training_course_modules`
--

CREATE TABLE IF NOT EXISTS `training_course_modules` (
  `course_module_id` int(11) NOT NULL auto_increment,
  `course_id` int(11) NOT NULL,
  `course_module_title` varchar(25) NOT NULL,
  `course_module_contents` varchar(250) NOT NULL,
  PRIMARY KEY  (`course_module_id`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `training_course_modules`
--

INSERT INTO `training_course_modules` (`course_module_id`, `course_id`, `course_module_title`, `course_module_contents`) VALUES
(1, 3, 'stage1', 'Blah Blah');

-- --------------------------------------------------------

--
-- Table structure for table `training_courses`
--

CREATE TABLE IF NOT EXISTS `training_courses` (
  `course_id` int(11) NOT NULL auto_increment,
  `course_title` varchar(25) NOT NULL,
  `course_description` varchar(250) NOT NULL,
  PRIMARY KEY  (`course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `training_courses`
--

INSERT INTO `training_courses` (`course_id`, `course_title`, `course_description`) VALUES
(3, 'Being Awesome', 'Yeah, blah blkah blah');

-- --------------------------------------------------------

--
-- Table structure for table `training_event_attendees`
--

CREATE TABLE IF NOT EXISTS `training_event_attendees` (
  `attendee_id` int(11) NOT NULL auto_increment,
  `training_event_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `attendee_status` int(11) NOT NULL,
  PRIMARY KEY  (`attendee_id`),
  KEY `training_event_id` (`training_event_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `training_event_attendees`
--


-- --------------------------------------------------------

--
-- Table structure for table `training_events`
--

CREATE TABLE IF NOT EXISTS `training_events` (
  `training_event_id` int(11) NOT NULL auto_increment,
  `sectionalised_id` int(11) NOT NULL,
  `trainer_id` int(11) NOT NULL,
  `course_module_id` int(11) NOT NULL,
  `expiry_date` datetime NOT NULL,
  `cost_per_person` decimal(10,2) NOT NULL,
  `event_start` datetime NOT NULL,
  `event_end` datetime NOT NULL,
  `event_status` int(11) NOT NULL,
  PRIMARY KEY  (`training_event_id`),
  KEY `sectionalised_id` (`sectionalised_id`),
  KEY `trainer_id` (`trainer_id`),
  KEY `course_module_id` (`course_module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT AUTO_INCREMENT=1 ;

--
-- Dumping data for table `training_events`
--


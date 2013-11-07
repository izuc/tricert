Ext.onReady(function () {
    Ext.QuickTips.init();
    Ext.form.Field.prototype.msgTarget = 'side';
    Ext.app.REMOTING_API.enableBuffer = 100;
    Ext.Direct.addProvider(Ext.app.REMOTING_API);
    Ext.ScriptMgr.load({
        scripts: ['js/plugins/Ext.ux.TaskBar.js', 'js/plugins/Ext.ux.Mdi.js', 'js/plugins/Ext.ux.Notification.js', 'js/plugins/Ext.ux.grid.RowEditor.js'],
        callback: function () {
            Navigation = Ext.extend(Ext.Toolbar, {
                renderTo: 'navigation',
                width: 960,
                height: 50,
                style: 'border: 1px solid #000; padding-top: 10px;',
                load: function () {
                    var instance = this;
                    instance.removeAll();
                    Category.getMenu(0, function (result, e) {
                        instance.populate(result, instance);
                        instance.doLayout();
                    });
                },
                populate: function (records, menu) {
                    for (var i = 0; i < records.length; i++) {
                        if (records[i].handler) {
                            eval('records[i].handler = ' + records[i].handler);
                        }
                        if (records[i].menu) {
                            eval('records[i].menu = ' + records[i].menu);
                        }
                        menu.add(records[i]);
                    }
                },
                createMenu: function (parentId) {
                    var menu = new Ext.menu.Menu();
                    var main = this;
                    menu.on('show', function () {
                        var instance = this;
                        instance.menu.removeAll();
                        instance.menu.add('<span class=\'loading-indicator\'>Loading...</span>');
                        Category.getMenu(instance.parentId, function (result, e) {
                            instance.menu.removeAll();
                            if (result.length > 0) {
                                main.populate(result, instance.menu);
                            } else {
                                instance.menu.add({
                                    text: 'empty'
                                });
                            }
                        });
                    },
                    {
                        menu: menu,
                        parentId: parentId
                    });
                    return menu;
                }
            });
            CommandStrip = Ext.extend(Ext.Toolbar, {
                renderTo: 'mdi_commands',
                height: 30,
                style: 'background-image: none; background-color: transparent;',
                load: function (commands) {
                    var instance = this;
                    instance.removeAll();
                    Ext.each(commands, function (command, index) {
                        instance.add({
                            xtype: 'tbbutton',
                            cls: 'x-btn-text-icon',
                            icon: 'theme/images/icons/' + command.name + '.png',
                            text: command.name,
                            handler: command.handler
                        });
                    });
                    instance.doLayout();
                    return true;
                }
            });
            TricertAssist = {
                mdi: new Ext.ux.Mdi(),
                navigation: new Navigation(),
                toolbar: new CommandStrip(),
                showWindow: function (items, config) {
                    var win = this.mdi.createWindow({
                        id: this.generateUniqueID('win'),
                        toolbar: this.toolbar,
                        handlers: config.commands,
                        title: config.text || 'Management Section',
                        width: config.width,
                        height: config.height,
                        iconCls: config.icon || 'icon-window',
                        layout: config.layout || 'fit',
                        defaults: {
                            autoScroll: true
                        },
                        shim: false,
                        animCollapse: false,
                        constrainHeader: true,
                        items: items
                    });
                    win.show();
                },
                loadModule: function (moduleID) {
                    Section.loadModule(moduleID, function (response, e) {
                        if (response.success) {
                            (new Function('(function(module, commands) { ' + response.data.module.moduleSource + '  })(' + Ext.util.JSON.encode(response.data.module) + ', ' + Ext.util.JSON.encode(response.data.commands) + ');'))();
                        }
                        TricertAssist.showNotification(response);
                    });
                },
                generateUniqueID: function (prefix) {
                    var i = 0;
                    do {
                        i++;
                        var id = prefix + '_' + i;
                    } while (Ext.query('#' + id).length);
                    return id;
                },
                showNotification: function (data) {
                    new Ext.ux.Notification({
                        iconCls: 'x-icon-information',
                        title: data.title,
                        html: data.message,
                        autoDestroy: true,
                        hideDelay: 5000
                    }).show(document);
                }
            };
            MyPanel = Ext.extend(Ext.Panel, {
                renderTo: 'panel_content',
                border: false,
                bodyStyle: 'background-color: transparent;',
                style: 'margin-right: 10px;',
                load: function () {
                    var instance = this;
                    User.getLoggedInUser(function (user, e) {
                        TricertAssist.navigation.removeAll(true);
                        instance.removeAll(true);
                        if (user) {
                            instance.add(new Ext.Button({
                                text: 'Logout',
                                width: 100,
                                height: 25,
                                handler: function () {
                                    User.doLogout(function (result, e) {
                                        TricertAssist.mdi.closeWindows();
                                        TricertAssist.toolbar.removeAll();
                                        TricertAssist.showNotification(result);
                                        instance.load();
                                    });
                                }
                            }));
                            TricertAssist.navigation.load();
                        } else {
                            var form = new Ext.form.FormPanel({
                                border: false,
                                bodyStyle: 'background-color: transparent;',
                                style: 'margin-right: 10px;',
                                labelWidth: 60,
                                items: [
                                    new Ext.form.TextField({
                                        name: 'userName',
                                        fieldLabel: 'Username',
                                        allowBlank: false,
                                        blankText: 'Enter your username',
                                        width: 130
                                    }), new Ext.form.TextField({
                                        name: 'password',
                                        fieldLabel: 'Password',
                                        inputType: 'password',
                                        allowBlank: false,
                                        blankText: 'Enter your password',
                                        width: 130
                                    })],
                                api: {
                                    submit: User.doLogin
                                }
                            });
                            instance.add(form);
                            instance.add(new Ext.Button({
                                text: 'Login',
                                width: 100,
                                height: 25,
                                handler: function (button, event) {
                                    if (form.getForm().isValid()) {
                                        var mask = new Ext.LoadMask(Ext.get('panel_content'), {msg: 'Loading...'});
                                        mask.show();
                                        form.api.submit(form.getForm().el, function(result, e) {
                                            TricertAssist.showNotification({
                                                title: result.title,
                                                message: result.message
                                            });
                                            mask.hide();
                                            if (result.success) instance.load();
                                        });
                                    }
                                }
                            }));
                        }
                        instance.doLayout();
                    });
                }
            });
            var myPanel = new MyPanel();
            myPanel.load();
            new Ext.Toolbar({
                renderTo: 'mdi_toolbar',
                style: 'border: 1px solid #000; border-bottom: 0; padding-top: 5px;',
                width: 700,
                height: 35,
                items: [{
                        xtype: 'tbbutton',
                        cls: 'x-btn-text-icon',
                        icon: 'theme/images/icons/arrow_ns.png',
                        text: 'Toggle Banner',
                        enableToggle: true,
                        toggleHandler: function (item, pressed) {
                            var banner = Ext.get('banner_container');
                            if (pressed) {
                                if (!banner.isVisible()) {
                                    banner.slideIn('t', {
                                        easing: 'easeOut',
                                        duration: .1
                                    });
                                }
                            } else {
                                if (banner.isVisible()) {
                                    banner.slideOut('t', {
                                        easing: 'easeOut',
                                        duration: .1,
                                        remove: false,
                                        useDisplay: true
                                    });
                                }
                            }
                        },
                        pressed: true
                    }]
            });
            FormActions = {
                initFields: function (form, module) {
                    form.add({
                        xtype: 'hidden',
                        name: 'module',
                        type: 'int',
                        value: module.moduleID
                    },
                    {
                        xtype: 'hidden',
                        name: 'entity'
                    });
                },
                triggerNew: function (form, recordType, defaultData) {
                    form.getForm().reset();
                    form.getForm().loadRecord(new recordType(defaultData, 0));
                    form.getForm().findField('entity').setRawValue(0);
                },
                triggerSave: function (form, successFn) {
                    if (form.getForm().isValid()) {
                        form.getForm().submit({
                            waitMsg: 'Saving...',
                            success: function (form, action) {
                                TricertAssist.showNotification(action.result);
                                successFn();
                            },
                            failure: function (form, action) {
                                TricertAssist.showNotification(action.result);
                            }
                        });
                    }
                },
                triggerLoad: function (form, id) {
                    form.getForm().reset();
                    form.getForm().load({
                        params: {
                            identifier: id
                        }
                    });
                    form.getForm().findField('entity').setRawValue(1);
                },
                triggerDelete: function (fn) {
                    Ext.Msg.show({
                        title: 'Warning',
                        msg: 'Are you sure you wish to delete this record?',
                        buttons: Ext.Msg.YESNO,
                        fn: function (btn) {
                            if (btn == 'yes') {                                
                                fn();
                            }
                        }
                    });
                },
                defaultHandler: function (commands, form, recordType, defaultData, newFn, successFn, deleteFn) {
                    Ext.each(commands, function (command, index) {
                        command.handler = function () {
                            switch (command.id) {
                                case 0:
                                    newFn();
                                    FormActions.triggerNew(form, recordType, defaultData);
                                    break;
                                case 1:
                                    FormActions.triggerSave(form, successFn);
                                    break;
                                case 2:
                                    FormActions.triggerDelete(deleteFn);
                                    break;
                            }
                        }
                    });
                }
            };
            Ext.ux.GridEditor = Ext.extend(Ext.grid.GridPanel, {
                initComponent: function(){
                    var instance = this;
                    var editor = new Ext.ux.grid.RowEditor({
                        saveText: 'Update'
                    });
                    
                    Ext.apply(this, {
                        store: instance.store,
                        autoHeight: true,
                        autoWidth: true,
                        plugins: [editor],
                        bodyStyle: 'padding:0px 0px 10px',
                        sm: new Ext.grid.RowSelectionModel({
                            singleSelect: true
                        }),
                        cm: instance.cm,
                        tbar: [{
                                text: 'Add',
                                xtype: 'tbbutton',
                                cls: 'x-btn-text-icon',
                                icon: 'theme/images/icons/add.png',
                                handler: function(btn, ev) {
                                    editor.stopEditing();
                                    instance.store.insert(0, new instance.store.recordType(instance.defaultData()));
                                    editor.startEditing(0);
                                }
                            },'-', {
                                text: 'Delete',
                                xtype: 'tbbutton',
                                cls: 'x-btn-text-icon',
                                icon: 'theme/images/icons/delete.png',
                                handler: function() {
                                    var record = instance.getSelectionModel().getSelected();
                                    if (record) {
                                        instance.api.remove(record.get(instance.idProperty), function(result, e) {
                                            instance.store.remove(record);
                                            instance.store.reload();
                                        });
                                    }
                                }
                            },'-'],
                        viewConfig: {
                            forceFit: true
                        }
                    });
                    editor.on({
                        scope: this,
                        afteredit: function(roweditor, changes, record, rowIndex) {
                            instance.api.submit(record.data, function(result, e) {
                                TricertAssist.showNotification({
                                    title: result.title,
                                    message: result.message
                                });
                                if (result.success) {
                                    instance.store.commitChanges();
                                }
                            });
                        },
                        canceledit: function(roweditor) {
                            var record = instance.store.getAt(roweditor.rowIndex);
                            if (record.get(instance.idProperty) === 0) {
                                instance.store.removeAt(roweditor.rowIndex);
                                instance.getView().refresh();
                            }
                            return true;
                        }
                    });
                    Ext.ux.GridEditor.superclass.initComponent.call(this);
                }         
            });          
        }
    });
});
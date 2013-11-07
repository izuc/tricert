/*!
 * Ext JS Library 3.0.0
 * Copyright(c) 2006-2009 Ext JS, LLC
 * licensing@extjs.com
 * http://www.extjs.com/license
 */
Ext.ux.Mdi = function () {
    var activeWindow;
    var taskbar = new Ext.ux.TaskBar();
    var windows = new Ext.WindowGroup();
    function minimizeWin(win) {
        win.minimized = true;
        win.hide();
        win.toolbar.removeAll();
    }
    this.getActiveWin = function () {
        return activeWindow;
    }
    this.closeWindows = function () {
        windows.each(function (win) {
            win.close();
        });
    }
    function markActive(win) {
        if (activeWindow && activeWindow != win) {
            markInactive(this.activeWindow);
        }
        win.toolbar.load(win.handlers);
        taskbar.setActiveButton(win.taskButton);
        activeWindow = win;
        Ext.fly(win.taskButton.el).addClass('active-win');
        win.minimized = false;
    }
    function markInactive(win) {
        if (win == activeWindow) {
            activeWindow = null;
            win.toolbar.removeAll();
            Ext.fly(win.taskButton.el).removeClass('active-win');
        }
    }
    function removeWin(win) {
        taskbar.removeTaskButton(win.taskButton);
    }
    this.createWindow = function (config, cls) {
        var win = new(cls || Ext.Window)(
        Ext.applyIf(config || {},
        {
            manager: windows,
            layout: 'fit',
            minimizable: true,
            maximizable: true
        }));
        win.render(Ext.get('mdi_body'));
        win.taskButton = taskbar.addTaskButton(win);
        win.animateTarget = win.taskButton.el;
        win.on({
            'activate': {
                fn: markActive
            },
            'deactivate': {
                fn: markInactive
            },
            'minimize': {
                fn: minimizeWin
            },
            'close': {
                fn: removeWin
            }
        });
        return win;
    };
    this.getManager = function () {
        return windows;
    };
    this.getWindow = function (id) {
        return windows.get(id);
    }
};
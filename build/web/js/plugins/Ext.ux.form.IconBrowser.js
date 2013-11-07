Ext.ns('Ext.ux');
Ext.ux.IconBrowser = Ext.extend(Ext.util.Observable, {
    selectedItem: '',
    constructor: function (config) {
        var win;
        var instance = this;
        Ext.apply(this, {
            init: function () {
                if (!win) {
                    var store = new Ext.data.SimpleStore({
                        url: 'js/plugins/Ext.icons.json',
                        autoLoad: true,
                        id: 'name',
                        fields: ['icon'],
                        listeners: {
                            load: function () {
                                win.body.unmask();
                            }
                        }
                    });
                    var view = new Ext.DataView({
                        itemSelector: 'div.iconwrap',
                        multiSelect: false,
                        store: store,
                        border: true,
                        trackOver: true,
                        overClass: 'x-grid3-row-alt',
                        tpl: new Ext.XTemplate('<tpl for=".">', '<div class="iconwrap" style="float: left;padding: 4px 4px 0px 4px;" id="' + Ext.idSeed + '_{icon}">', '<div style=""><img src="theme/images/icons/{icon}.png" class="thumb-img"></div>', '</div>', '</tpl>'),
                        listeners: {
                            mouseenter: function (view, index, element, evtObj) {
                                Ext.fly(win.topToolbar.items.items[2].el).update('' + store.getAt(index).data.icon);
                            },
                            mouseleave: function (view, index, element, evtObj) {
                                Ext.fly(win.topToolbar.items.items[2].el).update('&nbsp;');
                            },
                            dblclick: function (dataView, index, node, e) {
                                var record = dataView.getRecord(node);
                                win.hide();
                                instance.selectedItem = record.get('icon');
                                instance.fireEvent('record_selected');
                            }
                        }
                    });
                    var textField = new Ext.form.TextField({
                        width: 150,
                        emptyText: 'Type to filter...',
                        enableKeyEvents: true,
                        listeners: {
                            keyup: {
                                buffer: 200,
                                fn: function () {
                                    var val = this.getValue();
                                    var X = 0;
                                    store.filterBy(function (record, id) {
                                        var regex = new RegExp('.*' + val + '.*');
                                        if (record.data.icon.match(regex) != null) {
                                            return (true);
                                        } else {
                                            return (false);
                                        }
                                    });
                                }
                            }
                        }
                    });
                    win = new Ext.Window({
                        height: 400,
                        width: 400,
                        minHeight: 350,
                        minWidth: 350,
                        layout: 'fit',
                        defaults: {
                            autoScroll: true
                        },
                        items: [view],
                        tbar: [textField, '-', ''],
                        title: 'Icon Browser',
                        listeners: {
                            render: {
                                delay: 50,
                                fn: function () {
                                    win.body.mask('Working...', 'x-mask-loading');
                                }
                            }
                        }
                    });
                }
            },
            show: function () {
                this.init();
                win.show();
            }
        });
        Ext.ux.IconBrowser.superclass.constructor.apply(this, arguments);
        this.addEvents('record_selected');
    }
});
Ext.ns('Ext.ux.form');
Ext.ux.form.IconBrowserField = Ext.extend(Ext.form.TextField, {
    buttonOffset: 3,
    readOnly: true,
    autoSize: Ext.emptyFn,
    initComponent: function () {
        Ext.ux.form.IconBrowserField.superclass.initComponent.call(this);
        this.addEvents('iconselected');
    },
    onRender: function (ct, position) {
        Ext.ux.form.IconBrowserField.superclass.onRender.call(this, ct, position);
        this.wrap = this.el.wrap({
            cls: 'x-form-field-wrap x-form-file-wrap'
        });
        this.el.addClass('x-form-file-text');
        var btnCfg = Ext.applyIf(this.buttonCfg || {},
        {
            text: this.buttonText
        });
        var browser = new Ext.ux.IconBrowser();
        this.button = new Ext.Button(Ext.apply(btnCfg, {
            renderTo: this.wrap,
            cls: 'x-form-file-btn' + (btnCfg.iconCls ? ' x-btn-icon' : ''),
            handler: function () {
                browser.show();
            }
        }));
        var instance = this;
        browser.on({
            record_selected: function () {
                var v = browser.selectedItem;
                instance.setValue(v);
            }
        });
        this.resizeEl = this.positionEl = this.wrap;
    },
    reset: function () {
        Ext.ux.form.IconBrowserField.superclass.reset.call(this);
    },
    onResize: function (w, h) {
        Ext.ux.form.IconBrowserField.superclass.onResize.call(this, w, h);
        this.wrap.setWidth(w);
        var w = this.wrap.getWidth() - this.button.getEl().getWidth() - this.buttonOffset;
        this.el.setWidth(w);
    },
    onDestroy: function () {
        Ext.ux.form.IconBrowserField.superclass.onDestroy.call(this);
        Ext.destroy(this.iconBrowser, this.button, this.wrap);
    },
    onDisable: function () {
        Ext.ux.form.IconBrowserField.superclass.onDisable.call(this);
        this.doDisable(true);
    },
    onEnable: function () {
        Ext.ux.form.IconBrowserField.superclass.onEnable.call(this);
        this.doDisable(false);
    },
    doDisable: function (disabled) {
        this.button.setDisabled(disabled);
    },
    preFocus: Ext.emptyFn,
    alignErrorIcon: function () {
        this.errorIcon.alignTo(this.wrap, 'tl-tr', [2, 0]);
    }
});
Ext.reg('iconbrowserfield', Ext.ux.form.IconBrowserField);
Ext.form.IconBrowserField = Ext.ux.form.IconBrowserField;
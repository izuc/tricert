Ext.namespace('Ext.ux');
Ext.ux.CodePress = Ext.extend(Ext.form.Field, {
    sourceEl: false,
    code: false,
    language: 'pascal',
    url: false,
    height: false,
    width: false,
    autoResize: false,
    trim: true,
    autoComplete: true,
    readOnly: false,
    lineNumbers: true,
    initialized: false,
    path: 'js/plugins/codepress/',
    initComponent: function () {
        Ext.ux.CodePress.superclass.initComponent.call(this);
        if (this.sourceEl) Ext.get(this.sourceEl).hide();
        this.addEvents({
            initialize: true,
            activate: true
        })
    },
    adjustSize: Ext.BoxComponent.prototype.adjustSize,
    resize: function () {
        if (!this.editor) return;
        var h, w;
        if (this.autoResize) {
            h = this.ownerCt.body.dom.clientHeight + 'px';
            w = this.ownerCt.body.dom.clientWidth + 'px'
        } else {
            h = (this.height || this.ownerCt.body.dom.clientHeight) + 'px';
            w = (this.width || this.ownerCt.body.dom.clientWidth) + 'px'
        }
        this.editor.body.style.width = w;
        this.iframe.setStyle('height', h);
        this.iframe.setStyle('width', w)
    },
    onRender: function (a, b) {
        Ext.ux.CodePress.superclass.onRender.call(this, a, b);
        this.el.dom.style.border = '0 none';
        this.el.dom.setAttribute('tabIndex', -1);
        this.el.addClass('x-hidden');
        if (Ext.isIE) {
            this.el.applyStyles('margin-top:-1px;margin-bottom:-1px;')
        }
        this.wrap = this.el.wrap({});
        this.iframe = Ext.get(document.createElement('iframe'));
        this.iframe.src = (Ext.SSL_SECURE_URL || 'javascript:false');
        if (!this.sourceEl) {
            this.textarea = Ext.get(document.createElement('textarea'))
        } else {
            this.textarea = Ext.get(this.sourceEl)
        }
        this.textarea.dom.disabled = true;
        this.textarea.dom.style.overflow = 'hidden';
        this.textarea.dom.style.overflow = 'auto';
        this.iframe.dom.frameBorder = 0;
        this.iframe.setStyle('visibility', 'hidden');
        this.iframe.setStyle('position', 'absolute');
        this.options = this.textarea.dom.className;
        this.wrap.dom.appendChild(this.textarea.dom);
        this.textarea.dom.parentNode.insertBefore(this.iframe.dom, this.textarea.dom);
        this.edit();
        this.height = (this.height || this.ownerCt.body.dom.clientHeight);
        this.width = (this.width || this.ownerCt.body.dom.clientWidth)
    },
    focus: function () {},
    initialize: function () {
        if (Ext.isIE) {
            this.doc = this.iframe.dom.contentWindow.document;
            this.win = this.iframe.dom.contentWindow
        } else {
            this.doc = this.iframe.dom.contentDocument;
            this.win = this.iframe.dom.contentWindow
        }
        this.editor = this.win.CodePress;
        this.editor.body = this.doc.getElementsByTagName('body')[0];
        if (this.url) {
            Ext.Ajax.request({
                url: this.url,
                method: 'get',
                success: function (a, b) {
                    var c = a.responseText;
                    this.code = c;
                    this.editor.setCode(this.code);
                    this.editor.syntaxHighlight('init')
                }.createDelegate(this)
            })
        } else {
            this.editor.setCode(this.code || this.textarea.dom.value)
        }
        this.resize();
        this.setOptions();
        this.editor.syntaxHighlight('init');
        this.textarea.dom.style.display = 'none';
        this.iframe.dom.style.position = 'static';
        this.iframe.dom.style.visibility = 'visible';
        this.iframe.dom.style.display = 'inline';
        this.initialized = true;
        this.fireEvent('initialize', this)
    },
    edit: function (a, b) {
        if (a) this.textarea.dom.value = document.getElementById(a) ? document.getElementById(a).value : a;
        if (!this.textarea.dom.disabled) return;
        this.language = b ? b : this.getLanguage();
        this.iframe.dom.src = this.path + 'codepress.html?language=' + this.language + '&ts=' + (new Date).getTime();
        this.iframe.removeListener('load', this.initialize);
        this.iframe.on('load', this.initialize, this);
    },
    getLanguage: function () {
        if (this.language) return this.language;
        for (language in Ext.ux.CodePress.languages) if (this.options.match('\\b' + language + '\\b')) return Ext.ux.CodePress.languages[language] ? language : 'generic'
    },
    setOptions: function () {
        if (this.autoComplete === false || this.options.match('autocomplete-off')) this.toggleAutoComplete();
        if (this.readOnly === true || this.options.match('readonly-on')) this.toggleReadOnly();
        if (this.lineNumbers === false || this.options.match('linenumbers-off')) this.toggleLineNumbers()
    },
    getCode: function () {
        var a;
        if (this.textarea && this.editor) a = this.textarea.dom.disabled ? this.editor.getCode() : this.textarea.dom.value;
        else a = this.code || "";
        a = this.trim ? a.replace(/^\s+|(\s+$|\n$|\r$)/g, "") : a;
        return a;
    },
    setCode: function (a) {
        a = js_beautify(a);
        if (this.textarea && this.editor) {
            this.textarea.dom.disabled ? this.editor.setCode(a) : this.textarea.dom.value = a;
            this.editor.syntaxHighlight('init');
        } else {
            this.code = a;
        }
    },
    setValue: function (a) {
        this.setCode(a);
    },
    getValue: function () {
        return this.getCode();
    },
    getMinifiedValue: function () {
        return jsmin(this.getCode());
    },
    toggleAutoComplete: function () {
        if (this.editor) this.editor.autocomplete = (this.editor.autocomplete) ? false : true
    },
    toggleReadOnly: function () {
        this.textarea.dom.readOnly = (this.textarea.dom.readOnly) ? false : true;
        if (this.iframe.dom.style.display != 'none' && this.editor) this.editor.readOnly(this.textarea.dom.readOnly ? true : false)
    },
    toggleLineNumbers: function () {
        if (!this.editor) return;
        var a = this.editor.body.className;
        this.editor.body.className = (a == '' || a == 'show-line-numbers') ? 'hide-line-numbers' : 'show-line-numbers'
    },
    toggleEditor: function () {
        if (this.textarea.dom.disabled) {
            this.textarea.dom.value = this.getCode();
            this.textarea.dom.disabled = false;
            this.iframe.dom.style.display = 'none';
            this.textarea.dom.style.display = 'inline';
        } else {
            this.textarea.dom.disabled = true;
            this.setCode(this.textarea.dom.value);
            if (this.editor) this.editor.syntaxHighlight('init');
            this.iframe.domstyle.display = 'inline';
            this.textarea.dom.style.display = 'none';
        }
    }
});
Ext.ux.CodePress.languages = {
    csharp: 'C#',
    css: 'CSS',
    generic: 'Generic',
    html: 'HTML',
    java: 'Java',
    javascript: 'JavaScript',
    perl: 'Perl',
    ruby: 'Ruby',
    php: 'PHP',
    text: 'Text',
    sql: 'SQL',
    vbscript: 'VBScript',
    pascal: 'Pascal'
};
Ext.reg('codepress', Ext.ux.CodePress);
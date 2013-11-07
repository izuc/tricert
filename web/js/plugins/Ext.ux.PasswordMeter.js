Ext.namespace('Ext.ux');
Ext.ux.PasswordMeter = function (config) {
    Ext.ux.PasswordMeter.superclass.constructor.call(this, config);
};
Ext.extend(Ext.ux.PasswordMeter, Ext.form.TextField, {
    inputType: 'text',
    onRender: function (ct, position) {
        Ext.ux.PasswordMeter.superclass.onRender.call(this, ct, position);
        var elp = this.el.findParent('.x-form-element', 5, true);
        this.objMeter = ct.createChild({
            tag: "div",
            'class': "strengthMeter"
        });
        this.objMeter.setWidth(150);
        this.scoreBar = this.objMeter.createChild({
            tag: "div",
            'class': "scoreBar"
        });
        if (Ext.isIE && !Ext.isIE7) {
            this.objMeter.setStyle('margin-left', '3px');
        }
    },
    initEvents: function () {
        Ext.ux.PasswordMeter.superclass.initEvents.call(this);
        this.el.on('keyup', this.updateMeter, this);
    },
    updateMeter: function (e) {
        var score = 0
        var p = e.target.value;
        var maxWidth = 200 - 2;
        var nScore = this.calcStrength(p);
        var nRound = Math.round(nScore * 2);
        if (nRound > 100) {
            nRound = 100;
        }
        var scoreWidth = (maxWidth / 100) * nRound;
        this.scoreBar.setWidth(scoreWidth, true);
    },
    calcStrength: function (p) {
        var intScore = 0;
        intScore += p.length;
        if (p.length > 0 && p.length <= 4) {
            intScore += p.length;
        } else if (p.length >= 5 && p.length <= 7) {
            intScore += 6;
        } else if (p.length >= 8 && p.length <= 15) {
            intScore += 12;
        } else if (p.length >= 16) {
            intScore += 18;
        }
        if (p.match(/[a-z]/)) {
            intScore += 1;
        }
        if (p.match(/[A-Z]/)) {
            intScore += 5;
        }
        if (p.match(/\d/)) {
            intScore += 5;
        }
        if (p.match(/.*\d.*\d.*\d/)) {
            intScore += 5;
        }
        if (p.match(/[!,@,#,$,%,^,&,*,?,_,~]/)) {
            intScore += 5;
        }
        if (p.match(/.*[!,@,#,$,%,^,&,*,?,_,~].*[!,@,#,$,%,^,&,*,?,_,~]/)) {
            intScore += 5;
        }
        if (p.match(/(?=.*[a-z])(?=.*[A-Z])/)) {
            intScore += 2;
        }
        if (p.match(/(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/)) {
            intScore += 2;
        }
        if (p.match(/(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!,@,#,$,%,^,&,*,?,_,~])/)) {
            intScore += 2;
        }
        return intScore;
    },
    onFocus: function () {
        Ext.ux.PasswordMeter.superclass.onFocus.call(this);
        if (!Ext.isOpera) {
            this.objMeter.addClass('strengthMeter-focus');
        }
    },
    onBlur: function () {
        Ext.ux.PasswordMeter.superclass.onBlur.call(this);
        if (!Ext.isOpera) {
            this.objMeter.removeClass('strengthMeter-focus');
        }
    }
});
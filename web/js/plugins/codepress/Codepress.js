/*
 * CodePress - Real Time Syntax Highlighting Editor written in JavaScript - http://codepress.org/
 * 
 * Copyright (C) 2006 Fernando M.A.d.S. <fermads@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify it under the terms of the 
 * GNU Lesser General Public License as published by the Free Software Foundation.
 * 
 * Read the full licence: http://www.opensource.org/licenses/lgpl-license.php
 */

CodePress = function(obj) {
	var self = document.createElement('iframe');
	self.textarea = obj;
	self.textarea.disabled = true;
	self.textarea.style.overflow = 'hidden';
	self.style.height = self.textarea.clientHeight +'px';
	self.style.width = self.textarea.clientWidth +'px';
	self.textarea.style.overflow = 'auto';
	self.style.border = '1px solid gray';
	self.frameBorder = 0; // remove IE internal iframe border
	self.style.visibility = 'hidden';
	self.style.position = 'absolute';
	self.options = self.textarea.className;
	
	self.initialize = function() {
		self.editor = self.contentWindow.CodePress;
		self.editor.body = self.contentWindow.document.getElementsByTagName('body')[0];
		self.editor.setCode(self.textarea.value);
		self.setOptions();
		self.editor.syntaxHighlight('init');
		self.textarea.style.display = 'none';
		self.style.position = 'static';
		self.style.visibility = 'visible';
		self.style.display = 'inline';
	}
	
	// obj can by a textarea id or a string (code)
	self.edit = function(obj,language) {
		if(obj) self.textarea.value = document.getElementById(obj) ? document.getElementById(obj).value : obj;
		if(!self.textarea.disabled) return;
		self.language = language ? language : self.getLanguage();
		self.src = CodePress.path+'codepress.html?language='+self.language+'&ts='+(new Date).getTime();
		if(self.attachEvent) self.attachEvent('onload',self.initialize);
		else self.addEventListener('load',self.initialize,false);
	}

	self.getLanguage = function() {
		for (language in CodePress.languages) 
			if(self.options.match('\\b'+language+'\\b')) 
				return CodePress.languages[language] ? language : 'generic';
	}
	
	self.setOptions = function() {
		if(self.options.match('autocomplete-off')) self.toggleAutoComplete();
		if(self.options.match('readonly-on')) self.toggleReadOnly();
		if(self.options.match('linenumbers-off')) self.toggleLineNumbers();
	}
	
	self.getCode = function() {
		return self.textarea.disabled ? self.editor.getCode() : self.textarea.value;
	}

	self.setCode = function(code) {
		self.textarea.disabled ? self.editor.setCode(code) : self.textarea.value = code;
	}

	self.toggleAutoComplete = function() {
		self.editor.autocomplete = (self.editor.autocomplete) ? false : true;
	}
	
	self.toggleReadOnly = function() {
		self.textarea.readOnly = (self.textarea.readOnly) ? false : true;
		if(self.style.display != 'none') // prevent exception on FF + iframe with display:none
			self.editor.readOnly(self.textarea.readOnly ? true : false);
	}
	
	self.toggleLineNumbers = function() {
		var cn = self.editor.body.className;
		self.editor.body.className = (cn==''||cn=='show-line-numbers') ? 'hide-line-numbers' : 'show-line-numbers';
	}
	
	self.toggleEditor = function() {
		if(self.textarea.disabled) {
			self.textarea.value = self.getCode();
			self.textarea.disabled = false;
			self.style.display = 'none';
			self.textarea.style.display = 'inline';
		}
		else {
			self.textarea.disabled = true;
			self.setCode(self.textarea.value);
			self.editor.syntaxHighlight('init');
			self.style.display = 'inline';
			self.textarea.style.display = 'none';
		}
	}

	self.edit();
	return self;
}

CodePress.languages = {	
	csharp : 'C#', 
	css : 'CSS', 
	generic : 'Generic',
	html : 'HTML',
	java : 'Java', 
	javascript : 'JavaScript', 
	perl : 'Perl', 
	ruby : 'Ruby',	
	php : 'PHP', 
	text : 'Text', 
	sql : 'SQL',
	vbscript : 'VBScript'
}


CodePress.run = function() {
	s = document.getElementsByTagName('script');
	for(var i=0,n=s.length;i<n;i++) {
		if(s[i].src.match('codepress.js')) {
			CodePress.path = s[i].src.replace('codepress.js','');
		}
	}
	t = document.getElementsByTagName('textarea');
	for(var i=0,n=t.length;i<n;i++) {
		if(t[i].className.match('codepress')) {
			id = t[i].id;
			t[i].id = id+'_cp';
			eval(id+' = new CodePress(t[i])');
			t[i].parentNode.insertBefore(eval(id), t[i]);
		} 
	}
}

if(window.attachEvent) window.attachEvent('onload',CodePress.run);
else window.addEventListener('DOMContentLoaded',CodePress.run,false);

function js_beautify(js_source_text, options) {
    var input, output, token_text, last_type, last_text, last_last_text, last_word, flags, flag_store, indent_string;
    var whitespace, wordchar, punct, parser_pos, line_starters, digits;
    var prefix, token_type, do_block_just_closed;
    var indent_level, wanted_newline, just_added_newline, n_newlines;
    options = options || {};
    var opt_indent_size = options.indent_size || 4;
    var opt_indent_char = options.indent_char || ' ';
    var opt_preserve_newlines = typeof options.preserve_newlines === 'undefined' ? true : options.preserve_newlines;
    var opt_indent_level = options.indent_level || 0;
    var opt_space_after_anon_function = options.space_after_anon_function === 'undefined' ? false : options.space_after_anon_function;
    var opt_keep_array_indentation = typeof options.keep_array_indentation === 'undefined' ? true : options.keep_array_indentation;
    just_added_newline = false;

    function trim_output() {
        while (output.length && (output[output.length - 1] === ' ' || output[output.length - 1] === indent_string)) {
            output.pop();
        }
    }

    function print_newline(ignore_repeated) {
        if (opt_keep_array_indentation && is_array(flags.mode)) {
            return;
        }
        ignore_repeated = typeof ignore_repeated === 'undefined' ? true : ignore_repeated;
        flags.if_line = false;
        trim_output();
        if (!output.length) {
            return;
        }
        if (output[output.length - 1] !== "\n" || !ignore_repeated) {
            just_added_newline = true;
            output.push("\n");
        }
        for (var i = 0; i < indent_level; i += 1) {
            output.push(indent_string);
        }
    }

    function print_single_space() {
        var last_output = ' ';
        if (output.length) {
            last_output = output[output.length - 1];
        }
        if (last_output !== ' ' && last_output !== '\n' && last_output !== indent_string) {
            output.push(' ');
        }
    }

    function print_token() {
        just_added_newline = false;
        output.push(token_text);
    }

    function indent() {
        indent_level += 1;
    }

    function unindent() {
        if (indent_level) {
            indent_level -= 1;
        }
    }

    function remove_indent() {
        if (output.length && output[output.length - 1] === indent_string) {
            output.pop();
        }
    }

    function print_javadoc_comment() {
        var lines = token_text.split('\n');
        output.push(lines[0]);
        for (var i = 1; i < lines.length; i++) {
            print_newline();
            output.push(' ');
            output.push(lines[i].replace(/^\s+/, ''));
        }
    }

    function set_mode(mode) {
        if (flags) {
            flag_store.push(flags);
        }
        flags = {
            mode: mode,
            var_line: false,
            var_line_tainted: false,
            if_line: false,
            in_case: false,
            indentation_baseline: -1
        };
    }

    function is_expression(mode) {
        return mode === '[EXPRESSION]' || mode === '[INDENTED-EXPRESSION]' || mode === '(EXPRESSION)';
    }

    function is_array(mode) {
        return mode === '[EXPRESSION]' || mode === '[INDENTED-EXPRESSION]';
    }

    function restore_mode() {
        do_block_just_closed = flags.mode === 'DO_BLOCK';
        if (flag_store.length > 0) {
            flags = flag_store.pop();
        }
    }

    function in_array(what, arr) {
        for (var i = 0; i < arr.length; i += 1) {
            if (arr[i] === what) {
                return true;
            }
        }
        return false;
    }

    function is_ternary_op() {
        var level = 0,
            colon_count = 0;
        for (var i = output.length - 1; i >= 0; i--) {
            switch (output[i]) {
            case ':':
                if (level === 0) {
                    colon_count++;
                }
                break;
            case '?':
                if (level === 0) {
                    if (colon_count === 0) {
                        return true;
                    } else {
                        colon_count--;
                    }
                }
                break;
            case '{':
                if (level === 0) {
                    return false;
                }
                level--;
                break;
            case '(':
            case '[':
                level--;
                break;
            case ')':
            case ']':
            case '}':
                level++;
                break;
            }
        }
    }

    function get_next_token() {
        n_newlines = 0;
        if (parser_pos >= input.length) {
            return ['', 'TK_EOF'];
        }
        var c = input.charAt(parser_pos);
        parser_pos += 1;
        var keep_whitespace = opt_keep_array_indentation && is_array(flags.mode);
        wanted_newline = false;
        if (keep_whitespace) {
            var whitespace_count = 0;
            while (in_array(c, whitespace)) {
                if (c === "\n") {
                    trim_output();
                    output.push("\n");
                    just_added_newline = true;
                    whitespace_count = 0;
                } else {
                    if (c === '\t') {
                        whitespace_count += 4;
                    } else {
                        whitespace_count += 1;
                    }
                }
                if (parser_pos >= input.length) {
                    return ['', 'TK_EOF'];
                }
                c = input.charAt(parser_pos);
                parser_pos += 1;
            }
            if (flags.indentation_baseline === -1) {
                flags.indentation_baseline = whitespace_count;
            }
            if (just_added_newline) {
                for (var i = 0; i < indent_level + 1; i += 1) {
                    output.push(indent_string);
                }
                if (flags.indentation_baseline !== -1) {
                    for (var i = 0; i < whitespace_count - flags.indentation_baseline; i++) {
                        output.push(' ');
                    }
                }
            }
        } else {
            while (in_array(c, whitespace)) {
                if (c === "\n") {
                    n_newlines += 1;
                }
                if (parser_pos >= input.length) {
                    return ['', 'TK_EOF'];
                }
                c = input.charAt(parser_pos);
                parser_pos += 1;
            }
            if (opt_preserve_newlines) {
                if (n_newlines > 1) {
                    for (var i = 0; i < n_newlines; i += 1) {
                        print_newline(i === 0);
                        just_added_newline = true;
                    }
                }
            }
            wanted_newline = n_newlines > 0;
        }
        if (in_array(c, wordchar)) {
            if (parser_pos < input.length) {
                while (in_array(input.charAt(parser_pos), wordchar)) {
                    c += input.charAt(parser_pos);
                    parser_pos += 1;
                    if (parser_pos === input.length) {
                        break;
                    }
                }
            }
            if (parser_pos !== input.length && c.match(/^[0-9]+[Ee]$/) && (input.charAt(parser_pos) === '-' || input.charAt(parser_pos) === '+')) {
                var sign = input.charAt(parser_pos);
                parser_pos += 1;
                var t = get_next_token(parser_pos);
                c += sign + t[0];
                return [c, 'TK_WORD'];
            }
            if (c === 'in') {
                return [c, 'TK_OPERATOR'];
            }
            if (wanted_newline && last_type !== 'TK_OPERATOR' && !flags.if_line && (opt_preserve_newlines || last_text !== 'var')) {
                print_newline();
            }
            return [c, 'TK_WORD'];
        }
        if (c === '(' || c === '[') {
            return [c, 'TK_START_EXPR'];
        }
        if (c === ')' || c === ']') {
            return [c, 'TK_END_EXPR'];
        }
        if (c === '{') {
            return [c, 'TK_START_BLOCK'];
        }
        if (c === '}') {
            return [c, 'TK_END_BLOCK'];
        }
        if (c === ';') {
            return [c, 'TK_SEMICOLON'];
        }
        if (c === '/') {
            var comment = '';
            if (input.charAt(parser_pos) === '*') {
                parser_pos += 1;
                if (parser_pos < input.length) {
                    while (! (input.charAt(parser_pos) === '*' && input.charAt(parser_pos + 1) && input.charAt(parser_pos + 1) === '/') && parser_pos < input.length) {
                        comment += input.charAt(parser_pos);
                        parser_pos += 1;
                        if (parser_pos >= input.length) {
                            break;
                        }
                    }
                }
                parser_pos += 2;
                return ['/*' + comment + '*/', 'TK_BLOCK_COMMENT'];
            }
            if (input.charAt(parser_pos) === '/') {
                comment = c;
                while (input.charAt(parser_pos) !== "\x0d" && input.charAt(parser_pos) !== "\x0a") {
                    comment += input.charAt(parser_pos);
                    parser_pos += 1;
                    if (parser_pos >= input.length) {
                        break;
                    }
                }
                parser_pos += 1;
                if (wanted_newline) {
                    print_newline();
                }
                return [comment, 'TK_COMMENT'];
            }
        }
        if (c === "'" || c === '"' || (c === '/' && ((last_type === 'TK_WORD' && in_array(last_text, ['return', 'do'])) || (last_type === 'TK_START_EXPR' || last_type === 'TK_START_BLOCK' || last_type === 'TK_END_BLOCK' || last_type === 'TK_OPERATOR' || last_type === 'TK_EOF' || last_type === 'TK_SEMICOLON')))) {
            var sep = c;
            var esc = false;
            var resulting_string = c;
            if (parser_pos < input.length) {
                if (sep === '/') {
                    var in_char_class = false;
                    while (esc || in_char_class || input.charAt(parser_pos) !== sep) {
                        resulting_string += input.charAt(parser_pos);
                        if (!esc) {
                            esc = input.charAt(parser_pos) === '\\';
                            if (input.charAt(parser_pos) === '[') {
                                in_char_class = true;
                            } else if (input.charAt(parser_pos) === ']') {
                                in_char_class = false;
                            }
                        } else {
                            esc = false;
                        }
                        parser_pos += 1;
                        if (parser_pos >= input.length) {
                            return [resulting_string, 'TK_STRING'];
                        }
                    }
                } else {
                    while (esc || input.charAt(parser_pos) !== sep) {
                        resulting_string += input.charAt(parser_pos);
                        if (!esc) {
                            esc = input.charAt(parser_pos) === '\\';
                        } else {
                            esc = false;
                        }
                        parser_pos += 1;
                        if (parser_pos >= input.length) {
                            return [resulting_string, 'TK_STRING'];
                        }
                    }
                }
            }
            parser_pos += 1;
            resulting_string += sep;
            if (sep === '/') {
                while (parser_pos < input.length && in_array(input.charAt(parser_pos), wordchar)) {
                    resulting_string += input.charAt(parser_pos);
                    parser_pos += 1;
                }
            }
            return [resulting_string, 'TK_STRING'];
        }
        if (c === '#') {
            var sharp = '#';
            if (parser_pos < input.length && in_array(input.charAt(parser_pos), digits)) {
                do {
                    c = input.charAt(parser_pos);
                    sharp += c;
                    parser_pos += 1;
                } while (parser_pos < input.length && c !== '#' && c !== '=');
                if (c === '#') {
                    return [sharp, 'TK_WORD'];
                } else {
                    return [sharp, 'TK_OPERATOR'];
                }
            }
        }
        if (c === '<' && input.substring(parser_pos - 1, parser_pos + 3) === '<!--') {
            parser_pos += 3;
            return ['<!--', 'TK_COMMENT'];
        }
        if (c === '-' && input.substring(parser_pos - 1, parser_pos + 2) === '-->') {
            parser_pos += 2;
            if (wanted_newline) {
                print_newline();
            }
            return ['-->', 'TK_COMMENT'];
        }
        if (in_array(c, punct)) {
            while (parser_pos < input.length && in_array(c + input.charAt(parser_pos), punct)) {
                c += input.charAt(parser_pos);
                parser_pos += 1;
                if (parser_pos >= input.length) {
                    break;
                }
            }
            return [c, 'TK_OPERATOR'];
        }
        return [c, 'TK_UNKNOWN'];
    }
    indent_string = '';
    while (opt_indent_size > 0) {
        indent_string += opt_indent_char;
        opt_indent_size -= 1;
    }
    indent_level = opt_indent_level;
    input = js_source_text;
    last_word = '';
    last_type = 'TK_START_EXPR';
    last_text = '';
    last_last_text = '';
    output = [];
    do_block_just_closed = false;
    whitespace = "\n\r\t ".split('');
    wordchar = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_$'.split('');
    digits = '0123456789'.split('');
    punct = '+ - * / % & ++ -- = += -= *= /= %= == === != !== > < >= <= >> << >>> >>>= >>= <<= && &= | || ! !! , : ? ^ ^= |= ::'.split(' ');
    line_starters = 'continue,try,throw,return,var,if,switch,case,default,for,while,break,function'.split(',');
    flag_store = [];
    set_mode('BLOCK');
    parser_pos = 0;
    while (true) {
        var t = get_next_token(parser_pos);
        token_text = t[0];
        token_type = t[1];
        if (token_type === 'TK_EOF') {
            break;
        }
        switch (token_type) {
        case 'TK_START_EXPR':
            if (token_text === '[') {
                if (last_type === 'TK_WORD' || last_text === ')') {
                    if (last_word === 'return' || last_word === 'throw') {
                        print_single_space();
                    }
                    set_mode('(EXPRESSION)');
                    print_token();
                    break;
                }
                if (flags.mode === '[EXPRESSION]' || flags.mode === '[INDENTED-EXPRESSION]') {
                    if (last_last_text === ']' && last_text === ',') {
                        if (flags.mode === '[EXPRESSION]') {
                            if (!opt_keep_array_indentation) {
                                indent();
                            }
                            flags.mode = '[INDENTED-EXPRESSION]';
                        }
                        if (!opt_keep_array_indentation) {
                            print_newline();
                        }
                        set_mode('[EXPRESSION]');
                    } else if (last_text === '[') {
                        if (flags.mode === '[EXPRESSION]') {
                            if (!opt_keep_array_indentation) {
                                indent();
                            }
                            flags.mode = '[INDENTED-EXPRESSION]';
                        }
                        if (!opt_keep_array_indentation) {
                            print_newline();
                        }
                        set_mode('[EXPRESSION]');
                    } else {
                        set_mode('[EXPRESSION]');
                    }
                } else {
                    set_mode('[EXPRESSION]');
                }
            } else {
                set_mode('(EXPRESSION)');
            }
            if (last_text === ';' || last_type === 'TK_START_BLOCK') {
                print_newline();
            } else if (last_type === 'TK_END_EXPR' || last_type === 'TK_START_EXPR' || last_type === 'TK_END_BLOCK') {} else if (last_type !== 'TK_WORD' && last_type !== 'TK_OPERATOR') {
                print_single_space();
            } else if (last_word === 'function') {
                if (opt_space_after_anon_function) {
                    print_single_space();
                }
            } else if (in_array(last_word, line_starters)) {
                print_single_space();
            }
            print_token();
            break;
        case 'TK_END_EXPR':
            if (token_text === ']') {
                if (flags.mode === '[INDENTED-EXPRESSION]') {
                    unindent();
                    if (last_text === ']') {
                        print_newline();
                    }
                }
            }
            restore_mode();
            print_token();
            break;
        case 'TK_START_BLOCK':
            if (last_word === 'do') {
                set_mode('DO_BLOCK');
            } else {
                set_mode('BLOCK');
            }
            if (last_type !== 'TK_OPERATOR' && last_type !== 'TK_START_EXPR') {
                if (last_type === 'TK_START_BLOCK') {
                    print_newline();
                } else {
                    print_single_space();
                }
            }
            print_token();
            indent();
            break;
        case 'TK_END_BLOCK':
            if (last_type === 'TK_START_BLOCK') {
                if (just_added_newline) {
                    remove_indent();
                } else {
                    trim_output();
                }
                unindent();
            } else {
                unindent();
                print_newline();
            }
            print_token();
            restore_mode();
            break;
        case 'TK_WORD':
            if (do_block_just_closed) {
                print_single_space();
                print_token();
                print_single_space();
                do_block_just_closed = false;
                break;
            }
            if (token_text === 'function') {
                if ((just_added_newline || last_text == ';') && last_text !== '{') {
                    n_newlines = just_added_newline ? n_newlines : 0;
                    for (var i = 0; i < 2 - n_newlines; i++) {
                        print_newline(false);
                    }
                }
            }
            if (token_text === 'case' || token_text === 'default') {
                if (last_text === ':') {
                    remove_indent();
                } else {
                    unindent();
                    print_newline();
                    indent();
                }
                print_token();
                flags.in_case = true;
                break;
            }
            prefix = 'NONE';
            if (last_type === 'TK_END_BLOCK') {
                if (!in_array(token_text.toLowerCase(), ['else', 'catch', 'finally'])) {
                    prefix = 'NEWLINE';
                } else {
                    prefix = 'SPACE';
                    print_single_space();
                }
            } else if (last_type === 'TK_SEMICOLON' && (flags.mode === 'BLOCK' || flags.mode === 'DO_BLOCK')) {
                prefix = 'NEWLINE';
            } else if (last_type === 'TK_SEMICOLON' && is_expression(flags.mode)) {
                prefix = 'SPACE';
            } else if (last_type === 'TK_STRING') {
                prefix = 'NEWLINE';
            } else if (last_type === 'TK_WORD') {
                prefix = 'SPACE';
            } else if (last_type === 'TK_START_BLOCK') {
                prefix = 'NEWLINE';
            } else if (last_type === 'TK_END_EXPR') {
                print_single_space();
                prefix = 'NEWLINE';
            }
            if (last_type !== 'TK_END_BLOCK' && in_array(token_text.toLowerCase(), ['else', 'catch', 'finally'])) {
                print_newline();
            } else if (in_array(token_text, line_starters) || prefix === 'NEWLINE') {
                if (last_text === 'else') {
                    print_single_space();
                } else if ((last_type === 'TK_START_EXPR' || last_text === '=' || last_text === ',') && token_text === 'function') {} else if (last_text === 'return' || last_text === 'throw') {
                    print_single_space();
                } else if (last_type !== 'TK_END_EXPR') {
                    if ((last_type !== 'TK_START_EXPR' || token_text !== 'var') && last_text !== ':') {
                        if (token_text === 'if' && last_word === 'else' && last_text !== '{') {
                            print_single_space();
                        } else {
                            print_newline();
                        }
                    }
                } else {
                    if (in_array(token_text, line_starters) && last_text !== ')') {
                        print_newline();
                    }
                }
            } else if (prefix === 'SPACE') {
                print_single_space();
            }
            print_token();
            last_word = token_text;
            if (token_text === 'var') {
                flags.var_line = true;
                flags.var_line_tainted = false;
            }
            if (token_text === 'if' || token_text === 'else') {
                flags.if_line = true;
            }
            break;
        case 'TK_SEMICOLON':
            print_token();
            flags.var_line = false;
            break;
        case 'TK_STRING':
            if (last_type === 'TK_START_BLOCK' || last_type === 'TK_END_BLOCK' || last_type === 'TK_SEMICOLON') {
                print_newline();
            } else if (last_type === 'TK_WORD') {
                print_single_space();
            }
            print_token();
            break;
        case 'TK_OPERATOR':
            var start_delim = true;
            var end_delim = true;
            if (flags.var_line && token_text === ',' && (is_expression(flags.mode))) {
                flags.var_line_tainted = false;
            }
            if (flags.var_line) {
                if (token_text === ',') {
                    if (flags.var_line_tainted) {
                        print_token();
                        print_newline();
                        output.push(indent_string);
                        flags.var_line_tainted = false;
                        break;
                    } else {
                        flags.var_line_tainted = false;
                    }
                } else {
                    flags.var_line_tainted = true;
                    if (token_text === ':') {
                        flags.var_line = false;
                    }
                }
            }
            if (last_text === 'return' || last_text === 'throw') {
                print_single_space();
                print_token();
                break;
            }
            if (token_text === ':' && flags.in_case) {
                print_token();
                print_newline();
                flags.in_case = false;
                break;
            }
            if (token_text === '::') {
                print_token();
                break;
            }
            if (token_text === ',') {
                if (flags.var_line) {
                    if (flags.var_line_tainted) {
                        print_token();
                        print_newline();
                        flags.var_line_tainted = false;
                    } else {
                        print_token();
                        print_single_space();
                    }
                } else if (last_type === 'TK_END_BLOCK') {
                    print_token();
                    print_newline();
                } else {
                    if (flags.mode === 'BLOCK') {
                        print_token();
                        print_newline();
                    } else {
                        print_token();
                        print_single_space();
                    }
                }
                break;
            } else if (token_text === '--' || token_text === '++') {
                if (last_text === ';') {
                    if (flags.mode === 'BLOCK') {
                        print_newline();
                        start_delim = true;
                        end_delim = false;
                    } else {
                        start_delim = true;
                        end_delim = false;
                    }
                } else {
                    if (last_text === '{') {
                        print_newline();
                    }
                    start_delim = false;
                    end_delim = false;
                }
            } else if ((token_text === '!' || token_text === '+' || token_text === '-') && (last_text === 'return' || last_text === 'case')) {
                start_delim = true;
                end_delim = false;
            } else if ((token_text === '!' || token_text === '+' || token_text === '-') && last_type === 'TK_START_EXPR') {
                start_delim = false;
                end_delim = false;
            } else if (last_type === 'TK_OPERATOR') {
                start_delim = false;
                end_delim = false;
            } else if (last_type === 'TK_END_EXPR') {
                start_delim = true;
                end_delim = true;
            } else if (token_text === '.') {
                start_delim = false;
                end_delim = false;
            } else if (token_text === ':') {
                if (is_ternary_op()) {
                    start_delim = true;
                } else {
                    start_delim = false;
                }
            }
            if (start_delim) {
                print_single_space();
            }
            print_token();
            if (end_delim) {
                print_single_space();
            }
            break;
        case 'TK_BLOCK_COMMENT':
            print_newline();
            if (token_text.substring(0, 3) == '/**') {
                print_javadoc_comment();
            } else {
                print_token();
            }
            print_newline();
            break;
        case 'TK_COMMENT':
            if (wanted_newline) {
                print_newline();
            } else {
                print_single_space();
            }
            print_token();
            print_newline();
            break;
        case 'TK_UNKNOWN':
            print_token();
            break;
        }
        last_last_text = last_text;
        last_type = token_type;
        last_text = token_text;
    }
    return output.join('').replace(/\n+$/, '');
}
String.prototype.has = function (c) {
    return this.indexOf(c) > -1;
};

function jsmin(input) {
    var level = 2;
    var a = '',
        b = '',
        EOF = -1,
        LETTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz',
        DIGITS = '0123456789',
        ALNUM = LETTERS + DIGITS + '_$\\',
        theLookahead = EOF;

    function isAlphanum(c) {
        return c != EOF && (ALNUM.has(c) || c.charCodeAt(0) > 126);
    }

    function get() {
        var c = theLookahead;
        if (get.i == get.l) {
            return EOF;
        }
        theLookahead = EOF;
        if (c == EOF) {
            c = input.charAt(get.i);
            ++get.i;
        }
        if (c >= ' ' || c == '\n') {
            return c;
        }
        if (c == '\r') {
            return '\n';
        }
        return ' ';
    }
    get.i = 0;
    get.l = input.length;

    function peek() {
        theLookahead = get();
        return theLookahead;
    }

    function next() {
        var c = get();
        if (c == '/') {
            switch (peek()) {
            case '/':
                for (;;) {
                    c = get();
                    if (c <= '\n') {
                        return c;
                    }
                }
                break;
            case '*':
                get();
                if (peek() == '!') {
                    var d = '/*!';
                    for (;;) {
                        c = get();
                        switch (c) {
                        case '*':
                            if (peek() == '/') {
                                get();
                                return d + '*/';
                            }
                            break;
                        case EOF:
                            throw 'Error: Unterminated comment.';
                        default:
                            d += c;
                        }
                    }
                } else {
                    for (;;) {
                        switch (get()) {
                        case '*':
                            if (peek() == '/') {
                                get();
                                return ' ';
                            }
                            break;
                        case EOF:
                            throw 'Error: Unterminated comment.';
                        }
                    }
                }
                break;
            default:
                return c;
            }
        }
        return c;
    }

    function action(d) {
        var r = [];
        if (d == 1) {
            r.push(a);
        }
        if (d < 3) {
            a = b;
            if (a == '\'' || a == '"') {
                for (;;) {
                    r.push(a);
                    a = get();
                    if (a == b) {
                        break;
                    }
                    if (a <= '\n') {
                        throw 'Error: unterminated string literal: ' + a;
                    }
                    if (a == '\\') {
                        r.push(a);
                        a = get();
                    }
                }
            }
        }
        b = next();
        if (b == '/' && '(,=:[!&|'.has(a)) {
            r.push(a);
            r.push(b);
            for (;;) {
                a = get();
                if (a == '/') {
                    break;
                } else if (a == '\\') {
                    r.push(a);
                    a = get();
                } else if (a <= '\n') {
                    throw 'Error: unterminated Regular Expression literal';
                }
                r.push(a);
            }
            b = next();
        }
        return r.join('');
    }

    function m() {
        var r = [];
        a = '\n';
        r.push(action(3));
        while (a != EOF) {
            switch (a) {
            case ' ':
                if (isAlphanum(b)) {
                    r.push(action(1));
                } else {
                    r.push(action(2));
                }
                break;
            case '\n':
                switch (b) {
                case '{':
                case '[':
                case '(':
                case '+':
                case '-':
                    r.push(action(1));
                    break;
                case ' ':
                    r.push(action(3));
                    break;
                default:
                    if (isAlphanum(b)) {
                        r.push(action(1));
                    } else {
                        if (level == 1 && b != '\n') {
                            r.push(action(1));
                        } else {
                            r.push(action(2));
                        }
                    }
                }
                break;
            default:
                switch (b) {
                case ' ':
                    if (isAlphanum(a)) {
                        r.push(action(1));
                        break;
                    }
                    r.push(action(3));
                    break;
                case '\n':
                    if (level == 1 && a != '\n') {
                        r.push(action(1));
                    } else {
                        switch (a) {
                        case '}':
                        case ']':
                        case ')':
                        case '+':
                        case '-':
                        case '"':
                        case '\'':
                            if (level == 3) {
                                r.push(action(3));
                            } else {
                                r.push(action(1));
                            }
                            break;
                        default:
                            if (isAlphanum(a)) {
                                r.push(action(1));
                            } else {
                                r.push(action(3));
                            }
                        }
                    }
                    break;
                default:
                    r.push(action(1));
                    break;
                }
            }
        }
        return r.join('');
    }
    return m(input);
}


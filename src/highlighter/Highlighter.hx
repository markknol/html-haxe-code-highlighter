package highlighter;

using StringTools;

/**
 * @author Mark Knol
 */
class Highlighter {
#if js
	#if highlighter_standalone
	public static function main() highlight();
	#end
	
	/**
	   Adds highlighting to all `<code class="prettyprint haxe">` and `<code class="prettyprint hxml">` tags in the given element.
	   @param	element Element to search `<code>` tags in. If `null`, then document body element is used.
	**/
	public static function highlight(?container:js.html.Element) {
		if (container == null) container = js.Browser.document.body;
		for (el in container.getElementsByTagName("code")) {
			if (hasClass(el, "prettyprint")) {
				if (!hasClass(el, "highlighted")) {
					if (hasClass(el, "haxe") || hasClass(el, "js") || hasClass(el, "javascript")) {
						el.innerHTML = syntaxHighlightHaxe(el.innerHTML);
						el.className += " highlighted";
					} else if (hasClass(el, "hxml")) {
						el.innerHTML = syntaxHighlightHXML(el.innerHTML);
						el.className += " highlighted";
					}
				}
			}
		}
	}

	inline static function hasClass(el:js.html.Element, className:String) return el.classList.contains(className);
#end
	
	/**
	   Syntax highlight Haxe code.
	   
	   | Description | Applied CSS class |
	   |---|---|
	   | Reserved keywords | .kwd |
	   | Reserved values | .val |
	   | Types | .type |
	   | Strings | .str |
	   | Comments | .cmt |
	   
	   @return HTML text of highlighted code.
	**/
	public static function syntaxHighlightHaxe(code:String):String {
		var html = code;
		var kwds = ["abstract", "trace", "break", "case", "cast", "class", "continue", "default", "do", "dynamic", "else", "elseif", "enum", "extends", "extern", "for", "function", "if", "implements", "import", "in", "inline", "interface", "macro", "new", "override", "package", "private", "public", "return", "static", "switch", "throw", "try", "typedef", "untyped", "using", "var", "while", "as"];
		var kwds = new EReg("\\b(" + kwds.join("|") + ")\\b", "g");

		var vals = ["null", "true", "false", "this"];
		var vals = new EReg("\\b(" + vals.join("|") + ")\\b", "g");

		var types = ~/\b([A-Z][a-zA-Z0-9_]*)\b/g;
		var regexp = ~/(~\/(.+?)\/[igm])/g;

		html = html.replace("\t", "  "); // indent with two spaces
		html = kwds.replace(html, "<span class=kwd>$1</span>");
		html = vals.replace(html, "<span class=val>$1</span>");
		html = types.replace(html, "<span class=type>$1</span>");
		html = regexp.replace(html, "<span class=ereg>$1</span>");
		
		html = ~/(("|')[^"']*\2)/g.replace(html, "<span class=str>$1</span>");
		html = ~/(\/\/.+?)(\n|$)/g.replace(html, "<span class=cmt>$1</span>$2");
		html = ~/(\/\*\*?(.|\n)+?\*?\*\/)/g.replace(html, "<span class=cmt>$1</span>");
		
		return html;
	}

	/**
	   Syntax highlight HXML.
	   
	   | Description | Applied CSS class |
	   |---|---|
	   | Reserved keywords | .kwd |
	   | Reserved values | .val |
	   | Strings | .str |
	   | Comments | .cmt |
	   
	   @return HTML text of highlighted code.
	**/
	public static function syntaxHighlightHXML(code:String):String {
		var html = code;
		html = ~/\b(haxe)\b/g.replace(html, "<span class=kwd>$1</span>");
		html = ~/(("|')[^"']*\2)/g.replace(html, "<span class=str>$1</span>");
		html = ~/(--?.+?)(\s)/g.replace(html, "<span class=val>$1</span>$2");
		html = ~/(#.+?)(\n|$)/g.replace(html, "<span class=cmt>$1</span>$2");
		
		return html;
	}
}

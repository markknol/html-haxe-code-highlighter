# Simple Haxe Code Highlighter for HTML
[![Build Status](https://travis-ci.org/markknol/html-haxe-code-highlighter.svg?branch=master)](https://travis-ci.org/markknol/html-haxe-code-highlighter)
[![Haxelib Version](https://img.shields.io/github/tag/markknol/html-haxe-code-highlighter.svg?label=haxelib)](http://lib.haxe.org/p/p/html-haxe-code-highlighter)

Basic runtime Haxe code highlighting. Formerly used on haxe.org website. 

## Basic Installation

If you just want the highlighting, you can download and use the .js and .css files:

1. Download <bin/highlighter.js> and add `<script src="highlighter.js"></script>` to your HTML.
2. Download <bin/highlighter.min.css> and add `<link rel="stylesheet" href="highlighter.min.css" />` to your HTML.

## Installation using sources

If you want to integrate the highlighting in your project, install using [Haxelib](https://lib.haxe.org/p/html-haxe-code-highlighter/):

```
haxelib install html-haxe-code-highlighter
```

To use in code, add to your build hxml:

```
-lib html-haxe-code-highlighter
```

### API

 * `Highlighter.highlight(?container:js.html.Element)`
   (_JS target only_) Adds highlighting to all `<code class="prettyprint haxe">` and `<code class="prettyprint hxml">` tags in the given element. If container is null, then document body element is used.
   
 * `Highlighter.syntaxHighlightHaxe(code:String)`
   Syntax highlight Haxe code. Returns code as formatted HTML text.
   
 * `Highlighter.syntaxHighlightHXML(code:String)`
   Syntax highlight HXML. Returns code as formatted HTML text.
   
### CSS classes

The following css classes are applied

| Description | CSS class |
|---|---|
| Reserved keywords | .kwd |
| Reserved values | .val |
| Types | .type |
| Strings | .str |
| Regexp | .ereg |
| Comments | .cmt |

---

 Build with [Haxe](https://haxe.org/)

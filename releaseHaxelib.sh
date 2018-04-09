#!/bin/sh
rm -f html-haxe-code-highlighter.zip
zip -r html-haxe-code-highlighter.zip src README.md haxelib.json
haxelib submit html-haxe-code-highlighter.zip $HAXELIB_PWD --always
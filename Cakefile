_ = require 'underscore'
fs = require 'fs'
coffee = require 'coffee-script'
execSync = require 'execSync'
{parser, uglify} = require 'uglify-js'

option '-u', '--uglify', 'uglify js output'

task 'dependencies', 'concatenate dependencies and uglify (optionally)', (options) ->
    
    alljs = ""

    _.each [
        "http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js",
        "https://raw.github.com/joestelmach/laconic/master/laconic.js",
        "http://documentcloud.github.com/underscore/underscore.js",
        "http://backbonejs.org/backbone.js"
    ], (url) ->

        js = execSync.stdout("curl #{url}")
        alljs += js+"\n"

    if options.uglify
        outfile = "dependencies.min.js"
        ast = parser.parse alljs
        ast = uglify.ast_mangle ast
        ast = uglify.ast_squeeze ast
        alljs = uglify.gen_code ast
    else
        outfile = "dependencies.js"

    fs.writeFileSync outfile, alljs


task 'build', 'compile ribs.coffee and uglify (optionally)', (options) ->

    cs = (fs.readFileSync 'ribs.coffee').toString()
    js = coffee.compile cs
    outfile = "ribs.js"
    if options.uglify
        ast = parser.parse js
        ast = uglify.ast_mangle ast
        ast = uglify.ast_squeeze ast
        js = uglify.gen_code ast
        outfile = "ribs.min.js"
    fs.writeFileSync outfile, js


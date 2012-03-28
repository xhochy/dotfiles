fs = require 'fs'
muffin = require 'muffin'

HOME = process.env.HOME
HERE = __dirname

replaceMacros = (str) ->
    str.replace('@@HOME@@', HOME).replace('@@HERE@@', HERE)

task 'update', 'install dotfiles and update the dependencies', (options) ->
    muffin.run
        files: './apps/**/*.symlink'
        options: options
        map:
            'apps/(.+).symlink': (matches) ->
                filenames = fs.readFileSync(matches[0]).toString().split("\n")
                filenames = (replaceMacros filename for filename in filenames)
                name = filenames[0]
                to = filenames[1]
                console.log("Linking #{name} to #{to}")
                fs.symlink(name, to)

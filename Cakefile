fs = require 'fs'
muffin = require 'muffin'
path = require 'path'

HOME = process.env.HOME
HERE = __dirname

replaceMacros = (str) ->
    str.replace('@@HOME@@', HOME).replace('@@HERE@@', HERE)

task 'update', 'install dotfiles and update the dependencies', (options) ->
    muffin.run
        files: './apps/**/*.symlink'
        options: options
        map:
            # Create symlinks. Files consists of 2 lines: first is the destination,
            # second the name
            'apps/(.+).symlink': (matches) ->
                filenames = fs.readFileSync(matches[0]).toString().split("\n")
                filenames = (replaceMacros filename for filename in filenames)
                to = filenames[0]
                name = filenames[1]
                # Only create the symlink if it does not exist
                if !path.existsSync(name)
                    console.log("Linking #{name} to #{to}")
                    fs.symlink(to, name)
                else 
                    # Check that the existing link points to the correct location
                    if fs.realpathSync(name) != to
                        console.error("Link #{name} is incorrect!")

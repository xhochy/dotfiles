fs = require 'fs'
muffin = require 'muffin'
path = require 'path'

stripTrailingSlash = (str) ->
    if str.charAt(str.length) == '/'
        return stripTrailingSlash(str.substring(0, str.length - 1))
    else
        return str

HOME = stripTrailingSlash process.env.HOME
HERE = stripTrailingSlash __dirname

replaceMacros = (str) ->
    str.replace('@@HOME@@', HOME).replace('@@HERE@@', HERE)

task 'update-symlinks', 'create symlinks', (options) ->
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
                    fs.symlinkSync(to, name)
                else 
                    # Check that the existing link points to the correct location
                    if fs.realpathSync(name) != to
                        console.error("Link #{name} is incorrect!")

task 'update-scripts', 'run post-install scripts', (options) ->
    muffin.run
        files: './apps/**/*.dotscript'
        options: options
        map:
            'apps/(.+).dotscript': (matches) -> 
                console.log("Starting #{matches[0]}")
                console.log(muffin.exec(matches[0]))
                        
task 'update', 'install dotfiles and update the dependencies', (options) ->
    invoke 'update-symlinks'
    invoke 'update-scripts'

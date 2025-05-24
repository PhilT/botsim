# Toy Robot Simulator

## Usage

Run with:
```
./botsim <input>
```
where `<input>` is a path to the input file containing the commands. One command
per line. Commands that can be used are:

* PLACE X,Y,F 
    Places the robot on the tabletop. This must be the first command in the input
    Where X,Y is the position to place within the 5x5 unit grid (zero-based)
    F is the direction to face
* MOVE
    Move forward 1 unit in the direction the robot is facing
* LEFT
    Rotate left 90deg to face a new direction
* RIGHT
    Rotate right 90deg to face a new direction
* REPORT
    Output the current position and direction the robot is facing

See `data/input.txt` for an example input file

## Development

Tested with Ruby version 3.4.3 (See `.ruby-version` to confirm)

**Devbox** is a handy way to manage non-Ruby dependencies. In this apps
case we only need Ruby. See https://www.jetify.com/docs/devbox/ for info.

**Direnv** (`.envrc`) autoloads the Devbox environment on entry to the project
folder once `direnv allow` has been run manually (for security). This ensures
the correct version of Ruby is ready to go.

Neither of these tools are required. I just find them useful when working with
Ruby. Think more reproducible rvm, chruby, etc.

## Testing

Run: `rake`



## Notes

* Probably additional error handling on input depending on how invalid commands
    should be handled (e.g. throwing an error, ignoring or best effort)
* Could allow the Tabletop size to be configured
* I'd add Rubocop and any other linters as appropriate but didn't want to make the
    diffs noisey with those changes for now
* I'd question whether to process commands that have additional arguments when
    they're not meant to. For now, I've chosen to discard the args and process
    the command
* Could be nice to build a REPL

# Toy Robot Simulator

## Usage

Run with:
```
./botsim <input>
```
where `<input>` is a path to the input file containing the commands.

## Development

Tested with Ruby version 3.4.3 (See `.ruby-version` to confirm)

**Devbox** is a handy way to manage non-Ruby dependencies. In this apps
case we only need Ruby. See https://www.jetify.com/docs/devbox/ for info.

**Direnv** (`.envrc`) autoloads the Devbox environment on entry to the project
folder once `direnv allow` has been run manually (for security). This ensures
the correct version of Ruby is ready to go.

Neither of these tools is required. I just find them useful when working with
Ruby. Think more reproducible rvm, chruby, etc.

## Testing

Run: `rake`





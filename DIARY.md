## Day 0 - Getting started with elixir

### Preparing the project

#### Creating and testing the pheonix project with elixir
```
mix phx.new inmana --no-html --no-webpack
cd inmana
```

#### Adding the postgresql database
```
mix ecto.create
```

#### Running the server
```
mix phx.server
```

#### Then go to ```http://localhost:4000/dashboard/home``` on your browser

### About the project
- Commands
  - ```mix.exs``` is a file containg information about the mix project (dependecies, verisons, ...)
  - ```mix deps.get``` is a command that finds and downloads the project dependencies
  - ```mix compile``` compiles the project on the ```_build``` folder
  - ```mix test``` runs the test suites from the ```test```
- Folders
  - ```config```: configs for the all environments
  - ```test```: scripts for testing the aplication
  - ```lib```: the project code
    - ```inmana```: ?
    - ```inmana_web```: ?

### Configuring credo
1. Add to your deps (https://github.com/rrrene/credo)
2. Create the config file with ```mix credo.gen.config```
3. Set ```Credo.Check.Readability.ModuleDoc``` from ```[]``` to ```false```
4. Run ```mix credo``` to check for any problems

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

# Day 1 - Connecting the api with the database

### Generating the migrations with the database
1. ```mix ecto.gen.migration create_restaurants_table```
2. Switch from integer ID to uuid, ```config/config.exs``` file
3. ```mix ecto.migrate```

### Adding a schema in ```restaurant.ex```

### Add a only create restaurant module

### Create a ```restaurant_controller.ex```

# Day 2 - Adding the supplies

### Create the migration with ```mix ecto.gen.migration create_supplies_table```, then migrate with ```mix ecto.migrate```
- ```mix ecto.reset``` resets all the migrations and database

### Create the schema, and make the "one restaurant has many supplies" connection

### Make the create module

### Prepare the CRUD routes
- Resources speeds up the process
- ```mix phx.routes``` shows all the routes

### Bamboo for creating email notifications

### Enums for useful list functions

# Day 3 - Tasks and Genservers

### Turn the email notifier from sync each to async each with streams and tasks

### Use genserver for email notifier scheduling

### Use a supervisor for automatically starting the genserver
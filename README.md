# NextLevelWeek 5 - Elixir track
## Inmana
### Loss prevention by smart inventory management
- REST api
- Can add suplies and restaurants
- Can access suply information
  - Name of the product
  - Who produced it
  - When it was made (dd/mm/yyyy)
  - When it expires (dd/mm/yyyy)
  - Who is responsible for it
- Can generate a report on expiring items every week for each restaurant
- Can send a report to each restaurant

## Day 0 - Getting started with elixir

### Creating the pheonix project with elixir
```
mix phx.new inmana --no-html --no-webpack
cd inmana
```

### Adding the postgresql database
```
mix ecto.create
```
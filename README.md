# NextLevelWeek 5 - Elixir track
## Inmana
### Loss prevention by smart inventory management
- REST api
- Can add supplies and restaurants
- Can access supply information
  - Product description
  - When it expires (dd/mm/yyyy)
  - Who is responsible for it
- Can generate a report on expiring items every week for each restaurant
- Can send an automatic report to each restaurants email

## My challenges
- Backend
  - Make test files for everything
  - Restaurants inventories CRUD
    - Restaurants can have multiple supply inventories with names and locations
  - Account CRUD
    - JWT tokens
    - Email confirmation
    - Restaurants can switch email, name and password with confirmation
  - Add more supply info
    - When it was made (dd/mm/yyyy)
    - Name of the product
    - Who produced it
  - Same supplies, different expiration date
- Frontend
  - Mobile-first web frontend
  - Download as webapp
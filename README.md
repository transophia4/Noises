# Noises
## Local Development
Once both all system dependencies and database migrations are installed, run 
```
npm i
npm run build
npm run dev
```
to start the server. 

### System
This project requires installing the [Node.js](https://nodejs.org/en) and [PostgreSQL](https://www.postgresql.org/download/).

### Environmental Variables
This system uses `.env` for environment variables. Fill out the environmental variables in the `.env.template` file and rename it to `.env` to let the service access environmental variables. The existing values should work if you have a default installation of postgres (a user named postgres without a password on port 5432). 

### Database Migrations
Run `npx prisma migrate dev` to run the database migration to create or update your postgres database.

# Monorepo: NestJS + Quasar

## Overview

This monorepo combines NestJS for the backend (API) and Quasar for the frontend, providing a full-stack application. The project structure is organized to facilitate development, testing, and production builds.

## Project Structure

- **apps/api**: NestJS backend application.
- **apps/web**: Quasar frontend application.

## Scripts

### Development

To run both the NestJS API and Quasar web app concurrently in development mode:

```bash
npm run dev
```

This command uses concurrently to execute development scripts for both the API and web app.

### Build and Start

For production builds and start:

```bash
npm run build:start
```

#### This script automates the following steps:

1. Sets the NODE_ENV to production.
2. Builds the NestJS API and Quasar web app.
3. Removes the existing client directory in the API.
4. Creates a new client directory.
5. Copies the built web app into the API's client directory.
6. Starts the NestJS server.

## Author

- **Name:** LEROY Nicolas

## License

This project is licensed under the ISC License.

## Dependencies

- **concurrently:** ^8.2.2

Ensure that [pnpm](https://pnpm.io/) is installed, as it's used to manage dependencies and execute scripts.

Feel free to customize the `package.json` and scripts according to your specific project requirements.

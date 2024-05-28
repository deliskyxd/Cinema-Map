# OpenLayers + Vite

This example demonstrates how the `ol` package can be used with [Vite](https://vitejs.dev/).

To get started, run the following (requires Node 14+):

    npx create-ol-app my-app --template vite

Then change into your new `my-app` directory and start a development server (available at http://localhost:5173):

    cd my-app
    npm start

To generate a build ready for production:

    npm run build

Then deploy the contents of the `dist` directory to your server.  You can also run `npm run serve` to serve the results of the `dist` directory for preview.

# author

> [!NOTE]
> parsing the json + getting the photos for them -> cinemas.js


TO-DO:
- [x] create a mysql database to store the database (docker-compose)
- [ ] create a table to store the cinemas data
- [x] create a golang server (Dockerfile)
- [ ] make the golang server serve the json file with an api
- [ ] 


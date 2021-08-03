# IIIF Example app

This is a quick example application for rendering some metadata and thumbnails out of IIIF manifests.

## Local installation

After cloning the repository, start the application with:

```
$ bundle install
$ bundle exec ruby app.rb
# OR
$ bundle exec rackup
```

Compile the javascript assets with:

```
$ yarn install
$ npm run build:dev
# OR
$ npm run build:dev:watch
````

## Testing

There is one test:

```
$ bundle exec rake
```

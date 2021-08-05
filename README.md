# Cocina Example App

This is a quick example application for rendering some metadata and thumbnails out of [Cocina objects](https://github.com/sul-dlss/cocina-models).

## Local installation

After cloning the repository, start the application with:

```
$ bundle install
$ bundle exec rackup
```

Compile the javascript assets with:

```
$ yarn install
$ npm run build:dev
````

## Testing

There is one test:

```
$ bundle exec rake
```

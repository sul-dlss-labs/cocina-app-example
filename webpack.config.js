const path = require('path');

module.exports = {
  entry: './assets/app.js',
  devtool: 'inline-source-map',
  resolve: {
    extensions: ['.js'],
  },
  output: {
    filename: 'app.js',
    path: path.resolve(__dirname, 'public/assets/javascripts/'),
  },
  module: {
    rules: [
     {
       test: /\.(js|jsx)$/,
       exclude: /nodeModules/,
       use: {
         loader: 'babel-loader'
       }
     }
    ]
  }
};

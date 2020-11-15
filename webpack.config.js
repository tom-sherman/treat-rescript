
const path = require('path');
const TreatPlugin = require('treat/webpack-plugin');

const outputDir = path.join(__dirname, 'build/');

const HtmlWebpackPlugin = require('html-webpack-plugin');

const isProd = process.env.NODE_ENV === 'production';

module.exports = {
  entry: './lib/js/src/Index.bs.js',
  mode: isProd ? 'production' : 'development',
  output: {
    path: outputDir,
    publicPath: outputDir,
    filename: 'Index.js'
  },
  module: {
    rules: [
      {
        test: /\.m?js$/,
        exclude: /(node_modules|bower_components)/,
        use: {
          loader: 'babel-loader',
          options: {
            plugins: ['babel-plugin-treat'],
            presets: ['@babel/preset-env'],
          }
        }
      }
    ]
  },
  plugins: [
    new TreatPlugin({
      test: /_treat\.bs\.js$/
    }),
    new HtmlWebpackPlugin({
      template: path.resolve(__dirname, 'src/index.html'),
      inject: false
    })
  ],
  devServer: isProd ? undefined : {
    contentBase: outputDir,
    compress: true,
    port: 9000,
    overlay: true,
    hot: true
  },
};

var webpack = require('webpack');
var UglifyJSPlugin = require('uglifyjs-webpack-plugin');
//var glob = require('glob');

//var entryObj = {};
//glob.sync("src/js/**/!(_)*.js").forEach(function (filePath) {
//    var filename = filePath.match(/(.*)\/(.*)\.js/)[2];
//    entryObj[filename] = __dirname + '/' + filePath;
//});

module.exports = {
    mode: 'development',
    devtool: 'eval-source-map',

    entry: './src/index.js',
    output: {
        publicPath: '/dist/',
        path: __dirname + '/dist',
        filename: 'index.js'
    },

    devServer: {
        contentBase: './dist',
        port: 8081,
        hot: true
    },

    module: {
        rules: [
            {
                enforce: 'pre',
                test: /\.js$/,
                loader: 'eslint-loader',
                exclude: /node_module/
            },
            {
                test: /\.tag$/,
                use: {
                    loader: 'riot-tag-loader',
                    options: {
                        hot: true
                    }
                },
                exclude: /node_module/
            },
            {
                test: /\.js$/,
                use: {
                    loader: 'babel-loader',
                    options: {
                        presets: ['env']
                    }
                },
                exclude: /node_module/
            },
            {
                test: /\.css$/,
                use: [
                    { loader: 'style-loader' },
                    { loader: 'css-loader' },
                    { loader: 'postcss-loader' }
                ]
            }
        ]
    },

    plugins: [
        new webpack.HotModuleReplacementPlugin(),
        new UglifyJSPlugin()
    ]
}
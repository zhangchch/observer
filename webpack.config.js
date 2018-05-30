var webpack = require('webpack');

module.exports = {
    mode: 'development',
    devtool: 'eval-source-map',

    entry: __dirname +'/src/js/index.js',
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
        new webpack.HotModuleReplacementPlugin()
    ]
}
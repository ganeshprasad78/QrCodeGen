const { environment } = require('@rails/webpacker')
const webpack = require("webpack")

environment.plugins.append("Provide",
	new webpack.ProvidePlugin({
		$: 'jquery/src/jquery',
		jQuery: 'jquery/src/jquery',
		Popper: ['popper.js', 'default'],
		moment: 'moment/moment'
	})
)

module.exports = environment

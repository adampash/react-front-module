# Load css first thing. It gets injected in the <head> in a <style> element by
# the Webpack style-loader.
require '../../public/main.css'

React = require 'react'
# Assign React to Window so the Chrome React Dev Tools will work.
window.React = React

Router = require('react-router')
Route = Router.Route

# Require route components.
Main = require './main'
App = require './app'

# routes = (
#   <Route handler={App}>
#     <Route name="main" handler={Main} path="/" />
#   </Route>
# )
# Router.run(routes, Router.HistoryLocation, (Handler) ->
#   React.render <Handler/>, document.body
# )

React.render(<Main />,
            document.body)

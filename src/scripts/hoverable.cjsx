TimerMixin = require 'react-timer-mixin'

module.exports = React.createClass
  mixins: [TimerMixin]
  displayName: 'Hoverable'
  timeout: null
  handleHover: ->
    @timeout = @setTimeout =>
      @props.hoverCallback(@props.id, @props.index)
    , 100
  killHover: ->
    clearTimeout @timeout
  render: ->
    <div onMouseOver={@handleHover} onMouseOut={@killHover} className="hoverableLink">
      <a href={@props.url} target="_blank">
        <div className={if @props.active then 'active dot' else 'dot'} />
        <div className="headline">
          <h4>
            {@props.headline}
          </h4>
        </div>
      </a>
    </div>

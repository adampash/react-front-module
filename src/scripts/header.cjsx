module.exports = React.createClass
  displayName: 'Header'
  render: ->
    <div className="header">
      <h4>
        <a href={@props.url} target="_blank">
          {@props.text}
        </a>
      </h4>
    </div>

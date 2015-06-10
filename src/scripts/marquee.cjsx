module.exports = React.createClass
  displayName: 'Marquee'

  openLink: ->
    window.open @props.story.url

  render: ->
    <div className="marquee" onClick={@openLink}>
      <div className="box">
        <img src={@props.story.img} />
      </div>
      <div className="box">
        <div className="text">
          <h4 className="tag">{@props.story.tag}</h4>
          <h2>
            <a href={@props.story.url} target="_blank">
              {@props.story.headline}
            </a>
          </h2>
          <div className="deck">
            <hr />
            {@props.story.deck}
          </div>
        </div>
      </div>
    </div>



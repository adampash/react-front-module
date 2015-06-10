TimerMixin = require 'react-timer-mixin'
Marquee = require './marquee'
Hoverable = require './hoverable'
Header = require './header'
Data = require './data'

module.exports = React.createClass
  mixins: [TimerMixin]
  displayName: 'Main'
  getInitialState: ->
    activeStoryId: 123801
    activeStory: 0
    stories: Data.stories
    hovering: false

  cycle: ->
    unless @state.hovering
      if @state.activeStory is @state.stories.length - 1
        activeStory = 0
      else
        activeStory = @state.activeStory + 1
      @setState
        activeStory: activeStory
        activeStoryId: @state.stories[activeStory].id

  componentDidMount: ->
    @setInterval @cycle, 7000

  hoverCallback: (storyId, storyIndex) ->
    @setState
      activeStoryId: storyId
      activeStory: storyIndex

  handleMouseOver: ->
    @setState
      hovering: true
  handleMouseOut: ->
    @setState
      hovering: false

  render: ->
    <div className="container"
      onMouseOver={@handleMouseOver}
      onMouseOut={@handleMouseOut}
    >
      <Header text="Kotaku Covers E3" url="http://kotaku.com/tag/e3" />
      <Marquee story={@state.stories[@state.activeStory]} />
      <div className="links">
        {@state.stories.map (story, index) =>
          <Hoverable
            hoverCallback={@hoverCallback}
            headline={story.headline}
            key={story.id}
            id={story.id}
            url={story.url}
            img={story.img}
            active={@state.activeStoryId is story.id}
            index={index}
          />
        }
      </div>
    </div>

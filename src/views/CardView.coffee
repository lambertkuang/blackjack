class window.CardView extends Backbone.View

  className: 'card'
  
  initialize: -> @render()

  render:  ->
    @$el.children().detach()
    if @model.get 'revealed'
      @$el.html @model.url @model.attributes
    else
      @$el.html '<img src="img/card-back.png">' 


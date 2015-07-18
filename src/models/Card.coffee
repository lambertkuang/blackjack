class window.Card extends Backbone.Model
  initialize: (params) ->
    @set
      revealed: true
      rotated: false
      value: if !params.rank or 10 < params.rank then 10 else params.rank
      suitName: ['spades', 'diamonds', 'clubs', 'hearts'][params.suit]
      rankName: switch params.rank
        when 0 then 'king'
        when 1 then 'ace'
        when 11 then 'jack'
        when 12 then 'queen'
        else params.rank

  flip: ->
    @set 'revealed', !@get 'revealed'
    @

  url: ->
    if not @get 'rotated'
      return _.template '<img src="img/cards/<%= rankName %>-<%= suitName %>.png">'
    else 
      return _.template '<img class="doubleDown" src="img/cards/<%= rankName %>-<%= suitName %>.png">'
      


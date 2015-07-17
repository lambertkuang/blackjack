class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->
    # @on 'endGame', ->
    #   @first().flip()

  hit: ->
    @add(@deck.pop())
    @scores()
    @last()


  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    scoreArray = [@minScore(), @minScore() + 10 * @hasAce()]
    if @evalScores() >= 21 
      @trigger 'endGame'
    scoreArray

  stand: ->
    @trigger 'endGame'

  evalScores: ->
    scoreArray = [@minScore(), @minScore() + 10 * @hasAce()]

    playerVal = if scoreArray[1] > 21 
      scoreArray[0]
    else
      scoreArray[1]

###
  some way to optimize the two scores in score
  if hasAce is true


###
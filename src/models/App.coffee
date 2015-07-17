# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @on 'endGame', @endGame

  endGame: ->
    #evaluate win/lose
    playerVal = @get('playerHand').get 'value'
    dealerVal = @get('dealerHand').get 'value'
    if playerVal is dealerVal then @tie()
    if dealerVal > 21 or playerVal is 21 then @win()
    if playerVal > 21 then @lose()
    if playerVal < 21 and playerVal < dealerVal then @lose()
    if playerVal < 21 and playerVal > dealerVal then @win()

  win: ->
    alert "YOU HAVE WON"

  lose: ->
    alert 'YOU HAVE LOST'

  tie: ->
    alert 'You have tied.'


    ###
      when evaluating scores in endGame, tie in to optimiation in Hand.coffee
    ###
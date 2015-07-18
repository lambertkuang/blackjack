# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'add', @evalScores, @
    @get('playerHand').on 'endGame', @endGame, @

  endGame: ->
    console.log 'END GAME'
    if not @gameHasEnded
      @gameHasEnded = not @gameHasEnded
      console.log "gameHasEnded has changed to " + @gameHasEnded

      @get('dealerHand').first().flip()
      playerVal = @get('playerHand').evalScores()
      dealerVal = @get('dealerHand').evalScores()
      #evaluate win/lose

      if dealerVal > 21 or playerVal is 21 then @win()
      else if playerVal > 21 then @lose()
      else if playerVal < 21 and playerVal < dealerVal then @lose()
      else if playerVal < 21 and playerVal > dealerVal then @win()
      else if playerVal is dealerVal then @tie()

  win: ->
    alert "YOU HAVE WON"

  lose: ->
    alert 'YOU HAVE LOST'

  tie: ->
    alert 'You have tied.'

  newRound: ->
    console.log(@get('deck').length)
    if @get('deck').length < 4 
      location.reload()
    else 
      #get rid of player hand and dealer hand
      player = @get 'playerHand'
      dealer = @get 'dealerHand'
      #for all cards in hand, pop cards out of hand
      for card in player
        player.pop()
      for card in dealer
        dealer.pop()
      #hit?? twice??
      player.hit()
      player.hit()
      #not reveal 1st card in dealer hand
      dealer.hit().flip()
      dealer.hit()
      # reset variables
      @gameHasEnded = false



  gameHasEnded: false

    ###
      when evaluating scores in endGame, tie in to optimiation in Hand.coffee
    ###
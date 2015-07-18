assert = chai.assert

describe 'hand', ->
  app = null
  deck = null
  hand = null
  dealer = null

  beforeEach ->
    app = new App()
    deck = new Deck()
    hand = deck.dealPlayer()
    dealer = deck.dealDealer()

  describe 'points', ->
    it 'should track total points in hand', ->
      initialVal = hand.scores()
      addedVal = hand.hit().get 'value'
      assert.strictEqual hand.get 'value', initialVal + addedVal

  describe 'end of game', ->
    it 'should evalute the status of the game: you should get an alert', ->
      app.endGame()
      assert.strictEqual app.gameHasEnded, true

  describe 'it should have functions', ->
    it 'should have a stand function', ->
      assert.typeOf hand.stand, 'function'

    it 'should have a score function', ->
      assert.typeOf hand.scores, 'function'

    it 'should have an eval scores function', ->
      assert.typeOf hand.evalScores, 'function'
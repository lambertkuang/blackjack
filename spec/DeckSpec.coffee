assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null
  dealer = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 49

#player and dealer start with two cards each
  describe 'players have two cards', ->
    it 'should show the player having two cards', ->
      assert.strictEqual hand.length, 2

  describe "dealer's hand", ->
    it 'should have two cards (one flipped, one not)', ->
      dealer = deck.dealDealer()
      assert.strictEqual dealer.length, 2
      assert.strictEqual dealer.first().get('revealed'), false

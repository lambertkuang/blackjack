assert = chai.assert

describe "deck constructor", ->
  deck = null

  beforeEach ->
    deck = new Deck()

  it "should create a card collection", ->
    assert.strictEqual deck.length, 52

    #see if there are four cards of each kind/13 cards of each suit

  it "should create a realistic deck", ->
    cards =
      spades : 0
      hearts : 0
      clubs : 0
      diamonds : 0
    for card in deck.models
      cards[card.get 'suitName']++
    assert.strictEqual cards['spades'], 13
    assert.strictEqual cards['hearts'], 13
    assert.strictEqual cards['clubs'], 13
    assert.strictEqual cards['diamonds'], 13

  it "should be able to flip", ->
    card = deck.pop()
    assert.ok card.get 'revealed' 
    card.flip()
    assert.ok not card.get 'revealed'

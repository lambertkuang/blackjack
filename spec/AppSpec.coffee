assert = chai.assert

describe "the app", ->
  deck = null
  hand = null
  dealer = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()
    dealer = deck.dealDealer()
    
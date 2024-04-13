extends Node

var sacrifice = load("res://assets/cards/sacrifice/Sacrifice.tres")
var summon_green_slime = load("res://assets/cards/summon_green_slime/SummonGreenSlime.tres")
var electrify = load("res://assets/cards/electrify/Electrify.tres")

enum Effects {
	ICE,
	ZAP
}

signal drawn_card(card : CardData)
@export var current_mana : int = 0
@export var cards_in_discard : Array[CardData] = []
@export var cards_in_hand : Array[CardData] = [
]
@export var cards_in_deck : Array[CardData] = [
	electrify,
	electrify,
	electrify,
	electrify,
	electrify,
	summon_green_slime,
	summon_green_slime,
	summon_green_slime,
	summon_green_slime,
	summon_green_slime,
	summon_green_slime,
	sacrifice,
	sacrifice,
	sacrifice,
	sacrifice,
]


func draw_card():
	cards_in_hand.append(cards_in_deck[0])
	drawn_card.emit(cards_in_deck[0])
	cards_in_deck.pop_at(0)


func shuffle_deck():
	randomize()
	cards_in_deck.shuffle()


func discard(card : CardData):
	cards_in_discard.append(cards_in_hand[cards_in_hand.find(card)])
	cards_in_hand.erase(card)
	# Draw a new one
	if cards_in_deck.size() > 0: draw_card()

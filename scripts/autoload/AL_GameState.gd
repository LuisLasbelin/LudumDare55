extends Node

@export var current_mana : int = 0
@export var cards_in_discard : Array[CardData] = []
@export var cards_in_hand : Array[CardData] = [
	load("res://assets/cards/sacrifice/Sacrifice.tres"),
	load("res://assets/cards/summon_green_slime/SummonGreenSlime.tres")
]
@export var cards_in_deck : Array[CardData] = [
	load("res://assets/cards/sacrifice/Sacrifice.tres"),
	load("res://assets/cards/sacrifice/Sacrifice.tres"),
	load("res://assets/cards/summon_green_slime/SummonGreenSlime.tres"),
	load("res://assets/cards/summon_green_slime/SummonGreenSlime.tres"),
	load("res://assets/cards/summon_green_slime/SummonGreenSlime.tres")
]


func steal_card():
	cards_in_hand.append(cards_in_deck[0])


func discard(card : CardData):
	cards_in_discard.append(cards_in_hand[cards_in_hand.find(card)])
	cards_in_hand.erase(card)
extends Node

var img_attack = Image.load_from_file('res://Image/BlockAttack.png')
var img_shield = Image.load_from_file('res://Image/BlockShield.png')
var img_energy = Image.load_from_file('res://Image/BlockEnergy.png')
var img_scroll = Image.load_from_file('res://Image/BlockScroll.png')

var tex_attack = ImageTexture.create_from_image(img_attack)
var tex_shield = ImageTexture.create_from_image(img_shield)
var tex_energy = ImageTexture.create_from_image(img_energy)
var tex_scroll = ImageTexture.create_from_image(img_scroll)

var rand_gen = RandomNumberGenerator.new()

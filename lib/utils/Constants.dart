
import 'package:flutter/material.dart';
import 'package:foodmonkey/models/Category.dart';
import 'package:foodmonkey/models/Tags.dart';

const Color yellow = Color(0xffFDC054);
const Color darkGray = Color(0xff202020);
const Color transparentYellow = Color.fromRGBO(253, 184, 70, .7);


const Color primary = Color(0xFFF6F6F6);
const Color secondary = Color(0xfFFFFBB91);
const Color accent = Color(0xFFFF8E6E);
const Color normal = Color(0xFF515070);


List<Category> cats=[
Category(name: "Burger", image: "Burger.jpg"),
Category(name: "Chicken Fried", image: "Chicken_fries.jpg"),
Category(name: "Chilli Burger", image: "Chilli_Burger.jpg"),
Category(name: "Coffee", image: "Coffe.jpg"),
Category(name: "French Fries", image: "french_fires.jpg"),
Category(name: "Hotpot", image: "Hot_pot.jpg"),
Category(name: "Noodle", image: "Noodle.jpg"),
Category(name: "Soft Drink", image: "Soft_drink.jpg"),
];

List<Tags> tags =[
  Tags(name: "Burger", image: "Burger.jpg"),
  Tags(name: "Soft Drink", image: "Soft_drink.jpg"),
  Tags(name: "Hotpot", image: "Hot_pot.jpg"),
  Tags(name: "Coffee", image: "Coffe.jpg"),
];
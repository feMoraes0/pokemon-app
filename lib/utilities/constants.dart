import 'package:flutter/material.dart';

/// URLs
const kPokemonImageURL = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/';
const kUniquePokemonURL = 'https://pokeapi.co/api/v2/pokemon/';

/// Colors
const kDarkGrey = Color(0xFF4F4F4F);
const kBlack = Color(0xFF000000);
const kBlackOpacity = Color.fromRGBO(0, 0, 0, 0.3);
const kLightGreyTab = Color.fromRGBO(0, 0, 0, 0.298);
const kLightGrey = Color(0xFFA4A4A4);
const kBlue = Color(0xFF559EDF);
const kLightBlue = Color(0xFF69B9E3);

/// TextStyle
const kTitleCardStyle = TextStyle(
  fontSize: 19.0,
  fontWeight: FontWeight.w500,
  color: kDarkGrey,
);
const kSubtitleCardStyle = TextStyle(
  fontSize: 15.0,
  fontWeight: FontWeight.normal,
  color: kLightGrey,
);
const kDetailsSectionTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w500,
  color: kBlue,
);

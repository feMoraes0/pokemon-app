import 'package:flutter/material.dart';

/// URLs
const kPokemonImageURL =
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/';
const kUniquePokemonURL = 'https://pokeapi.co/api/v2/pokemon/';

/// Colors
const kDarkGrey = Color(0xFF4F4F4F);
const kBlack = Color(0xFF000000);
const kBlackOpacity = Color.fromRGBO(0, 0, 0, 0.3);
const kLightGreyTab = Color.fromRGBO(0, 0, 0, 0.298);
const kLightGrey = Color(0xFFA4A4A4);
const kBlue = Color(0xFF559EDF);
const kLightBlue = Color(0xFF69B9E3);

/// Conversors
const kStatusNameConverter = {
  'hp': 'hp',
  'attack': 'atk',
  'defense': 'def',
  'special-attack': 'sat',
  'special-defense': 'sde',
  'speed': 'spd',
};
const kTypeImageConverter = {
  'grass': 'assets/tag-types/Grass@3x.png',
  'poison': 'assets/tag-types/Poison@3x.png',
  'water': 'assets/tag-types/Water@3x.png',
  'normal': 'assets/tag-types/Normal@3x.png',
  'bug': 'assets/tag-types/Bug@3x.png',
  'dark': 'assets/tag-types/Dark@3x.png',
  'dragon': 'assets/tag-types/Dragon@3x.png',
  'electric': 'assets/tag-types/Electric@3x.png',
  'fairy': 'assets/tag-types/Fairy@3x.png',
  'fighting': 'assets/tag-types/Fight@3x.png',
  'fire': 'assets/tag-types/Fire@3x.png',
  'flying': 'assets/tag-types/Flying@3x.png',
  'ghost': 'assets/tag-types/Ghost@3x.png',
  'ground': 'assets/tag-types/Ground@3x.png',
  'ice': 'assets/tag-types/Ice@3x.png',
  'psychic': 'assets/tag-types/Psychic@3x.png',
  'rock': 'assets/tag-types/Rock@3x.png',
  'steel': 'assets/tag-types/Steel@3x.png',
};
const kTypeColorConverter = {
  'bug': Color(0xFF9DC130),
  'dark': Color(0xFF5F606D),
  'dragon': Color(0xFF0773C7),
  'electric': Color(0xFFEDD53F),
  'fairy': Color(0xFFEF97E6),
  'fighting': Color(0xFFD94256),
  'fire': Color(0xFFF8A54F),
  'flying': Color(0xFF9BB4E8),
  'ghost': Color(0xFF6970C5),
  'grass': Color(0xFF5DBE62),
  'ground': Color(0xFFD78555),
  'ice': Color(0xFF7ED4C9),
  'normal': Color(0xFF9A9DA1),
  'psychic': Color(0xFFF87C7A),
  'poison': Color(0xFFB563CE),
  'rock': Color(0xFFCEC18C),
  'steel': Color(0xFF5596A4),
  'water': Color(0xFF559EDF),
};

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
const kStatusTitleTextStyle = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w800,
  fontSize: 13.0,
  color: kBlue,
);
const kStatusNumberTextStyle = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
  fontSize: 14.0,
  color: Color(0xFF666666),
);

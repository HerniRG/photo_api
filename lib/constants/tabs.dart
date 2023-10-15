import 'package:flutter/material.dart';

class Constants {
  static final List<CategoryInfo> categories = [
    CategoryInfo(name: "Animales", icon: Icons.pets),
    CategoryInfo(name: "Edificio", icon: Icons.business),
    CategoryInfo(name: "Alimento", icon: Icons.restaurant),
    CategoryInfo(name: "Naturaleza", icon: Icons.landscape),
    CategoryInfo(name: "Tecnología", icon: Icons.computer),
    CategoryInfo(name: "Deportes", icon: Icons.sports_basketball),
    CategoryInfo(name: "Moda", icon: Icons.accessibility),
    CategoryInfo(name: "Arte", icon: Icons.palette),
    CategoryInfo(name: "Música", icon: Icons.music_note),
    CategoryInfo(name: "Viajes", icon: Icons.airplanemode_active),
  ];
}

class CategoryInfo {
  final String name;
  final IconData icon;

  CategoryInfo({required this.name, required this.icon});
}

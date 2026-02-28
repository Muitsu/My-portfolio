import 'package:flutter/material.dart';

class ExperienceModel {
  final String company;
  final String role;
  final String period;
  final IconData icon;
  final List<String> points;

  ExperienceModel(
      {required this.company,
      required this.role,
      required this.period,
      required this.icon,
      required this.points});
}

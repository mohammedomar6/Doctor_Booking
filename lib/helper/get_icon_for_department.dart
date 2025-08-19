import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

IconData getIconForDepartment(String name) {
  switch (name.toLowerCase()) {
    case 'dentist':
      return FontAwesomeIcons.tooth;
    case 'cardiologist':
      return FontAwesomeIcons.heartPulse;
    case 'orthopedics':
    case 'Orthopedics':
      return FontAwesomeIcons.bone;
    case 'neurologist':
      return FontAwesomeIcons.brain;
    case 'child':
    case 'pediatrician':
      return FontAwesomeIcons.baby;
    case 'general physician':
      return FontAwesomeIcons.userDoctor;
    case 'dermatology':
      return FontAwesomeIcons.handsBubbles;
    default:
      return Icons.medical_services;
  }
}

import 'package:flutter/material.dart';

class ListItem {
  final String name;
  final String jobTitle;
  final String website;
  final String salary;
  final String address;
  final String companyName;
  final String description;

  final IconData icon;

  final String imagePath;
  final Color color;

  ListItem(
      {this.name,
      this.description,
      this.jobTitle,
      this.website,
      this.salary,
      this.address,
      this.companyName,
      this.icon,
      this.imagePath,
      this.color});
}

import 'package:flutter/material.dart';
import 'package:app_graphql/models/country.dart';

class CountryCard extends StatelessWidget {
  final Country country;
  final VoidCallback onTap;

  const CountryCard({super.key, required this.country, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(country.name),
        subtitle: Text('Capital: ${country.capital}'),
        trailing: Text(country.code),
        onTap: onTap,
      ),
    );
  }
}

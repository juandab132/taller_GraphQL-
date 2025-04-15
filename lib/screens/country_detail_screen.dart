import 'package:flutter/material.dart';
import 'package:app_graphql/models/country.dart';

class CountryDetailScreen extends StatelessWidget {
  final Country country;

  const CountryDetailScreen({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalles del País')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nombre: ${country.name}', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text('Código: ${country.code}'),
                SizedBox(height: 8),
                Text('Capital: ${country.capital}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

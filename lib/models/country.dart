class Country {
  final String code;
  final String name;
  final String capital;

  Country({required this.code, required this.name, required this.capital});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      code: json['code'],
      name: json['name'],
      capital: json['capital'] ?? 'Sin capital',
    );
  }
}

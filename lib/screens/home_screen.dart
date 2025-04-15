import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_graphql/controllers/country_controller.dart';
import 'package:app_graphql/widgets/country_card.dart';
import 'package:app_graphql/screens/country_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final CountryController controller = Get.find<CountryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Países (GraphQL)')),
      body: RefreshIndicator(
        onRefresh: () => controller.fetchCountries(),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.error.isNotEmpty) {
            return Center(child: Text('Error: ${controller.error}'));
          } else if (controller.countries.isEmpty) {
            return Center(child: Text('No hay países disponibles'));
          } else {
            return ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: controller.countries.length,
              itemBuilder: (context, index) {
                final country = controller.countries[index];
                return CountryCard(
                  country: country,
                  onTap: () {
                    Get.to(() => CountryDetailScreen(country: country));
                  },
                );
              },
            );
          }
        }),
      ),
    );
  }
}

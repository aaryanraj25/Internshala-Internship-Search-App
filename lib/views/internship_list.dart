import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshala/controllers/internship_controller.dart';
import 'package:internshala/views/widgets/internship_card.dart';

class InternshipList extends StatelessWidget {
  final String searchQuery;

  InternshipList({required this.searchQuery});

  final InternshipController internshipController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (internshipController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }

      final filteredInternships = internshipController.internships.where((internship) {
        final lowerCaseQuery = searchQuery.toLowerCase();
        return internship.title.toLowerCase().contains(lowerCaseQuery) ||
            internship.company.toLowerCase().contains(lowerCaseQuery) ||
            internship.locations.any((location) => location.toLowerCase().contains(lowerCaseQuery));
      }).toList();

      return ListView.builder(
        itemCount: filteredInternships.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 2.0), // Very little space between cards
            child: InternshipCard(internship: filteredInternships[index]),
          );
        },
      );
    });
  }
}

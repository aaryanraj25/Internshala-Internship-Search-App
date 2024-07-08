import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshala/controllers/filters_controller.dart';

class FiltersScreen extends StatelessWidget {
  final FiltersController filtersController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Column(
        children: [
          // Profile Filter
          TextField(
            decoration: InputDecoration(labelText: 'Profile'),
            onChanged: (value) {
              filtersController.setProfile(value);
            },
          ),
          // City Filter
          TextField(
            decoration: InputDecoration(labelText: 'City'),
            onChanged: (value) {
              filtersController.setCity(value);
            },
          ),
          // Duration Filter
          TextField(
            decoration: InputDecoration(labelText: 'Duration'),
            onChanged: (value) {
              filtersController.setDuration(value);
            },
          ),
          ElevatedButton(
            onPressed: () {
              // Apply filters and go back
              Get.back();
            },
            child: Text('Apply Filters'),
          ),
        ],
      ),
    );
  }
}

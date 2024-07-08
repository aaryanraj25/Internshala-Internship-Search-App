import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshala/controllers/filters_controller.dart';

class FiltersScreen extends StatelessWidget {
  final FiltersController filtersController = Get.find();

  final List<int> durations = [1, 2, 3, 4, 6, 12, 24, 36];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Text('Filters', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white, // Ensure the space below the app bar is white
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PROFILE',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Obx(() {
                      return Column(
                        children: [
                          for (var profile in filtersController.profiles)
                            Chip(
                              label: Text(profile),
                              onDeleted: () {
                                filtersController.removeProfile(profile);
                              },
                            ),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              _showAddDialog(context, 'Add Profile', filtersController.addProfile);
                            },
                            child: Text(
                              '+ Add profile',
                              style: TextStyle(color: Colors.blue, fontSize: 16),
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                'CITY',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Obx(() {
                return Column(
                  children: [
                    for (var city in filtersController.cities)
                      Chip(
                        label: Text(city),
                        onDeleted: () {
                          filtersController.removeCity(city);
                        },
                      ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        _showAddDialog(context, 'Add City', filtersController.addCity);
                      },
                      child: Text(
                        '+ Add city',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    ),
                  ],
                );
              }),
              SizedBox(height: 30),
              Text(
                'DURATION (IN MONTHS)',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 20),
              Obx(() {
                return DropdownButtonFormField<int>(
                  value: filtersController.duration.value.isEmpty
                      ? null
                      : int.parse(filtersController.duration.value),
                  items: durations.map((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Container(
                        color: Colors.white, // Ensure the drop-down items background is white
                        child: Text(value.toString()),
                      ),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    hintText: 'Choose Duration',
                    contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0), // Adjusted padding for smaller height
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  onChanged: (value) {
                    filtersController.setDuration(value.toString());
                  },
                  dropdownColor: Colors.white, // Set drop-down menu background to white
                );
              }),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        filtersController.clearFilters();
                      },
                      child: Text('Clear all'),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0), // Rounded rectangle
                        ),
                        foregroundColor: Colors.blue,
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back(result: {
                          'profile': filtersController.profiles.join(', '),
                          'city': filtersController.cities.join(', '),
                          'duration': filtersController.duration.value,
                        });
                      },
                      child: Text('Apply', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0), // Rounded rectangle
                        ),
                        backgroundColor: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddDialog(BuildContext context, String title, Function(String) addFunction) {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Set the background color to white
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold), // Set title text to bold
          ),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter $title',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Cancel', style: TextStyle(color: Colors.blue)), // Set button text color to blue
            ),
            TextButton(
              onPressed: () {
                addFunction(controller.text);
                Get.back();
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text('Add', style: TextStyle(color: Colors.white)), // Set button text color to white
            ),
          ],
        );
      },
    );
  }
}

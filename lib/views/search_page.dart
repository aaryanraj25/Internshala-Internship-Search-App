import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internshala/views/internship_list.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 1; // Default to "Internships" tab
  String _searchQuery = '';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigate to the corresponding page
    // Example:
    // if (index == 0) Navigator.push(...); // Home
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            // Implement menu functionality
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 0.0), // Reduce space between menu icon and text
          child: Text('Internships', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: IconButton(
              onPressed: () {
                // Navigate to filter screen
              },
              icon: Icon(Icons.filter_alt_outlined, color: Colors.blue, size: 24.0), // Smaller icon
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white, // Set the background color to white
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0), // Reduced vertical padding
              child: Container(
                height: 40.0, // Set the height of the search bar
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center, // Align text vertically
                  decoration: InputDecoration(
                    hintText: 'Search internships',
                    hintStyle: TextStyle(fontSize: 14),
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12.0), // Adjust content padding for better alignment
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              color: Colors.grey[200],
              height: 2.0, // Grey padding
            ),
            Expanded(
              child: InternshipList(searchQuery: _searchQuery),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.grey[200],
            height: 2.0, // Grey padding
          ),
          BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/telegram-plane.svg'),
                label: 'Internships',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.briefcase),
                label: 'Jobs',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Courses',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            onTap: _onItemTapped,
            backgroundColor: Colors.white, // Set the bottom bar background to white
          ),
        ],
      ),
    );
  }
}

# Internshala Search Page App

A Flutter application designed to replicate the internship search page of the Internshala Android App. The app fetches data from an API and displays a list of internships with filter options.

## Features

- Splash Screen
- Search bar for internships
- Filter internships based on profile, city, and duration
- Display a list of internships with details like title, company, location, start date, duration, stipend, and labels
- Custom bottom navigation bar for navigation

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) installed on your machine
- [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/) with Flutter plugin

### Installation

**Clone the repository:**
   git clone https://github.com/your-username/Internshala-Internship-Search-App.git
   cd YourRepository

## Project Structure

lib/
├── main.dart
├── models/
│   ├── filters_model.dart
│   └── internship_model.dart
├── services/
│   ├── api_service.dart
│   └── internship_service.dart
├── controllers/
│   ├── filters_controller.dart
│   └── internship_controller.dart
├── views/
│   ├── search_page.dart
│   ├── internship_list.dart
│   ├── filters_screen.dart
│   ├── splash_screen.dart
│   
└── widgets/
│       └── internship_card.dart





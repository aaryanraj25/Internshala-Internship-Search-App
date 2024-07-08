import 'package:get/get.dart';

class FiltersController extends GetxController {
  var profiles = <String>[].obs;
  var cities = <String>[].obs;
  var duration = ''.obs;

  void addProfile(String profile) {
    if (profile.isNotEmpty && !profiles.contains(profile)) {
      profiles.add(profile);
    }
  }

  void removeProfile(String profile) {
    profiles.remove(profile);
  }

  void addCity(String city) {
    if (city.isNotEmpty && !cities.contains(city)) {
      cities.add(city);
    }
  }

  void removeCity(String city) {
    cities.remove(city);
  }

  void setDuration(String newDuration) {
    duration.value = newDuration;
  }

  void clearFilters() {
    profiles.clear();
    cities.clear();
    duration.value = '';
  }
}

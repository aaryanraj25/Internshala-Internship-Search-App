import 'package:get/get.dart';
import 'package:internshala/models/filters_model.dart';

class FiltersController extends GetxController {
  var selectedProfile = ''.obs;
  var selectedCity = ''.obs;
  var selectedDuration = ''.obs;

  void setProfile(String profile) {
    selectedProfile.value = profile;
  }

  void setCity(String city) {
    selectedCity.value = city;
  }

  void setDuration(String duration) {
    selectedDuration.value = duration;
  }

  Filters get filters => Filters(
        profile: selectedProfile.value,
        city: selectedCity.value,
        duration: selectedDuration.value,
      );
}

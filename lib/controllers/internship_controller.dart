import 'package:get/get.dart';
import 'package:internshala/models/internship_model.dart';
import 'package:internshala/services/internship_service.dart';

class InternshipController extends GetxController {
  var internships = <Internship>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchInternships();
    super.onInit();
  }

  void fetchInternships() async {
    try {
      isLoading(true);
      var internshipList = await InternshipService.fetchInternships();
      if (internshipList != null) {
        internships.value = internshipList;
      }
    } finally {
      isLoading(false);
    }
  }
}

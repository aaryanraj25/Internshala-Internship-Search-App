import 'package:internshala/models/internship_model.dart';
import 'api_services.dart';

class InternshipService {
  static Future<List<Internship>> fetchInternships() async {
    final Map<String, dynamic> responseJson = await ApiService.getInternships();
    final List<dynamic> internshipIds = responseJson['internship_ids'];
    final Map<String, dynamic> internshipsMeta = responseJson['internships_meta'];
    
    List<Internship> internships = [];
    for (var id in internshipIds) {
      internships.add(Internship.fromJson(internshipsMeta[id.toString()]));
    }

    return internships;
  }
}

import 'package:http/http.dart' as http;
import "package:fetch_api_test/models/user.dart";
import "package:fetch_api_test/constants.dart";

class ApiServices {
  Future<List<User>> fetchUsers() async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<User> users = userFromJson(response.body);
      return users;
    } else {
      throw Exception("Failed to load resources");
    }
  }
}

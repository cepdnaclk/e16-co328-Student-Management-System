import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:crypt/crypt.dart';

// this class if for data fetching from the online database
class DataFetch {
  static String email = "";
  static String name = "";
  static List<dynamic> marks = [];
  static List<dynamic> payments = [];

  static List<double> marksValue = [];
  static List<String> paperTitles = [];

  // this method is for adding new user to the user database
  static Future<bool> addUser(String email, String pass) async {
    var url = Uri.https(
        'greaved-eights.000webhostapp.com',
        '/api/addNewStudent.php',
        {'email': email, 'name': '', 'pass': hashPass(pass)});
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print('Response: $jsonResponse');
      DataFetch.name = '';
      DataFetch.email = email;
      return true;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return false;
    }
  }

  // this method is for login user
  static Future<String> loginUser(String email, String pass) async {
    var url = Uri.https(
        'greaved-eights.000webhostapp.com', '/api/login.php', {'email': email});
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print('Response: $jsonResponse');
      if (jsonResponse['response'] == 'failed') {
        return "User not exists";
      } else {
        if (hashMatch(pass, jsonResponse['pass'])) {
          DataFetch.name = jsonResponse['name'];
          DataFetch.email = email;
          return '';
        } else {
          return 'Password does not match';
        }
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return "Something went wrong. Please try again.";
    }
  }

  // hash password
  static String hashPass(String pass) {
    // genarating the hash for the user
    final hashpass = Crypt.sha256(pass);
    return hashpass.toString();
  }

  // match the hash
  static bool hashMatch(String pass, String hashString) {
    // Parse the crypt string: this extracts the type, rounds and salt
    // print('pass=$pass hash=$hashString');
    final h = Crypt(hashString);

    return h.match(pass);
  }

  // fetch the mark details
  static Future<void> fetchMarks() async {
    var url = Uri.https('greaved-eights.000webhostapp.com', '/api/getMarks.php',
        {'email': DataFetch.email});
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print('Response: $jsonResponse');
      DataFetch.marks = jsonResponse['details'];

      DataFetch.marks.forEach((element) {
        marksValue.add(double.parse(element['marks']) / 100);
        paperTitles.add(element['paper_no']);
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  // fetch payment details
  static Future<void> fetchPayments() async {
    var url = Uri.https('greaved-eights.000webhostapp.com',
        '/api/getPayments.php', {'email': DataFetch.email});
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print('Response: $jsonResponse');
      DataFetch.payments = jsonResponse['details'];

      DataFetch.marks.forEach((element) {
        marksValue.add(double.parse(element['marks']) / 100);
        paperTitles.add(element['paper_no']);
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}

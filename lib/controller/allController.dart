import 'package:cnemax/models/allModel.dart';
import 'package:flutter/material.dart';

class AllController extends ChangeNotifier {
  bool _loding = false;
  bool get loding => _loding;
  setloding(bool value) {
    _loding = value;
  }

  List<Movie_model> _allMovie = [];
  List<Movie_model> get getallmovie => _allMovie;

  setMovieList(List<Movie_model> model) {
    _allMovie = model;
    notifyListeners();
  }

  List<Movie_model> nowplayingmovie(bool value) =>
      _allMovie.where((element) => element.ismovierelease == value).toList();
// ==========================================
// ==========================================
  List<Cinema_model> _allCinema = [];
  List<Cinema_model> get getallcinema => _allCinema;

  setCinemaList(List<Cinema_model> model) {
    _allCinema = model;
  }

// =========================================
// =========================================
  dynamic _userdata;

  User_model get userdata => _userdata;

// =========================================
// =========================================
  List<User_model> _alluser = [];
  List<User_model> get getalluser => _alluser;
  setUserList(List<User_model> model) {
    _alluser = model;
  }

  login(String email, String password) {
    User_model data = _alluser.firstWhere(
        (element) => element.email == email.trim(),
        orElse: () => User_model("", "", "", "", 0));
    final user = data.password == password.trim();
    if (data.email.isNotEmpty) {
      // setloding(true);
      print('gmail is correct');

      if (user) {
        setloding(true);
        _userdata = data;
      } else {
        print("password wrong");
        setloding(false);
      }
      ;
    } else {
      print("gmail not regester");
      setloding(false);
    }
  }
}

// List<Map<String, dynamic>> loginuserdata = [
//   {
//     "name": "ankit",
//     "email": "ankit@gmail.com",
//     "password": "1234",
//   },
//   {
//     "name": "jaat",
//     "email": "jaat@gmail.com",
//     "password": "4321",
//   }
// ];

// login(String email, String password) {
//   final data = loginuserdata.where((element) => element["email"] == email);
//   bool user = data.first["password"] == password;
//   if (user) {
//     print(data);
//   } else {
//     print("Not User");
//   }
// }

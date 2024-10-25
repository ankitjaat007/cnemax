class Movie_model {
  String movie_img, movie_name, director, cinema_name;
  double likes;
  int movie_id;
  bool ismovierelease;
  List<String> cenes;
  durationmodel? duration;
  List<actormodel> actor;

  Movie_model(
    this.movie_id,
    this.cinema_name,
    this.movie_img,
    this.movie_name,
    this.director,
    this.likes,
    this.ismovierelease,
    this.cenes,
    this.duration,
    this.actor,
  );
  Movie_model.FromModelList(
    Map<String, dynamic> json,
  )   : movie_id = json['movie_id'] ?? 0,
        cinema_name = json['cinema_name'] ?? "",
        movie_img = json['movie_img'] ?? "",
        movie_name = json['movie_name'] ?? "",
        ismovierelease = json['is_movie_release'] ?? bool,
        director = json['director'] ?? "",
        duration = json['duration'] == null
            ? null
            : durationmodel.fromDuration(json["duration"]),
        likes = json['likes'] ?? 0,
        cenes = json['cenes'] == null
            ? []
            : (json['cenes'] as List).map((e) => e.toString()).toList(),
        actor = json['actor'] == null
            ? []
            : (json['actor'] as List)
                .map((e) => actormodel.fromactor(e))
                .toList();
}

class durationmodel {
  int hours, min;
  durationmodel(this.hours, this.min);

  durationmodel.fromDuration(Map<String, dynamic> duration)
      : hours = duration["hours"] ?? 0,
        min = duration["min"] ?? 0;
}

class actormodel {
  String image, name, work;
  actormodel(this.image, this.name, this.work);
  actormodel.fromactor(Map<String, dynamic> actor)
      : image = actor["image"] ?? "",
        name = actor["name"] ?? "",
        work = actor["work"] ?? "";
}

// ================================================
//                      cinema json
// ================================================
class Cinema_model {
  String cinema_name, address, phn_number;
  int rating;
  List<cinema_detlis_model> cinema_detlis;

  Cinema_model(this.cinema_name, this.rating, this.address, this.phn_number,
      this.cinema_detlis);
  Cinema_model.FromModelList(Map<String, dynamic> json)
      : cinema_name = json['cinema_name'] ?? "",
        rating = json["rating"] ?? 0,
        address = json["address"] ?? "",
        phn_number = json['phn_number'] ?? "",
        cinema_detlis = json['cinema_detlis'] == null
            ? []
            : (json['cinema_detlis'] as List)
                .map((e) => cinema_detlis_model.FromModelList(e))
                .toList();
}

class cinema_detlis_model {
  String screen;
  int auditorium, movie_id;
  List<String> play_time;
  cinema_detlis_model(
      this.screen, this.auditorium, this.play_time, this.movie_id);
  cinema_detlis_model.FromModelList(Map<String, dynamic> json)
      : movie_id = json['movie_id'] ?? 0,
        screen = json['screen'] ?? "",
        auditorium = json['auditorium'] ?? 0,
        play_time = json["play_time"] == null
            ? []
            : (json['play_time'] as List).map((e) => e.toString()).toList();
}
// ===================================================
//      user model
// ===================================================

class User_model {
  String image, name, email, password;
  int phn_num;
  User_model(this.image, this.name, this.email, this.password, this.phn_num);
  User_model.FromModelList(Map<String, dynamic> json)
      : name = json['name'] ?? "",
        image = json['image'] ?? "",
        email = json['email'] ?? "",
        password = json['password'] ?? "",
        phn_num = json['phn_num'] ?? 0;
}

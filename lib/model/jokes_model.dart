class JokesModel {
  JokesModel({
    this.error,
    this.category,
    this.type,
    this.setup,
    this.delivery,
    this.flags,
    this.safe,
    this.id,
    this.lang,
  });

  bool? error;
  String? category;
  String? type;
  String? setup;
  String? delivery;
  Flags? flags;
  bool? safe;
  int? id;
  String? lang;

  factory JokesModel.fromJson(Map<String, dynamic> json) => JokesModel(
        error: json["error"],
        category: json["category"],
        type: json["type"],
        setup: json["setup"],
        delivery: json["delivery"],
        flags: Flags.fromJson(json["flags"]),
        safe: json["safe"],
        id: json["id"],
        lang: json["lang"],
      );
}

class Flags {
  Flags({
    this.nsfw,
    this.religious,
    this.political,
    this.racist,
    this.sexist,
    this.explicit,
  });

  bool? nsfw;
  bool? religious;
  bool? political;
  bool? racist;
  bool? sexist;
  bool? explicit;

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        nsfw: json["nsfw"],
        religious: json["religious"],
        political: json["political"],
        racist: json["racist"],
        sexist: json["sexist"],
        explicit: json["explicit"],
      );
}

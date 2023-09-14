class ExerciseList {
  ExerciseList({required this.exercise});
  List<ExerciseInfo> exercise;
  factory ExerciseList.fromJson(List<dynamic> parsedJson) {
    List<ExerciseInfo> temp = <ExerciseInfo>[];
    temp = parsedJson.map((e) => ExerciseInfo.fromJson(e)).toList();
    return ExerciseList(exercise: temp);
  }
}

class ExerciseInfo {
  String bodyPart;
  String equipment;
  String gifUrl;
  String id;
  String name;
  String target;

  ExerciseInfo({
    required this.bodyPart,
    required this.equipment,
    required this.gifUrl,
    required this.id,
    required this.name,
    required this.target,
  });

  factory ExerciseInfo.fromJson(Map<String, dynamic> json) => ExerciseInfo(
        bodyPart: json["bodyPart"],
        equipment: json["equipment"],
        gifUrl: json["gifUrl"],
        id: json["id"],
        name: json["name"],
        target: json["target"],
      );

  Map<String, dynamic> toJson() => {
        "bodyPart": bodyPart,
        "equipment": equipment,
        "gifUrl": gifUrl,
        "id": id,
        "name": name,
        "target": target,
      };
}

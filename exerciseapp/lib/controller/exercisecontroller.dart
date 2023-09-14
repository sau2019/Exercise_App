import 'package:exerciseapp/model/exerciseinfo.dart';
import 'package:exerciseapp/services/httpservices.dart';
import 'package:flutter/material.dart';

class ExerciseController extends ChangeNotifier {
  final HttpServices _httpServices = HttpServices();
  ExerciseList _exerciseList = ExerciseList.fromJson([]);
  ExerciseInfo? _exerciseInfo;
  bool _loading = false;

  bool get loading => _loading;
  ExerciseList get exerciseList => _exerciseList;
  ExerciseInfo? get exerciseInfo => _exerciseInfo;

  getExerciseList() async {
    _loading = true;
    var result = await _httpServices.getExerciseList();
    if (result != null) {
      _exerciseList = ExerciseList.fromJson(result);
    }
    _loading = false;

    notifyListeners();
  }

  getExerciseDetail({required String id}) async {
    _loading = true;
    var result = await _httpServices.getExerciseDetails(id: id);

    if (result != null) {
      _exerciseInfo = ExerciseInfo.fromJson(result);
    }
    _loading = false;

    notifyListeners();
  }
}

import 'package:exerciseapp/controller/exercisecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class ExerciseDetailPage extends StatefulWidget {
  final String id;
  const ExerciseDetailPage({super.key, required this.id});

  @override
  State<ExerciseDetailPage> createState() => _ExerciseDetailPageState();
}

class _ExerciseDetailPageState extends State<ExerciseDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<ExerciseController>(context, listen: false)
        .getExerciseDetail(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    var exercise = context.watch<ExerciseController>();
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          tooltip: "Back",
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black87,
          ),
        ),
        title: Text(
          "Exercise Detail",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: exercise.loading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            )
          : Column(
              children: [
                Image.network(
                  exercise.exerciseInfo!.gifUrl,
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    exercise.exerciseInfo!.name,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    exercise.exerciseInfo!.bodyPart +
                        " (${exercise.exerciseInfo!.target})",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    exercise.exerciseInfo!.equipment,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

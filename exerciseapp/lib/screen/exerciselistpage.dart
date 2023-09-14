import 'package:exerciseapp/controller/exercisecontroller.dart';
import 'package:exerciseapp/model/exerciseinfo.dart';
import 'package:exerciseapp/screen/exercisedetailpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class ExerciseListPage extends StatefulWidget {
  const ExerciseListPage({super.key});

  @override
  State<ExerciseListPage> createState() => _ExerciseListPageState();
}

class _ExerciseListPageState extends State<ExerciseListPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ExerciseController>(context, listen: false).getExerciseList();
  }

  @override
  Widget build(BuildContext context) {
    var exercise = context.watch<ExerciseController>();
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          elevation: 2.0,
          backgroundColor: Colors.white,
          title: Text(
            "Exercise List",
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
            : exercise.exerciseList.exercise.isEmpty
                ? Center(
                    child: Text("No Record Found"),
                  )
                : SingleChildScrollView(
                    child: Scrollbar(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                              children: List.generate(100, (index) {
                            ExerciseInfo exerciseInfo =
                                exercise.exerciseList.exercise[index];

                            return Card(
                              color: Colors.green.shade50,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ExerciseDetailPage(
                                                id: exerciseInfo.id,
                                              )));
                                },
                                child: SizedBox(
                                  height: 250,
                                  width: MediaQuery.of(context).size.width / 2 -
                                      10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              10.0,
                                            ),
                                            child: Image.network(
                                              exerciseInfo.gifUrl,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  10,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          exerciseInfo.name,
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          exerciseInfo.bodyPart +
                                              " (${exerciseInfo.target})",
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          exerciseInfo.equipment,
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }))
                        ],
                      ),
                    ),
                  ));
  }
}

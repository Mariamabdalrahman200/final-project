import 'dart:convert';

class ProgramModel {
    int id;
    String description;
    Coach coach;
    Coach trainer;
    List<ExerciseElement> exercises;
    DateTime createdAt;

    ProgramModel({
        required this.id,
        required this.description,
        required this.coach,
        required this.trainer,
        required this.exercises,
        required this.createdAt,
    });

    factory ProgramModel.fromRawJson(String str) => ProgramModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProgramModel.fromJson(Map<String, dynamic> json) => ProgramModel(
        id: json["id"],
        description: json["description"],
        coach: Coach.fromJson(json["coach"]),
        trainer: Coach.fromJson(json["trainer"]),
        exercises: List<ExerciseElement>.from(json["exercises"].map((x) => ExerciseElement.fromJson(x))),
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "coach": coach.toJson(),
        "trainer": trainer.toJson(),
        "exercises": List<dynamic>.from(exercises.map((x) => x.toJson())),
        "created_at": createdAt.toIso8601String(),
    };
}

class Coach {
    String email;
    int id;
    String username;
    String firstName;
    String lastName;
    String phone;
    double weight;
    double height;
    String gender;
    String goal;
    String experianseLevel;
    String userType;

    Coach({
        required this.email,
        required this.id,
        required this.username,
        required this.firstName,
        required this.lastName,
        required this.phone,
        required this.weight,
        required this.height,
        required this.gender,
        required this.goal,
        required this.experianseLevel,
        required this.userType,
    });

    factory Coach.fromRawJson(String str) => Coach.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Coach.fromJson(Map<String, dynamic> json) => Coach(
        email: json["email"],
        id: json["id"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        weight: json["weight"]?.toDouble(),
        height: json["height"]?.toDouble(),
        gender: json["gender"],
        goal: json["goal"],
        experianseLevel: json["experianse_level"],
        userType: json["user_type"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "id": id,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "weight": weight,
        "height": height,
        "gender": gender,
        "goal": goal,
        "experianse_level": experianseLevel,
        "user_type": userType,
    };
}

class ExerciseElement {
    String day;
    int sets;
    int reps;
    ExerciseExercise exercise;

    ExerciseElement({
        required this.day,
        required this.sets,
        required this.reps,
        required this.exercise,
    });

    factory ExerciseElement.fromRawJson(String str) => ExerciseElement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ExerciseElement.fromJson(Map<String, dynamic> json) => ExerciseElement(
        day: json["day"],
        sets: json["sets"],
        reps: json["reps"],
        exercise: ExerciseExercise.fromJson(json["exercise"]),
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "sets": sets,
        "reps": reps,
        "exercise": exercise.toJson(),
    };
}

class ExerciseExercise {
    int exerciseId;
    String name;
    String muscleGroup;
    dynamic machine;
    String description;

    ExerciseExercise({
        required this.exerciseId,
        required this.name,
        required this.muscleGroup,
        required this.machine,
        required this.description,
    });

    factory ExerciseExercise.fromRawJson(String str) => ExerciseExercise.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ExerciseExercise.fromJson(Map<String, dynamic> json) => ExerciseExercise(
        exerciseId: json["exercise_id"],
        name: json["name"],
        muscleGroup: json["muscle_group"],
        machine: json["machine"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "exercise_id": exerciseId,
        "name": name,
        "muscle_group": muscleGroup,
        "machine": machine,
        "description": description,
    };
}
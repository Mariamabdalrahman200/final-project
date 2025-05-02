import 'dart:convert';

class RequestInfoModel {
    int id;
    int coachId;
    int trainerId;
    String coachName;
    String trainerName;
    String status;
    DateTime createdAt;

    RequestInfoModel({
        required this.id,
        required this.coachId,
        required this.trainerId,
        required this.coachName,
        required this.trainerName,
        required this.status,
        required this.createdAt,
    });

    factory RequestInfoModel.fromRawJson(String str) => RequestInfoModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RequestInfoModel.fromJson(Map<String, dynamic> json) => RequestInfoModel(
        id: json["id"],
        coachId: json["coach_id"],
        trainerId: json["trainer_id"],
        coachName: json["coach_name"],
        trainerName: json["trainer_name"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "coach_id": coachId,
        "trainer_id": trainerId,
        "coach_name": coachName,
        "trainer_name": trainerName,
        "status": status,
        "created_at": createdAt.toIso8601String(),
    };
}
import 'dart:convert';

String grpModelToJson(GrpModel data) => json.encode(data.toJson());

class GrpModel {
  GrpModel({
    required this.name,
    required this.desc,
  });

  String name;
  String desc;

  Map<String, dynamic> toJson() => {
        "name": name,
        "desc": desc,
      };
}

String grpToJson(GrpModel data) => json.encode(data.toJson());

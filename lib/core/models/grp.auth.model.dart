// To parse this JSON data, do
//
//     final sendEmailModel = sendEmailModelFromJson(jsonString);

import 'dart:convert';

SendEmailModel sendEmailModelFromJson(String str) => SendEmailModel.fromJson(json.decode(str));

String sendEmailModelToJson(SendEmailModel data) => json.encode(data.toJson());

class SendEmailModel {
    final String data;
    final String byAdmin;
    final String grpName;
    final bool received;

    SendEmailModel({
        required this.data,
        required this.byAdmin,
        required this.grpName,
        required this.received,
    });

    SendEmailModel copyWith({
        String? data,
        String? byAdmin,
        String? grpName,
        bool? received,
    }) => 
        SendEmailModel(
            data: data ?? this.data,
            byAdmin: byAdmin ?? this.byAdmin,
            grpName: grpName ?? this.grpName,
            received: received ?? this.received,
        );

    factory SendEmailModel.fromJson(Map<String, dynamic> json) => SendEmailModel(
        data: json["data"],
        byAdmin: json["byAdmin"],
        grpName: json["grpName"],
        received: json["received"],
    );

    Map<String, dynamic> toJson() => {
        "data": data,
        "byAdmin": byAdmin,
        "grpName": grpName,
        "received": received,
    };
}

import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

class AuthModelRecord {
  late String id,
      created,
      updated,
      collectionId,
      collectionName;
  late Map<String,dynamic> data;
  AuthModelRecord(
      {required this.id,
      required this.created,
      required this.updated,
      required this.collectionId,
      required this.collectionName,
      required this.data});

  factory AuthModelRecord.fromRecordModel(RecordModel model) {
    return AuthModelRecord(
        id: model.id,
        created: model.created,
        updated: model.updated,
        collectionId: model.collectionId,
        collectionName: model.collectionName,
        data: model.data

    );
  }
  static Map<String, dynamic> toJSON(AuthModelRecord model) {
    return {
      "id": model.id,
      "created": model.created,
      "updated": model.updated,
      "collectionId": model.collectionId,
      "collectionName": model.collectionName,
      "data":model.data
    };
  }
}

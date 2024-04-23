
// import 'package:hive/hive.dart';

// import 'package:compliance_tablet/Models/recordmodel.dart';

// part 'LoginBoxx.g.dart';

// @HiveType(typeId: 1)
// class AuthRecordModelBoxtype {
//   @HiveField(0)
//   late String id;
//   @HiveField(1)
//   late String created;
//   @HiveField(2)
//   late String updated;
//   @HiveField(3)
//   late String collectionId;
//   @HiveField(4)
//   late String collectionName;
//   @HiveField(5)
//   late Map<String, dynamic> data;
//   AuthRecordModelBoxtype(
//       {required this.id,
//       required this.created,
//       required this.updated,
//       required this.collectionId,
//       required this.collectionName,
//       required this.data});
//   factory AuthRecordModelBoxtype.fromAuthModelRecord(AuthModelRecord model) {
//     print(
//         "Inside AuthRecordModelBoxtype from auth model record:${model.toString()}");
//     return AuthRecordModelBoxtype(
//         id: model.id,
//         created: model.created,
//         updated: model.updated,
//         collectionId: model.collectionId,
//         collectionName: model.collectionName,
//         data: model.data);
//   }
// }

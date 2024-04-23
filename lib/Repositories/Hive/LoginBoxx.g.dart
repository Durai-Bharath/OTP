// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'LoginBoxx.dart';

// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************

// class AuthRecordModelBoxtypeAdapter
//     extends TypeAdapter<AuthRecordModelBoxtype> {
//   @override
//   final int typeId = 1;

//   @override
//   AuthRecordModelBoxtype read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return AuthRecordModelBoxtype(
//       id: fields[0] as String,
//       created: fields[1] as String,
//       updated: fields[2] as String,
//       collectionId: fields[3] as String,
//       collectionName: fields[4] as String,
//       data: (fields[5] as Map).cast<String, dynamic>(),
//     );
//   }

//   @override
//   void write(BinaryWriter writer, AuthRecordModelBoxtype obj) {
//     writer
//       ..writeByte(6)
//       ..writeByte(0)
//       ..write(obj.id)
//       ..writeByte(1)
//       ..write(obj.created)
//       ..writeByte(2)
//       ..write(obj.updated)
//       ..writeByte(3)
//       ..write(obj.collectionId)
//       ..writeByte(4)
//       ..write(obj.collectionName)
//       ..writeByte(5)
//       ..write(obj.data);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is AuthRecordModelBoxtypeAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

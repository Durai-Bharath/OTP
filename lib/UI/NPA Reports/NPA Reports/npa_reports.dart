// import 'dart:typed_data';

// import 'package:compliance_tablet/UI/NPA%20Reports/NPA%20Reports/Rows/Sixth%20Row%20(B)/b_main_row.dart';
// import 'package:compliance_tablet/UI/NPA%20Reports/NPA%20Reports/Rows/fifth_row.dart';
// import 'package:compliance_tablet/UI/NPA%20Reports/NPA%20Reports/Rows/first_row.dart';
// import 'package:compliance_tablet/UI/NPA%20Reports/NPA%20Reports/Rows/fourth_row.dart';
// import 'package:compliance_tablet/UI/NPA%20Reports/NPA%20Reports/Rows/second_row.dart';
// import 'package:compliance_tablet/UI/NPA%20Reports/NPA%20Reports/Rows/third_row.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/material.dart' as mt;
// import 'package:flutter/widgets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// Future<Uint8List> loadImage(String path) async {
//   ByteData imageData = await rootBundle.load(path);
//   Uint8List imageBytes = imageData.buffer.asUint8List();
//   return imageBytes;
// }

// Future<pw.Widget> generateImage() async {
//   Uint8List imageBytes = await loadImage("assets/images/bank.png");
//   pw.MemoryImage image = pw.MemoryImage(imageBytes);
//   return pw.Image(image);
// }

// class CreateReport {
//   static Future<Uint8List> makePdf() async {
//     final pdf = pw.Document();
//     pw.Widget image = await generateImage();
//     pw.Widget first_row = await FirstRow.generateFirstRow();
//      pw.Widget second_row = await SecondRow.generateSecondRow();
//      pw.Widget third_row = await ThirdRow.generateThirdRow();
//      pw.Widget fourth_row = await FourthRow.generateFourthRow();
//           pw.Widget fifth_row = await FifthRow.generateFifthRow();
//              pw.Widget sixth_row = await SixthRow.generateSixthRow();

//     pdf.addPage(
//       pw.Page(
//         theme: pw.ThemeData.withFont(
//           base: await PdfGoogleFonts.openSansRegular(),
//           bold: await PdfGoogleFonts.openSansBold(),
//           icons: await PdfGoogleFonts.materialIcons(), // this line
//         ),
//         build: (pw.Context context) {
//           return pw.Column(
//             mainAxisAlignment: pw.MainAxisAlignment.start,
//             children: [
//               pw.Align(
//                   alignment: pw.Alignment.centerRight,
//                   child: pw.Container(height: 50.h, width: 50.w, child: image)),
//               pw.Align(
//                 alignment: pw.Alignment.centerLeft,
//                 child: pw.Text("Bharath Vikas Bank           Tier 2"),
//               ),
//               pw.SizedBox(height: 10.h),
//               pw.Text(
//                   "Classification of Assets and Provisioning made against Non Performing Assets as on March 31 ,______________",
//                   style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),

//               //Lakhs
//               pw.Align(
//                 alignment: pw.Alignment.centerRight,
//                 child: pw.Container(
//                   height: 15.h,
//                   width: double.maxFinite,
//                   decoration: pw.BoxDecoration(
//                       border: pw.Border.all(color: PdfColors.black)),
//                   child: pw.Text(
//                     "(\$ in lakh)",
//                     textAlign: pw.TextAlign.right,
//                     style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 10),
//                   ),
//                 ),
//               ),

//               //first Row
//               first_row,

//               //second row
//               second_row,

//               //third row
//               third_row,

//               //fourth row
//               fourth_row,

//               //fifth row
//               fifth_row,

//               //sixth row
//               sixth_row,

            
//             ],
//           );
        
//         },
//       ),
//     );
//     return pdf.save();
//   }

//   static pw.Widget PaddedText(
//     final String text, {
//     final pw.TextAlign align = pw.TextAlign.left,
//   }) =>
//       pw.Padding(
//         padding: pw.EdgeInsets.all(10),
//         child:
//             pw.Text(text, textAlign: align, style: pw.TextStyle(fontSize: 16)),
//       );
// }

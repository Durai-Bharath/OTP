// import 'package:syncfusion_flutter_datagrid/datagrid.dart';
// import 'package:flutter/material.dart';

// class AlertDataGrid extends StatefulWidget {
//   const AlertDataGrid({super.key});

//   @override
//   State<AlertDataGrid> createState() => _AlertDataGridState();
// }

// class _AlertDataGridState extends State<AlertDataGrid> {
//   @override
//   Widget build(BuildContext context) {
//   return Container(
//     width: double.maxFinite,

//     child: SfDataGrid(
//       source: _employeeDataSource,
//       columns: [
//         GridColumn(
//             columnName: 'id',
//             label: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 16.0),
//                 alignment: Alignment.centerRight,
//                 child: Text(
//                   'ID',
//                   overflow: TextOverflow.ellipsis,
//                 ))),
//         GridColumn(
//             columnName: 'name',
//             label: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 16.0),
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Name',
//                   overflow: TextOverflow.ellipsis,
//                 ))),
//         GridColumn(
//             columnName: 'designation',
//             label: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 16.0),
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Designation',
//                   overflow: TextOverflow.ellipsis,
//                 ))),
//         GridColumn(
//             columnName: 'salary',
//             label: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 16.0),
//                 alignment: Alignment.centerRight,
//                 child: Text(
//                   'Salary',
//                   overflow: TextOverflow.ellipsis,
//                 ))),
//       ],
//     ),
//   );
// }
// }
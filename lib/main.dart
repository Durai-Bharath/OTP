import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:compliance_tablet/API-Calls/pocketbase.dart';
import 'package:compliance_tablet/BLOC-Observer/bloc_observer.dart';


import 'package:compliance_tablet/UI/Login-Register-Screens/login_page.dart';

import 'package:compliance_tablet/bloc/login_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() async{
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  // final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  // Hive.init(appDocumentsDir.path);
  // if (!Hive.isAdapterRegistered(1)) {
  //   Hive.registerAdapter(AuthRecordModelBoxtypeAdapter());
  // }


  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  final pocketbase = PocketBaseAuthClass()..init();
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = TextTheme(
      displayLarge: GoogleFonts.lato(
          fontSize: 97, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      displayMedium: GoogleFonts.lato(
          fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      displaySmall: GoogleFonts.lato(fontSize: 48, fontWeight: FontWeight.w400),
      headlineMedium: GoogleFonts.lato(
          fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headlineSmall:
          GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.w400),
      headlineLarge: GoogleFonts.lato(
          fontSize: 24, fontWeight: FontWeight.w400, color: Colors.white),
      titleLarge: GoogleFonts.lato(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: Colors.white),
      titleMedium: GoogleFonts.lato(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      titleSmall: GoogleFonts.lato(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyLarge: GoogleFonts.lato(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyMedium: GoogleFonts.lato(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: Colors.white),
      labelLarge: GoogleFonts.lato(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      bodySmall: GoogleFonts.lato(
          fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      labelSmall: GoogleFonts.lato(
          fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    );
    Color customPrimaryColor = const Color.fromRGBO(232, 232, 235, 1);
    // print(MediaQuery.of(context).size.height);
    MaterialColor customPrimaryMaterialColor =
        createMaterialColor(customPrimaryColor);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
      child: ScreenUtilInit(
        designSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height),
        minTextAdapt: false,
        builder: (context, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                textTheme: textTheme,
                primarySwatch: customPrimaryMaterialColor,
                colorScheme: ColorScheme.fromSwatch(
                    primarySwatch: customPrimaryMaterialColor),
                useMaterial3: true,
              ),
              home: 
              // SiderDrawer() 
              Myhome()
              );
        },
      ),
    );
  }

  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}


class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  // String? token;
  // Future<void> getpref() async {
  //   final pref = await SharedPreferences.getInstance();
  //   setState(() {
  //     token = pref.getString(PrefKeys.accessTokenPrefsKey);
  //   });

  //   print("at main:: token:$token");
  // }

  // @override
  // void initState() {
    
  //   getpref();
  //   print("after token:$token");
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // final pbauthclass = PocketBaseAuthClass();
    // final bool isAuth = pbauthclass.isAuth;
    // print(isAuth);
    // if (token != null) {}
    return
    //  token != null  ? SiderDrawer()  : 
     LogInPage();
  }
}

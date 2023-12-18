import 'package:flutter/material.dart';
import 'package:flutter_application_11/app_router.dart';

void main() {
  runApp( MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {

  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter}); 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     onGenerateRoute: appRouter.generateRoute,
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}

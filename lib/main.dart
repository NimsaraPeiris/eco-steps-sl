import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/welcome_screen.dart';
import 'providers/auth_provider.dart';
import 'providers/tree_provider.dart';
import 'providers/report_provider.dart';

void main() {
  runApp(const GreenLankaApp());
}

class GreenLankaApp extends StatelessWidget {
  const GreenLankaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => TreeProvider()),
        ChangeNotifierProvider(create: (_) => ReportProvider()),
      ],
      child: MaterialApp(
        title: 'GreenLanka',
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
        ),
        home: const WelcomeScreen(),
      ),
    );
  }
}
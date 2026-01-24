import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme.dart';
import 'splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Configurar la orientación de la pantalla
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  // Configurar la barra de estado
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: MuseoOrigenColors.navGreen,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  
  runApp(const MuseoOrigenApp());
}

class MuseoOrigenApp extends StatelessWidget {
  const MuseoOrigenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Museo Origen',
      debugShowCheckedModeBanner: false,
      theme: MuseoOrigenTheme.theme,
      home: const SplashScreen(),
    );
  }
}

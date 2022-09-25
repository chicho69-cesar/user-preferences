import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_preferences/providers/theme_provider.dart';
import 'package:user_preferences/screens/screens.dart';
import 'package:user_preferences/share-preferences/preferences.dart';

void main() async {
  /* Mediante este metodo nos aseguramos de que todos los widgets esten inicializados al
  momento de levantar la aplicacion, esto para que no rompa con la inicializacion de las 
  preferencias del archivo preferences.dart */
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode)
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Preferences',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SettingsScreen.routeName: (_) => const SettingsScreen(),
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}

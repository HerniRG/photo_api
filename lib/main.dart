import 'package:flutter/material.dart';
import 'package:photo_api/provider/photo_gallery_provider.dart';
import 'package:photo_api/pages/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PhotoGalleryModel(),
      child: MaterialApp(
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
          debugShowCheckedModeBanner: false,
          title: 'Galería de Fotos',
          home: const HomeScreen()),
    );
  }
}

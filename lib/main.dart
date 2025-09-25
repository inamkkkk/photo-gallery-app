import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:photo_gallery_app/screens/gallery_screen.dart';
import 'package:photo_gallery_app/models/gallery_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => GalleryModel(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GalleryScreen(),
    );
  }
}
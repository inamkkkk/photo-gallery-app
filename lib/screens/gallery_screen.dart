import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:photo_gallery_app/models/gallery_model.dart';
import 'package:photo_gallery_app/screens/full_screen_image.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final galleryModel = Provider.of<GalleryModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_a_photo),
            onPressed: () async {
              final ImagePicker picker = ImagePicker();
              final XFile? image = await picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                galleryModel.addImage(image.path);
              }
            },
          ),
        ],
      ),
      body: galleryModel.images.isEmpty
          ? const Center(child: Text('No images yet. Add some!'))
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: galleryModel.images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullScreenImage(imagePath: galleryModel.images[index]),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset(
                      galleryModel.images[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
import 'dart:io';
import 'package:astrology/utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImageWidget extends StatefulWidget {
  final File? image;
  final Function(File) onImagePicked;
  const ProfileImageWidget(
      {super.key, required this.image, required this.onImagePicked});

  @override
  State<ProfileImageWidget> createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    final ImageSource? source = await showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Image Source'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () => Navigator.of(context).pop(ImageSource.gallery),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () => Navigator.of(context).pop(ImageSource.camera),
            ),
          ],
        ),
      ),
    );
    if (source != null) {
      final pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null) {
        final File imageFile = File(pickedFile.path);
        widget.onImagePicked(imageFile);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.2,
      child: Center(
        child: Stack(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: ColorUtil.colorProfileGrey,
                borderRadius: BorderRadius.circular(60),
                border: Border.all(
                    color: ColorUtil.colorProfileLightGrey, width: 8),
              ),
              child: widget.image != null
                  ? ClipOval(
                      child: Image.file(
                        widget.image!,
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit
                            .cover, // Ensure the image covers the entire circle
                      ),
                    )
                  : const Icon(
                      Icons.account_circle,
                      color: ColorUtil.colorGrey,
                      size: 110.0,
                    ),
            ),
            Positioned(
              bottom: 1,
              right: 1,
              child: GestureDetector(
                onTap: pickImage,
                child: const CircleAvatar(
                  radius: 16,
                  backgroundColor: ColorUtil.colorOrange,
                  child: Icon(
                    Icons.edit,
                    color: ColorUtil.colorWhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

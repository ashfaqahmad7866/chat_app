import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class UserImagePicker extends StatefulWidget {
   UserImagePicker({super.key, required this.onPickImage});
  void Function(File pick) onPickImage;
  @override
  State<UserImagePicker> createState() => UserImagePickerSate();
}

class UserImagePickerSate extends State<UserImagePicker> {
  File? _pickedImage;
  void _pickImagge() async{
  final userImage= await ImagePicker().pickImage(source: ImageSource.camera,maxWidth: 150,imageQuality: 50,);
  if (userImage==null) {
    return;
  }
  setState(() {
    _pickedImage=File(userImage.path);
  });
  widget.onPickImage(_pickedImage!);}
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 40,backgroundColor: Colors.grey,foregroundImage:_pickedImage!=null? FileImage(_pickedImage!):null,),
        TextButton.icon(
            onPressed: _pickImagge,
            icon: const Icon(Icons.image),
            label: Text(
              'Add Image',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ))
      ],
    );
  }
}

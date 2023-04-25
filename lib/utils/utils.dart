// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'package:image_picker/image_picker.dart';

imagePicker(ImageSource source) async {
  final ImagePicker _ImagePicker = ImagePicker();

  XFile? _file = await _ImagePicker.pickImage(source: source);
  if (_file != null) {
    return _file.readAsBytes();
  }
}

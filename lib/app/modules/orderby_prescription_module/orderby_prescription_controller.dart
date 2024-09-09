import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class OrderbyPrescriptionController extends GetxController {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    print("Image List Length:${imageFileList!.length}");
    // imageFileList?.forEach((element) {print("element:::${element.path}");});
    update();
  }

  void selectImgFromCamera() async {
    final XFile? selectedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice:
          CameraDevice.front, // Choose camera device (front/back)
    );

    if (selectedImage != null) {
      imageFileList!.add(selectedImage);
    }

    print("Image List Length: ${imageFileList!.length}");
    update();
  }
}

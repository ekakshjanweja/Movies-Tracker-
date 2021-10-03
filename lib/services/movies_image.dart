import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class MovieImage {
  //image selector
  late File imageFile;

  final picker = ImagePicker();

  Future pickImage(String movieName, String directorName) async {
    String imageUrl = '';

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    imageFile = File(pickedFile!.path);

    //upload image to firebase

    UploadTask uploadTask;

    Reference reference = FirebaseStorage.instance
        .ref('movieImage/${imageFile.path}/${DateTime.now()}');

    uploadTask = reference.putFile(imageFile);

    await uploadTask.whenComplete(() {
      print('IMAGE UPLOADED');
    });
    await reference.getDownloadURL().then((url) {
      imageUrl = url.toString();
    });
    print('Check');
    print(imageUrl);
    print('Check');

    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final User user = firebaseAuth.currentUser!;
    String uId = user.uid;
    var time = DateTime.now();
    FirebaseFirestore.instance
        .collection('Movies')
        .doc(uId)
        .collection('myMovies')
        .doc(time.toString())
        .set({
      'name': movieName,
      'director': directorName,
      'time': time.toString(),
      'imgUrl': imageUrl,
    });
  }
}

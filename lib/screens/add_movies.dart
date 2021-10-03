import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:movie_tracker/services/movies_image.dart';

class AddMovie extends StatefulWidget {
  const AddMovie({Key? key}) : super(key: key);

  @override
  _AddMovieState createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  TextEditingController movieNameController = TextEditingController();
  TextEditingController directorNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Add A Movie'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            //Name
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: movieNameController,
                style: TextStyle(color: Theme.of(context).primaryColorDark),
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  hintText: 'Name',
                  hintStyle:
                      TextStyle(color: Theme.of(context).primaryColorDark),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),

            //Director
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: directorNameController,
                style: TextStyle(color: Theme.of(context).primaryColorDark),
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  hintText: 'Director',
                  hintStyle:
                      TextStyle(color: Theme.of(context).primaryColorDark),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),

            // //Add Image
            // MaterialButton(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   color: Theme.of(context).primaryColor,
            //   onPressed: () async {
            //     MovieImage().pickImage();
            //   },
            //   child: Container(
            //     padding:
            //         const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            //     child: Text(
            //       'Add Image',
            //       style: TextStyle(
            //         color: Theme.of(context).primaryColorDark,
            //         fontSize: 18,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // ),

            const SizedBox(height: 20),

            //Add Movie
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                MovieImage().pickImage(
                    movieNameController.text, directorNameController.text);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                child: Text(
                  'Add Movie And Image',
                  style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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

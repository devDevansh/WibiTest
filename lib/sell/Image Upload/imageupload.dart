import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

/// Widget to capture and crop the image
class ImageCapture extends StatefulWidget {
  createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  /// Active image file
  File _imageFile;

  /// Cropper plugin
  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
      sourcePath: _imageFile.path,
      // ratioX: 1.0,
      // ratioY: 1.0,
      // maxWidth: 512,
      // maxHeight: 512,
      //  toolbarColor: Colors.purple,
      // toolbarWidgetColor: Colors.white,
      //  toolbarTitle: 'Crop It'
    );
    setState(() {
      _imageFile = cropped ?? _imageFile;
    });
  }

  /// Select an image via gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    // ignore: deprecated_member_use
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  /// Remove image
  void _clear() {
    setState(() => _imageFile = null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.photo_camera,
                size: 30,
              ),
              onPressed: () => _pickImage(ImageSource.camera),
              color: Color(0xFF546E7A),
            ),
            IconButton(
              icon: Icon(
                Icons.photo_library,
                size: 30,
              ),
              onPressed: () => _pickImage(ImageSource.gallery),
              color: Color(0xFF546E7A),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          if (_imageFile != null) ...[
            Container(
                padding: EdgeInsets.all(32), child: Image.file(_imageFile)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // ignore: deprecated_member_use
                FlatButton(
                  color: Color(0xFF1264D1),
                  child: Icon(Icons.crop, color: Colors.white),
                  onPressed: _cropImage,
                ),
                // ignore: deprecated_member_use
                FlatButton(
                  color: Color(0xFF1264D1),
                  child: Icon(Icons.refresh, color: Colors.white),
                  onPressed: _clear,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Uploader(
                file: _imageFile,
              ),
            )
          ]
        ],
      ),
    );
  }
}

/// Widget used to handle the management of
class Uploader extends StatefulWidget {
  final File file;

  Uploader({Key key, this.file}) : super(key: key);

  createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://wibi-50b77.appspot.com/');

  StorageUploadTask _uploadTask;

  _startUpload() {
    String filePath = 'images/${DateTime.now()}.png';

    setState(() {
      _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
      //print(_storage.ref());
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_uploadTask != null) {
      return StreamBuilder<StorageTaskEvent>(
          stream: _uploadTask.events,
          builder: (context, snapshot) {
            var event = snapshot?.data?.snapshot;

            double progressPercent = event != null
                ? event.bytesTransferred / event.totalByteCount
                : 0;

            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (_uploadTask.isComplete)
                    Text('Upload Successful!',
                        style: TextStyle(
                            color: Color(0xFF1264D1), height: 2, fontSize: 20)),
                  if (_uploadTask.isPaused)
                    // ignore: deprecated_member_use
                    FlatButton(
                      child: Icon(
                        Icons.play_arrow,
                        size: 30,
                        color: Color(0xFF546E7A),
                      ),
                      onPressed: _uploadTask.resume,
                    ),
                  if (_uploadTask.isInProgress)
                    // ignore: deprecated_member_use
                    FlatButton(
                      child: Icon(
                        Icons.pause,
                        size: 30,
                        color: Color(0xFF546E7A),
                      ),
                      onPressed: _uploadTask.pause,
                    ),
                  LinearProgressIndicator(value: progressPercent),
                  Text(
                    '${(progressPercent * 100).toStringAsFixed(2)} % ',
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xFF546E7A),
                    ),
                  ),
                ]);
          });
    } else {
      // ignore: deprecated_member_use
      return FlatButton.icon(
          color: Color(0xFF1264D1),
          label: Text(
            'Upload',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.cloud_upload, color: Colors.white),
          onPressed: _startUpload);
    }
  }
}

import 'dart:io';
import 'package:compressimage/compressimage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:retailer/database/merchar_imageHelper.dart';
import 'package:retailer/models/image_sqflite_M.dart';
import 'package:retailer/models/merchandizing_M.dart';
import 'package:retailer/screens/public/widget.dart';
import 'package:sqflite/sqflite.dart';
import '../../style/theme.dart' as Style;
import 'package:retailer/utility/utility.dart';
import 'package:retailer/services/functional_provider.dart';
import 'package:provider/provider.dart';

class MerchandizingEdit extends StatefulWidget {
  final TaskList _taskList;
  MerchandizingEdit(this._taskList);
  @override
  _MerchandizingEditState createState() => _MerchandizingEditState();
}

class _MerchandizingEditState extends State<MerchandizingEdit> {
  ImageDbHelper imageDbHelper = ImageDbHelper();
  List<Photo> photoList;
  var pickedByCamera;
  ViewModelFunction model;

  @override
  Widget build(BuildContext context) {
    model = Provider.of<ViewModelFunction>(
      context,
      listen: false,
    );
    if (photoList == null) {
      photoList = List<Photo>();
      getPhotoList();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          widget._taskList.taskCode,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[400], width: 1.2),
              ),
              child: Center(
                child: Text(
                  widget._taskList.taskName,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: getRemark(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
              child: GridView.count(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                children: List.generate(photoList.length + 1, (index) {
                  return Container(
                    child: index + 1 > photoList.length
                        ? InkWell(
                            onTap: () {
                              _settingModalBottomSheet(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey[300],
                              ),
                              child: Center(
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                      fontSize: 74,
                                      fontWeight: FontWeight.w200,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        : Container(
                            child: Stack(
                              fit: StackFit.passthrough,
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => ViewImage(
                                    //               photoList[index],
                                    //             )));
                                  },
                                  child: Container(
                                    child: ClipRRect(
                                      child: Utility.imageFromBase64String(
                                          photoList[index].photo),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    right: 2,
                                    top: 2,
                                    child: InkWell(
                                      onTap: () async {
                                        if (photoList[index].id != null) {
                                          await imageDbHelper
                                              .deletePhoto(photoList[index].id);
                                          setState(() {
                                            photoList.remove(photoList[index]);
                                          });
                                        } else {
                                          setState(() {
                                            photoList.remove(photoList[index]);
                                          });
                                        }
                                      },
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          Icons.close,
                                          size: 18,
                                          color: Style.Colors.mainColor,
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 4),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Style.Colors.mainColor,
          ),
          height: 45,
          child: FlatButton(
            onPressed: () {
              if (photoList.length > 0) {
                savePhoto();
              } else {
                getToast(context, "Please Select Image");
              }
            },
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  savePhoto() {
    loading(context);
    photoList.forEach((element) async {
      if (element.id == null) {
        await imageDbHelper
            .insertPhoto(Photo(element.photo, model.activeShop.shopsyskey));
      } else {
        await imageDbHelper.updatePhoto(Photo.withId(
            element.id, element.photo, model.activeShop.shopsyskey));
      }
    });
    getToast(context, "Save Successful");
    Navigator.pop(context, true);
    Navigator.pop(context, true);
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: ImageIcon(AssetImage('assets/icon/attach.png')),
                    title: Text('Gallery '),
                    onTap: () {
                      Navigator.pop(context, true);
                      getMultipleImage();
                    }),
                ListTile(
                  leading: Icon(Icons.camera_alt_outlined),
                  title: Text('Take Photo'),
                  onTap: () {
                    Navigator.pop(context, true);
                    getImage();
                  },
                ),
              ],
            ),
          );
        });
  }

  getPhotoList() async {
    final Future<Database> db = imageDbHelper.initializedDatabase();
    await db.then((value) {
      var photoListFuture =
          imageDbHelper.getPhotoList(model.activeShop.shopsyskey);
      photoListFuture.then((plist) {
        setState(() {
          this.photoList = plist;
          print(plist);
        });
      });
    });
  }

  Future getMultipleImage() async {
    var result = await FilePicker.getMultiFile(type: FileType.image);
    if (result != null) {
      result.forEach((element) async {
        await CompressImage.compress(
            imageSrc: element.path, desiredQuality: 20);
        setState(() {
          photoList.add(Photo(Utility.base64String(element.readAsBytesSync()),
              model.activeShop.shopsyskey));
        });
      });
    }
  }

  Future getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      File picked = File(pickedFile.path);
      await CompressImage.compress(imageSrc: picked.path, desiredQuality: 20);
      setState(() {
        photoList.add(Photo(Utility.base64String(picked.readAsBytesSync()),
            model.activeShop.shopsyskey));
      });
    }
  }
}

class ViewImage extends StatelessWidget {
  final File _file;
  ViewImage(this._file);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.file(_file),
    );
  }
}

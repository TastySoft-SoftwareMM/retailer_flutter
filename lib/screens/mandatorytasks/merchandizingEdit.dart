import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import '../../style/theme.dart' as Style;

class MerchandizingEdit extends StatefulWidget {
  @override
  _MerchandizingEditState createState() => _MerchandizingEditState();
}

class _MerchandizingEditState extends State<MerchandizingEdit> {
  List<Asset> assetArray = [];
  List<File> fileImageArray = [];

  var pickedByCamera;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'နံပါတ်၃',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[400], width: 1.2),
              ),
              child: Center(
                child: Text(
                  'ပစ္စည်းအလဲများ(သို့)လဲရန်ကိုဓာတ်ပုံရိုက်ပါ',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
            getRemark(),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
              child: GridView.count(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                children: List.generate(fileImageArray.length + 1, (index) {
                  return Container(
                    child: index + 1 > fileImageArray.length
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ViewImage(
                                                  fileImageArray[index],
                                                )));
                                  },
                                  child: Container(
                                    child: ClipRRect(
                                      child: Image.file(
                                        fileImageArray[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    right: 2,
                                    top: 2,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          fileImageArray.remove(
                                            fileImageArray[index],
                                          );
                                        });
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
              print('object');
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

  Widget getRemark() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
      child: Container(
        height: 80,
        child: Card(
          child: TextField(
            maxLines: 8,
            decoration: InputDecoration(
                alignLabelWithHint: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: "Remark :",
                labelStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                    color: Colors.black),
                fillColor: Colors.white,
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(8)),
          ),
        ),
      ),
    );
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
                      loadAssets();
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

  Future getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      File picked = File(pickedFile.path);
      setState(() {
        fileImageArray.add(picked);
      });
    } else {
      print('No image selected.');
    }
  }

  Future<void> loadAssets() async {
    try {
      assetArray = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: false,
        selectedAssets: assetArray,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#FFe53935",
          actionBarTitle: "Select images",
          allViewTitle: "All Photo",
          useDetailsView: false,
          selectCircleStrokeColor: "#FFe53935",
          statusBarColor: "#FFe53935",
        ),
      );
    } on Exception catch (e) {
      print(e.toString());
    }

    assetArray.forEach((imageAsset) async {
      final filePath =
          await FlutterAbsolutePath.getAbsolutePath(imageAsset.identifier);
      File tempFile = File(filePath);
      if (tempFile.existsSync()) {
        setState(() {
          fileImageArray.add(tempFile);
        });
      }
    });
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

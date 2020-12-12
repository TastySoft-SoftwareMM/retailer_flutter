import 'dart:io';
import 'package:compressimage/compressimage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:retailer/models/merchandizing_M.dart';
import 'package:retailer/screens/public/widget.dart';
import '../../style/theme.dart' as Style;

class MerchandizingEdit extends StatefulWidget {
  final TaskList _taskList;
  MerchandizingEdit(this._taskList);
  @override
  _MerchandizingEditState createState() => _MerchandizingEditState();
}

class _MerchandizingEditState extends State<MerchandizingEdit> {
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

  Future getMultipleImage() async {
    var result = await FilePicker.getMultiFile(
      type: FileType.image,
    );
    if (result != null) {
      result.forEach((element) async {
        await CompressImage.compress(
            imageSrc: element.path, desiredQuality: 80);
        setState(() {
          fileImageArray.add(element);
        });
      });
    }
  }

  Future getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      File picked = File(pickedFile.path);
      await CompressImage.compress(imageSrc: picked.path, desiredQuality: 80);
      setState(() {
        fileImageArray.add(picked);
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

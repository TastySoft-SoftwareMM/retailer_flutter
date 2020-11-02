import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../style/theme.dart' as Style;

class MerchandizingEdit extends StatefulWidget {
  @override
  _MerchandizingEditState createState() => _MerchandizingEditState();
}

class _MerchandizingEditState extends State<MerchandizingEdit> {
  List<File> _imageList = [];

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
                children: List.generate(_imageList.length + 1, (index) {
                  return Container(
                    child: index + 1 > _imageList.length
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
                        : InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewImage(
                                            _imageList[index],
                                          )));
                            },
                            child: Container(
                              child: ClipRRect(
                                child: Image.file(
                                  _imageList[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
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
        height: 60,
        child: Card(
          child: TextField(
            maxLines: 4,
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
                      getImage(ImageSource.gallery);
                    }),
                ListTile(
                  leading: Icon(Icons.camera_alt_outlined),
                  title: Text('Take Photo'),
                  onTap: () {
                    Navigator.pop(context, true);
                    getImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          );
        });
  }

  Future getImage(ImageSource imageSource) async {
    final picker = ImagePicker();

    final pickedFile = await picker.getImage(source: imageSource);
    setState(() {
      if (pickedFile != null) {
        _imageList.add(File(pickedFile.path));
      } else {
        print('No image selected.');
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

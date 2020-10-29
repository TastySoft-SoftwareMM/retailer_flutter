import 'package:flutter/material.dart';

class teamWidget extends StatefulWidget {
  @override
  _teamWidgetState createState() => _teamWidgetState();
}

class _teamWidgetState extends State<teamWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            child: ExpansionTile(
                leading: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 44,
                    minHeight: 44,
                    maxWidth: 44,
                    maxHeight: 44,
                  ),
                  child: Image.asset('assets/notfound.png', fit: BoxFit.cover),
                ),
                title: Text('Hla Hla Myo',),
                backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
                children: <Widget>[
                  ListTile(
                    leading: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 44,
                        minHeight: 44,
                        maxWidth: 44,
                        maxHeight: 44,
                      ),
                      child: Image.asset('assets/notfound.png', fit: BoxFit.cover),
                    ),
                    title: Text(
                      'Thit San(26 &nKannar)(သစ်ဆန်း(26 & Kannar))',
                    ),
                    subtitle: Text('0961959035320'),
                  ),
                  Divider(
                    height: 1,
                  ),
                  ListTile(
                    leading: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 44,
                        minHeight: 44,
                        maxWidth: 44,
                        maxHeight: 44,
                      ),
                      child: Image.asset('assets/notfound.png', fit: BoxFit.cover),
                    ),
                    title: Text(
                      'Shwe Pin Kyi(ရွှေပင်ကြီး)',
                    ),
                    subtitle: Text('575086235969'),
                  ),
                  Divider(
                    height: 1,
                  ),
                  ListTile(
                    leading: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 44,
                        minHeight: 44,
                        maxWidth: 44,
                        maxHeight: 44,
                      ),
                      child: Image.asset('assets/notfound.png', fit: BoxFit.cover),
                    ),
                    title: Text(
                      'Toe Pwa Sae(တိုးပွား)',
                    ),
                    subtitle: Text('473789081427'),
                  ),
                  Divider(
                    height: 1,
                  ),
                  ListTile(
                    leading: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 44,
                        minHeight: 44,
                        maxWidth: 44,
                        maxHeight: 44,
                      ),
                      child: Image.asset('assets/notfound.png', fit: BoxFit.cover),
                    ),
                    title: Text(
                      'Thit Sar(သစ္စာ)',
                    ),
                    subtitle: Text('791820762761'),
                  ),
                  Divider(
                    height: 1,
                  ),
                ]
            ),
          ),

          Container(
            child: ExpansionTile(
                leading: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 44,
                    minHeight: 44,
                    maxWidth: 44,
                    maxHeight: 44,
                  ),
                  child: Image.asset('assets/notfound.png', fit: BoxFit.cover),
                ),
                title: Text('Ye Hlaing Htun'),
                backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
                children: <Widget>[
                  ListTile(
                    leading: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 44,
                        minHeight: 44,
                        maxWidth: 44,
                        maxHeight: 44,
                      ),
                      child: Image.asset('assets/notfound.png', fit: BoxFit.cover),
                    ),
                    title: Text(
                      'Ze Wa Ka (Jivaka)(ဇီဝက)',
                    ),
                    subtitle: Text('143821208522'),
                  ),
                  Divider(
                    height: 1,
                  ),
                  ListTile(
                    leading: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 44,
                        minHeight: 44,
                        maxWidth: 44,
                        maxHeight: 44,
                      ),
                      child: Image.asset('assets/notfound.png', fit: BoxFit.cover),
                    ),
                    title: Text(
                      'Yuzana(ယုဇန)',
                    ),
                    subtitle: Text('112563243090'),
                  ),
                  Divider(
                    height: 1,
                  ),
                ]
            ),
          ),

          Container(
            child: ExpansionTile(
                leading: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 44,
                    minHeight: 44,
                    maxWidth: 44,
                    maxHeight: 44,
                  ),
                  child: Image.asset('assets/notfound.png', fit: BoxFit.cover),
                ),
                title: Text('Thwe Thwe Aung'),
                backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
                children: <Widget>[
                  ListTile(
                    leading: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 44,
                        minHeight: 44,
                        maxWidth: 44,
                        maxHeight: 44,
                      ),
                      child: Image.asset('assets/notfound.png', fit: BoxFit.cover),
                    ),
                    title: Text(
                      'Shwe Tha Pyae(ရွှေသပြေ)',
                    ),
                    subtitle: Text('442930250714'),
                  ),
                  Divider(
                    height: 1,
                  ),
                  ListTile(
                    leading: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 44,
                        minHeight: 44,
                        maxWidth: 44,
                        maxHeight: 44,
                      ),
                      child: Image.asset('assets/notfound.png', fit: BoxFit.cover),
                    ),
                    title: Text(
                      'Yandanar Moe(ရတနာမိုး)',
                    ),
                    subtitle: Text('142143390966'),
                  ),
                  Divider(
                    height: 1,
                  ),
                  ListTile(
                    leading: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 44,
                        minHeight: 44,
                        maxWidth: 44,
                        maxHeight: 44,
                      ),
                      child: Image.asset('assets/notfound.png', fit: BoxFit.cover),
                    ),
                    title: Text(
                      'Thi Kyar Min(သိကြားမင်း)',
                    ),
                    subtitle: Text('102182931942'),
                  ),
                  Divider(
                    height: 1,
                  ),
                  ListTile(
                    leading: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 44,
                        minHeight: 44,
                        maxWidth: 44,
                        maxHeight: 44,
                      ),
                      child: Image.asset('assets/notfound.png', fit: BoxFit.cover),
                    ),
                    title: Text(
                      'U Ba Than+Daw Tin Tin Hla(Grocery Store)(ဦးဘသန်း+ဒေါ်တင်တင်လှ‌)',
                    ),
                    subtitle: Text('859434592782'),
                  ),
                  Divider(
                    height: 1,
                  ),
                ]
            ),
          ),

          Container(
            child: ExpansionTile(
                leading: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 44,
                    minHeight: 44,
                    maxWidth: 44,
                    maxHeight: 44,
                  ),
                  child: Image.asset('assets/notfound.png', fit: BoxFit.cover),
                ),
                title: Text('kmz sale'),
                backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
                children: <Widget>[
                  ListTile(
                    leading: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 44,
                        minHeight: 44,
                        maxWidth: 44,
                        maxHeight: 44,
                      ),
                      child: Image.asset('assets/notfound.png', fit: BoxFit.cover),
                    ),
                    title: Text(
                      'Zar Chi(AMTZ)(ဇာခြည်)',
                    ),
                    subtitle: Text('4363973570796'),
                  ),
                  Divider(
                    height: 1,
                  ),
                ]
            ),
          ),
          Container(
            child: ExpansionTile(
                leading: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 44,
                    minHeight: 44,
                    maxWidth: 44,
                    maxHeight: 44,
                  ),
                  child: Image.asset('assets/notfound.png', fit: BoxFit.cover),
                ),
                title: Text('Lwin De'),
                backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
                children: <Widget>[
                  ListTile(
                    leading: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 44,
                        minHeight: 44,
                        maxWidth: 44,
                        maxHeight: 44,
                      ),
                      child: Image.asset('assets/notfound.png', fit: BoxFit.cover),
                    ),
                    title: Text(
                      'Za Bu Htun(ဇဗ္ဗူထွန်း)',
                    ),
                    subtitle: Text('5955110306805'),
                  ),
                  Divider(
                    height: 1,
                  ),
                ]
              ),
            ),
          ],
        ),
      );
    }
  }

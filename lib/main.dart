import 'package:all_languages_translator/pojo/MyDataModel.dart';
import 'package:all_languages_translator/screens/bookmarks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:translator/translator.dart';
import 'package:nice_button/nice_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'database/databasehelper.dart';

void main() {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String outPutTranslate = 'out put';
  String dropdownValueInput = 'Hindi';
  String dropdownValueOutput = 'Hindi';

  String inputLangCode = 'en';
  String outPutLangCode = 'hi';
  List<String> languageList = List();

  List<MyDataModel> translatedList = new List();

  Map<String, String> mapLngCode = {
    'English': 'en',
    'Hindi': 'hi',
    'French': 'fr',
    'Arabic': 'ar',
    'Yiddish': 'yi',
    'Indonesian': 'id',
    'Welsh': 'cy',
    'Icelandic': 'is',
    'Vietnamese': 'vi',
    'Hungarian': 'hu',
    'Urdu': 'ur',
    'Ukrainian': 'uk',
    'Hebrew': 'iw',
    'Turkish	': 'tr',
    'Haitian Creole': 'ht',
    'Thai': 'th',
    'Gujarati': 'gu',
    'Telugu': 'te',
    'Greek': 'el',
    'Tamil': 'ta',
    'German': 'de',
    'Swedish': 'sv',
    'Georgian': 'ka',
    'Swahili': 'sw',
    'Galician': 'gl',
    'Spanish': 'es',
    'Slovenian': 'sl',
    'Finnish': 'fi',
    'Slovak': 'sk',
    'Filipino': 'tl',
    'Serbian': 'sr',
    'Estonian	': 'et',
    'Russian': 'ru',
    'Esperanto': 'eo',
    'Romanian': 'ro',
    'Portuguese': 'pt',
    'Dutch': 'nl',
    'Polish': 'pl',
    'Danish': 'da',
    'Persian': 'fa',
    'Czech': 'cs',
    'Norwegian': 'no',
    'Croatian': 'hr',
    'Maltese': 'mt',
    'Chinese Traditional': 'zh-TW',
    'Malay': 'ms',
    'Chinese Simplified': 'zh-CN',
    'Macedonian': 'mk',
    'Catalan': 'ca',
    'Lithuanian': 'lt',
    'Latvian': 'lv',
    'Belarusian': 'be',
    'Latin': 'la',
    'Bengali': 'bn',
    'Korean': 'ko',
    'Basque': 'eu',
    'Kannada': 'kn',
    'Azerbaijani': 'az',
    'Japanese': 'ja',
    'Italian': 'it',
    'Albanian': 'sq',
    'Irish': 'ga',
    'Afrikaans': 'af'
  };

  GoogleTranslator translator =
      new GoogleTranslator(); //using google translator
  String out;
  final lang = TextEditingController(); //getting text

  void trans() {
    translator.translate(lang.text, to: outPutLangCode).then((output) {
      setState(() {
        out = output.toString() ; //placing the translated text to the String to be used
        print(output.toString());
        Navigator.pop(context);
      });
      translatedList.add(new MyDataModel(lang.text, out));


      print(out);
    });
  }

  void setOutPutCode(String code) {
    setState(() {
      outPutLangCode = code;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    languageList.add('Hindi');
    languageList.add('English');

    languageList.add('French');
    languageList.add('Arabic');
    languageList.add('Afrikaans');
    languageList.add('Irish');
    languageList.add('Albanian');
    languageList.add('Italian');
    languageList.add('Japanese');
    languageList.add('Azerbaijani');
    languageList.add('Kannada');
    languageList.add('Basque');
    languageList.add('Korean');
    languageList.add('Bengali');
    languageList.add('Latin');
    languageList.add('Belarusian');
    languageList.add('Latvian');
    languageList.add('Bulgarian');
    languageList.add('Lithuanian');
    languageList.add('Catalan');
    languageList.add('Macedonian');
    languageList.add('Chinese Simplified');
    languageList.add('Malay');
    languageList.add('Chinese Traditional');
    languageList.add('Maltese');
    languageList.add('Croatian');
    languageList.add('Norwegian');
    languageList.add('Czech');
    languageList.add('Persian');
    languageList.add('Danish');
    languageList.add('Polish');
    languageList.add('Dutch');
    languageList.add('Portuguese');
    languageList.add('Romanian');
    languageList.add('Esperanto');
    languageList.add('Russian');

    languageList.add('Estonian');
    languageList.add('Serbian');
    languageList.add('Filipino');
    languageList.add('Slovak');
    languageList.add('Finnish');
    languageList.add('Slovenian');
    languageList.add('Spanish');
    languageList.add('Galician');
    languageList.add('Swahili');
    languageList.add('Georgian');
    languageList.add('Swedish');
    languageList.add('German');
    languageList.add('Tamil');
    languageList.add('Greek');
    languageList.add('Telugu');
    languageList.add('Gujarati');
    languageList.add('Thai');
    languageList.add('Haitian Creole');
    languageList.add('Turkish');
    languageList.add('Hebrew');
    languageList.add('Ukrainian');
    languageList.add('Urdu');
    languageList.add('Hungarian');
    languageList.add('Vietnamese');
    languageList.add('Icelandic');
    languageList.add('Welsh');
    languageList.add('Indonesian');
    languageList.add('Yiddish');
    // translatedList.add('translatedList');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.bookmark,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyBookmarkList()));
                })
          ],
        ),
        body: new Container(
            height: MediaQuery.of(context).size.height, child: _body()));
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                  child: TextField(
                    controller: lang,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        hintText: 'Enter input',
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 40.0, horizontal: 10.0)),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.61,
              child: ListView.builder(
                  itemCount: translatedList.length,
                  itemBuilder: (context, index) {
                    return new GestureDetector(
                      child: Card(
                        margin: EdgeInsets.all(5),
                        elevation: 4,
                        shadowColor: Colors.blue,
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topLeft,
                              child: Column(
                                children: <Widget>[
                                  new Container(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        translatedList.reversed
                                            .toList()[index]
                                            .input.toString(),
                                        style: new TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0),
                                      ),
                                    ),
                                  ),
                                  new Divider(),
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              translatedList.reversed
                                                  .toList()[index]
                                                  .output.toString(),
                                              textAlign: TextAlign.left,
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        openAlertBox(index);
                      },
                    );
                  }),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Align(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Column(
                          children: <Widget>[
                            Align(
                              child: Container(
                                margin: EdgeInsets.only(left: 0),
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.green,
                                        style: BorderStyle.solid,
                                        width: 0.40),
                                    borderRadius: BorderRadius.circular(10)),
                                child: DropdownButton(
                                  underline: SizedBox(),
                                  style: TextStyle(color: Colors.green),
                                  dropdownColor: Colors.white,
                                  hint: Text('please'),
                                  value: dropdownValueOutput,
                                  onChanged: (newValue) {
                                    setState(() {
                                      dropdownValueOutput = newValue;
                                      outPutTranslate =
                                          mapLngCode[dropdownValueOutput];
                                      setOutPutCode(mapLngCode[newValue]);
                                      print(outPutTranslate.toString() + 'output');
                                    });
                                  },
                                  items: languageList
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Container(
                      child: NiceButton(
                        width: 128,
                        elevation: 5.0,
                        radius: 20.0,
                        text: "Translate",
                        background: Colors.green,
                        onPressed: () {
                          showAlertDialog(context);
                          trans();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  openAlertBox(int index) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              height: 200.0,
              width: 150.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      FlatButton(
                        color: Colors.green,
                        onPressed: () {
                          setState(() {
                            translatedList.removeAt(index);
                            Navigator.pop(context);
                            Fluttertoast.showToast(
                                msg: "Item Deleted",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          });
                        },
                        child: Text(
                          'Delete',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      new Divider(),
                      new FlatButton(
                          color: Colors.green,
                          onPressed: () {
                            MyDataModel myDataModel =
                                new MyDataModel(lang.text, out);
                            saveData(myDataModel);

                            Fluttertoast.showToast(
                                msg: "Item Bookmarked",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Bookmarks',
                            style: TextStyle(color: Colors.white),
                          )),
                      new Divider(),
                      new FlatButton(
                        color: Colors.green,
                        onPressed: () {
                          Fluttertoast.showToast(msg: 'text copied',toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.BOTTOM);
                          Clipboard.setData(new ClipboardData(text: out.toString()));
                          Navigator.pop(context);

                        },
                        child: Text('Copy'),
                        textColor: Colors.white,
                      ),
                      Divider()
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future saveData(MyDataModel myDataModel) async {
    var db = DatabaseHelper();
    await db.saveUser(myDataModel);
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 5), child: Text("Loading")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

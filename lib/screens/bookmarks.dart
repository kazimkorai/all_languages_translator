import 'package:all_languages_translator/database/databasehelper.dart';
import 'package:all_languages_translator/pojo/MyDataModel.dart';
import 'package:flutter/material.dart';


class MyBookmarkList extends StatefulWidget {
  @override
  MyBookmarkListPageState createState() => new MyBookmarkListPageState();
}

class MyBookmarkListPageState extends State<MyBookmarkList> {
  Future<List<MyDataModel>> fetchEmployeesFromDatabase() async {
    var dbHelper = DatabaseHelper();
    Future<List<MyDataModel>> bookMarkData = dbHelper.getAllBookmarks();

    return bookMarkData;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('BookMarked List'),
      ),
      body: FutureBuilder(
        builder: (context, projectSnap) {
          if (projectSnap.connectionState == ConnectionState.none &&
              projectSnap.hasData == null) {
            //print('project snapshot data is: ${projectSnap.data}');
            return Container();
          }
          return ListView.builder(
            itemCount: projectSnap.data.length,
            itemBuilder: (context, index) {
              MyDataModel project = projectSnap.data[index];
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
                                  project.input.toString(),
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
                                        project.output.toString(),
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

                  openAlertBox(project);

                },
              );

              // Widget to display the list of project
            },
          );
        },
        future: fetchEmployeesFromDatabase(),
      ),
    );
  }

  openAlertBox(MyDataModel myDataModel) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Confirmation'),
            content: Text('Do you want to Delete?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .pop(false); // dismisses only the dialog and returns false
                },
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    delete(myDataModel);
                  });

                  Navigator.of(context, rootNavigator: true)
                      .pop(true); // dismisses only the dialog and returns true
                },
                child: Text('Yes'),
              ),
            ],
          );;
        });
  }

  Future delete(MyDataModel dataModel) async {
    var db = DatabaseHelper();
    int kk = await db.deleteUsers(dataModel);
  }
}

import 'package:flutter/material.dart';
import 'kids.dart';
import 'kidsBloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final KidsBloc _kidsBloc = KidsBloc();
  @override
  void dispose() {
    _kidsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'Student Presidental Candidates',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              onPressed: null)
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: StreamBuilder<List<Kids>>(
            stream: _kidsBloc.kidsListStream,
            builder:
                (BuildContext context, AsyncSnapshot<List<Kids>> snapshot) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://www.colourbox.com/preview/5230030-handsome-male-student-in-a-library.jpg'),
                                  fit: BoxFit.cover,
                                ),
                                border: Border.all(
                                    color: Colors.black, width: 2.0)),
                          ),
                          Container(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text("${snapshot.data[index].name}"),
                                    Text(",${snapshot.data[index].section}"),
                                  ],
                                ),
                                Text("Votes: ${snapshot.data[index].stars}%"),
                              ],
                            ),
                          ),
                          Container(
                            child: IconButton(
                                icon: Icon(
                                  Icons.thumb_up,
                                  color: Colors.green,
                                ),
                                onPressed: () {
                                  _kidsBloc.kidsStarIncrement
                                      .add(snapshot.data[index]);
                                }),
                          ),
                          Container(
                            child: IconButton(
                                icon: Icon(
                                  Icons.thumb_down,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  _kidsBloc.kidsStarsDecrement
                                      .add(snapshot.data[index]);
                                }),
                          )
                        ],
                      ),
                    );
                  });
            }),
      ),
    );
  }
}

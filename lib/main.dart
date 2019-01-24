import 'package:flutter/material.dart';
import 'lists.dart';
import 'dart:io';

class Todo {
  final String title;
  final String description;
  final String subtitle;

  Todo(this.title, this.description, this.subtitle);
}

void main() {
  runApp(MaterialApp(
    title: 'Todos',
    home: TodosScreen(
      todos: List.generate(
        10,
        (i) => Todo(lists[i], nicks[i], subtitles[i]),
      ),
    ),
  ));
}

class TodosScreen extends StatelessWidget {
  final List<Todo> todos;
  TodosScreen({Key key, @required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text("መተግበሪያ"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {Navigator.push(context, MaterialPageRoute(
              builder: (context) => SearchScreen()
            ));
            }
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.device_hub, size: 30,),
              title: Text(todos[index].title,),
              isThreeLine: true,
              subtitle: Text(subtitles[index]),
              contentPadding: EdgeInsets.only(left: 56.0),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(todo: todos[index]),
                    ));
              },
            );
          }),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0.0),
          children: <Widget>[
            DrawerHeader(
              child: ListView(
                children: [
                  Image.asset(
                    "images/ic_launcher.png",
                    alignment: Alignment.centerLeft,
                    width: 70.0,
                    height: 70.0,
                    fit: BoxFit.none,
                  ),
                  Text(
                    "Drawer Header",
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  Text(""),
                  Text(
                    "some description ...",
                  )
                ],
              ),
              // child: Text(
              //   "Drawer Header",
              //   textAlign: TextAlign.center,

              // ),
              decoration: BoxDecoration(
                color: Colors.black54,
              ),
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text("አጋራ"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.update),
              title: Text("አሳድግ"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateScreen(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("ማስተካከያ"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingScreen(),
                    ));
              },
            ),
            Center(
              child: Text(
                "________________________________________",
                style: TextStyle(
                    // fontSize: 25.0,
                    // fontWeight: FontWeight.w100,
                    color: Colors.green),
              ),
            ),
            Center(
              child: Text(
                "__________________________________",
                style: TextStyle(
                    // fontSize: 25.0,
                    // fontWeight: FontWeight.w100,
                    color: Colors.yellow),
              ),
            ),
            Center(
              child: Text(
                "____________________________",
                style: TextStyle(
                    // fontSize: 25.0,
                    // fontWeight: FontWeight.w100,
                    color: Colors.red),
              ),
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text("ስለ አበልፃጊዎች"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutScreen(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.warning),
              title: Text("ዘግተህ ውጣ"),
              onTap: () {
                exit(0);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Todo todo;
  DetailScreen({Key key, @required this.todo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text("${todo.title}"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        
        children: <Widget>[
          Text(
            '${todo.description}',
            textAlign: TextAlign.center,
          ),
          IconButton(
            icon: Icon(Icons.volume_up),
            iconSize: 50.0,
            onPressed: test(),
          ),
        ],
      ),
    );
  }

  test(){
    print("test");
  }
}

class UpdateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text("Update"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("This is the update page"),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.black45,
        title: Text("About"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("This is the about page"),
      ),
    );
  }
}
class SearchScreen extends StatefulWidget {
  @override
  _SearchList createState() => new _SearchList();
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Colors.black45,
  //       title: Text("Search"),
  //       actions: <Widget>[ 
                          
  //         IconButton(
  //           icon: Icon(Icons.backspace),
  //           color: Colors.white,
  //           onPressed: null,
  //         ),
  //       ],
  //     ),
  //     body: Padding(
  //       padding: EdgeInsets.all(16.0),
  //       child: Text("This is the search page"),
  //     ),
  //   );
  // }
}

class _SearchList extends State<SearchScreen>{

  int _counter = 0;
  void _increment(){
    setState(() {
          _counter++;
        });
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Search"),
          backgroundColor: Colors.black45,
        ),
        body: Row(
          children: <Widget>[
            TextField(
              controller: null,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search ..",
                hintStyle: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
            Text('$_counter'),
          ],
          
        ),
      );
    }

}

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text("Setting"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("This is the setting page"),
      ),
    );
  }
}

class MyPopup extends StatefulWidget {
  @override
  _MyPopup createState() => _MyPopup();
}

class _MyPopup extends State<MyPopup> {
  Choice _selectedChoice = choices[0]; // The app's "state".

  void _select(Choice choice) {
    setState(() {
      // Causes the app to rebuild with the new _selectedChoice.
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Basic AppBar'),
          actions: <Widget>[
            IconButton(
              // action button
              icon: Icon(choices[0].icon),
              onPressed: () {
                _select(choices[0]);
              },
            ),
            IconButton(
              // action button
              icon: Icon(choices[1].icon),
              onPressed: () {
                _select(choices[1]);
              },
            ),
            PopupMenuButton<Choice>(
              // overflow menu
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices
                    .skip(2)
                    .map<PopupMenuItem<Choice>>((Choice choice) {
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: Text(choice.title),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ChoiceCard(choice: _selectedChoice),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Car', icon: Icons.directions_car),
  Choice(title: 'Bicycle', icon: Icons.directions_bike),
  Choice(title: 'Boat', icon: Icons.directions_boat),
  Choice(title: 'Bus', icon: Icons.directions_bus),
  Choice(title: 'Train', icon: Icons.directions_railway),
  Choice(title: 'Walk', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}

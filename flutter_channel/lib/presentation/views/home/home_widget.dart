import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  final String title = 'HomeWidget';

  const HomeWidget({Key? key}) : super(key: key);

  @override
  HomeWidgetState createState() => HomeWidgetState();
}

List<Map<String, dynamic>> menuItems = [
  {
    "title": "Method Channel",
    "subtitle": "Framework",
    "icon": Icons.flag,
    "route": "/method_channel",
  },
  {
    "title": "Method Channel com Parâmetros",
    "subtitle": "Framework",
    "icon": Icons.flag,
    "route": "/method_channel_parameter",
  },
  {
    "title": "Event Channel",
    "subtitle": "Framework",
    "icon": Icons.flag,
    "route": "/event_channel",
  },
  {
    "title": "Basic Message Channel",
    "subtitle": "Framework",
    "icon": Icons.flag,
    "route": "/basic_message_channel",
  },
];

class HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        elevation: 0, // Remover sombra do AppBar
      ),
      body: ListView.separated(
        itemCount: menuItems.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return InkWell(
            onTap: () {},
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                vertical: 0,
              ),
              dense: true,
              title: Text(
                menuItems[index]["title"],
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                menuItems[index]["subtitle"],
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                ),
              ),
              leading: Icon(menuItems[index]["icon"]),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  menuItems[index]["route"],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

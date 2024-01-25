import 'package:flutter/material.dart';
import '../views/home/home_widget.dart';

class ApplicationWidget extends StatefulWidget {
  final String title = 'ApplicationWidget';

  const ApplicationWidget({Key? key}) : super(key: key);

  @override
  ApplicationWidgetState createState() => ApplicationWidgetState();
}

class ApplicationWidgetState extends State<ApplicationWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeWidget(),
    );
  }
}

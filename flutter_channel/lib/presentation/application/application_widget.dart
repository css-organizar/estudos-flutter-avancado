import 'package:flutter/material.dart';
import 'package:flutter_channel/presentation/views/basic_message_channel/basic_message_channel_view.dart';
import 'package:flutter_channel/presentation/views/event_channel/event_channel_view.dart';
import 'package:flutter_channel/presentation/views/method_channel/method_channel_parameter_view.dart';
import 'package:flutter_channel/presentation/views/method_channel/method_channel_view.dart';
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
      title: 'Flutter Exemplo de Utilização do Method Channel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: {
        '/': (context) => HomeWidget(),
        '/method_channel': (context) => MethodChannelWidget(),
        '/method_channel_parameter': (context) => MethodChannelParameterWidget(),
        '/event_channel': (context) => EventChannelWidget(),
        '/basic_message_channel': (context) => BasicMessageChannelWidget(),
      },
      initialRoute: '/',
    );
  }
}

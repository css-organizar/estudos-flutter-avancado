import 'package:flutter/material.dart';
import 'package:flutter_channel/presentation/views/basic_message_channel/basic_message_channel_view.dart';
import 'package:flutter_channel/presentation/views/method_channel/method_channel_parameter_view.dart';
import 'package:flutter_channel/presentation/views/method_channel/method_channel_view.dart';

import '../event_channel/event_channel_view.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  HomeWidgetState createState() => HomeWidgetState();
}

class HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Channel'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MethodChannelWidget()),
                    );
                  },
                  child: const Text('Method Channel'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MethodChannelParameterWidget()),
                    );
                  },
                  child: const Text('Method Channel with param'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EventChannelWidget()),
                    );
                  },
                  child: const Text('Event Channel'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BasicMessageChannelWidget()),
                    );
                  },
                  child: const Text('Basic Message Channel'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

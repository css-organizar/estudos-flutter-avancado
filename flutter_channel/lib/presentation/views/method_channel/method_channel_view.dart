import 'package:flutter/material.dart';

import '../../../infrastructure/services/channels/exempo_method_channel_service.dart'; // import for method channel

class MethodChannelWidget extends StatefulWidget {
  const MethodChannelWidget({super.key});

  @override
  MethodChannelWidgetState createState() => MethodChannelWidgetState();
}

class MethodChannelWidgetState extends State<MethodChannelWidget> {
  var exemploMethodChannelService = ExemploMethodChannelService();
  late String _result = '';
  late String nameRequest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Method Channel'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Method Chaneel Result:',
                ),
                Text(
                  _result,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: () async {
                    _result = await exemploMethodChannelService.callSimpleMethodChannel();
                    setState(() {});
                  },
                  child: const Text('Call Method Channel'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

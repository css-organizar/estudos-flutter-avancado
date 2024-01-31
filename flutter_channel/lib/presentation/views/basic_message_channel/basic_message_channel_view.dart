import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../infrastructure/services/channels/exemplo_basic_message_channel_service.dart';

class BasicMessageChannelWidget extends StatefulWidget {
  BasicMessageChannelWidget({super.key});

  @override
  State<BasicMessageChannelWidget> createState() => _BasicMessageChannelWidgetState();
}

class _BasicMessageChannelWidgetState extends State<BasicMessageChannelWidget> {
  Future<Uint8List>? imageData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Channel Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FractionallySizedBox(
                widthFactor: 1,
                heightFactor: 0.6,
                child: FutureBuilder<Uint8List>(
                  future: imageData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.none) {
                      return Padding(
                        padding: EdgeInsets.all(20),
                        child: Placeholder(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          (snapshot.error as PlatformException).message!,
                        ),
                      );
                    } else if (snapshot.connectionState == ConnectionState.done) {
                      return Padding(
                        padding: EdgeInsets.all(20),
                        child: Image.memory(
                          snapshot.data!,
                          fit: BoxFit.fill,
                        ),
                      );
                    }
                    return Padding(
                      padding: EdgeInsets.all(90),
                      child: Column(
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Loading Image...',
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      imageData = ExemploBasicMessageChannelService.getImage();
                    });
                  },
                  child: Text('Get Image'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

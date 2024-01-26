import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../infrastructure/services/channels/exemplo_basic_message_channel_service.dart';

class BasicMessageChannelWidget extends StatefulWidget {
  const BasicMessageChannelWidget({super.key});

  @override
  State<BasicMessageChannelWidget> createState() => _BasicMessageChannelWidgetState();
}

class _BasicMessageChannelWidgetState extends State<BasicMessageChannelWidget> {
  Future<Uint8List>? imageData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Channel Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: FractionallySizedBox(
                widthFactor: 1,
                heightFactor: 0.6,
                child: FutureBuilder<Uint8List>(
                  future: imageData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.none) {
                      return const Placeholder();
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          (snapshot.error as PlatformException).message!,
                        ),
                      );
                    } else if (snapshot.connectionState == ConnectionState.done) {
                      return Image.memory(
                        snapshot.data!,
                        fit: BoxFit.fill,
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            FilledButton(
              onPressed: imageData != null
                  ? null
                  : () {
                      setState(() {
                        imageData = ExemploBasicMessageChannelService.getImage();
                      });
                    },
              child: const Text('Get Image'),
            )
          ],
        ),
      ),
    );
  }
}

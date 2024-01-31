import 'dart:async';

import 'package:flutter/material.dart';

import '../../../infrastructure/services/channels/exempo_event_channel_service.dart';

class EventChannelWidget extends StatefulWidget {
  const EventChannelWidget({Key? key}) : super(key: key);

  @override
  EventChannelWidgetState createState() => EventChannelWidgetState();
}

class EventChannelWidgetState extends State<EventChannelWidget> {
  var exemploEventChannelService = ExemploEventChannelService();
  final TextEditingController _controller = TextEditingController(text: 'Nome do Evento');

  late StreamSubscription<dynamic> streamSubscription;
  String eventData = '';

  @override
  void initState() {
    super.initState();

    // Inscrevo o stream
    streamSubscription = exemploEventChannelService.receiveBroadcastStream().listen((event) {
      setState(() {
        eventData = event;
      });
    });
  }

  @override
  void dispose() {
    // Cancelo a inscrição do stream
    streamSubscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Channel'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: 300,
                child: TextFormField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: '',
                    isDense: true,
                    label: Text('Parâmetro (Nome do Evento)'),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            const Text(
              'Resultado enviado pelo channel:',
            ),
            Text(eventData),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: () async {
                    await exemploEventChannelService.alterarEvento();
                    setState(() {});
                  },
                  child: const Text('Alterar Tipo do Evento'),
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
                    await exemploEventChannelService.alterarEventoNome(
                      nomeEvento: _controller.text,
                    );
                    setState(() {});
                  },
                  child: const Text('Alterar TIpo e Nome do Evento'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

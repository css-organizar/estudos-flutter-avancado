import 'package:flutter/material.dart';

import '../../../infrastructure/services/channels/exempo_method_channel_service.dart'; // import for method channel

class MethodChannelParameterWidget extends StatefulWidget {
  const MethodChannelParameterWidget({super.key});

  @override
  MethodChannelParameterWidgetState createState() => MethodChannelParameterWidgetState();
}

class MethodChannelParameterWidgetState extends State<MethodChannelParameterWidget> {
  var exemploMethodChannelService = ExemploMethodChannelService();

  String _result = '';
  final TextEditingController _controller = TextEditingController(text: 'Visitante');
  late String nameRequest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Method Channel com Parâmetros'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
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
                        label: Text('Parâmetro'),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () async {
                      _result = await exemploMethodChannelService.callSimpleMethodChannelWithParams(_controller.text);
                      setState(() {});
                    },
                    child: const Text('Chamada ao Channel com Parâmetro'),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Resultado da Requisição:',
                      ),
                      Text(
                        _result,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/services.dart';

class ExemploEventChannelService {
  late EventChannel _eventStream;
  late MethodChannel _platformChannel;

  ExemploEventChannelService() {
    _eventStream = const EventChannel('br.com.claudneysessa/ExemploEventChannelEvents');
    _platformChannel = const MethodChannel('br.com.claudneysessa/ExemploEventChannelMethos');
  }

  Stream<dynamic> receiveBroadcastStream() {
    return _eventStream.receiveBroadcastStream();
  }

  Future<void> alterarEvento() async {
    _platformChannel.invokeMethod('alterarEvento');
  }

  Future<void> alterarEventoNome({
    String nomeEvento = '',
  }) async {
    _platformChannel.invokeMethod(
      'alterarEventoNome',
      {
        'args': {
          'nomeEvento': nomeEvento,
        }
      },
    );
  }
}

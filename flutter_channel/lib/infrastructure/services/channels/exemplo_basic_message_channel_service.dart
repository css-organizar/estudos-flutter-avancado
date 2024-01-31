import 'package:flutter/services.dart';

class ExemploBasicMessageChannelService {
  static const _basicMessageChannel = BasicMessageChannel<dynamic>(
    'br.com.claudneysessa/ExemploBasicMessageChannel',
    StandardMessageCodec(),
  );

  static Future<Uint8List> getImage() async {
    final reply = await _basicMessageChannel.send(
      {
        'funcaoNome': 'obterImagemAndroidAssets',
        'funcaoParametro': 'flutter2.jpg',
      },
    ) as Uint8List?;

    if (reply == null) {
      throw PlatformException(
        code: 'Error',
        message: 'Falha ao buscar imagem no Android',
        details: null,
      );
    }

    return reply;
  }
}

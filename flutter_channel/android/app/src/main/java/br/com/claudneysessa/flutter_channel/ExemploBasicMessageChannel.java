package br.com.claudneysessa.flutter_channel;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import androidx.annotation.NonNull;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.EventChannel.EventSink;
import io.flutter.plugin.common.EventChannel.StreamHandler;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.StandardMessageCodec;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

public class ExemploBasicMessageChannel {

  private static final String CHANNEL =
    "br.com.claudneysessa/ExemploBasicMessageChannel";

  private Handler handler;

  public ExemploBasicMessageChannel(
    Context context,
    FlutterEngine flutterEngine
  ) {

    CustomLogger logger = new CustomLogger();

    logger.info("Criando o Channel");

    ExemploBasicMessageChannel outerInstance = this;

    new BasicMessageChannel<>(
      flutterEngine.getDartExecutor().getBinaryMessenger(),
      CHANNEL,
      StandardMessageCodec.INSTANCE
    )
      .setMessageHandler(

        new BasicMessageChannel.MessageHandler<Object>() {
          @Override
          public void onMessage(
            Object message,
            BasicMessageChannel.Reply<Object> reply
          ) {

            logger.info("Criando o Channel");
            logger.error("Criando o Channel");
            logger.warning("Criando o Channel");
            logger.alert("Criando o Channel");
            logger.log("Criando o Channel");
            logger.printCustomMsgBox("Criando o Channel", "info", CHANNEL);

            HashMap map = (HashMap) message;

            System.out.println(message);

            logger.info("Funcao: " + map.get("funcaoNome"));

            String funcaoNome = (String) map.get("funcaoNome");
            String funcaoParametro = (String) map.get("funcaoParametro");

            switch (funcaoNome) {
              case "obterImagemAndroidAssets":

                logger.info("Executando funcao obterImagemAndroidAssets");

                try {
                  outerInstance.handler = new Handler(Looper.getMainLooper());

                  InputStream inputStream = context
                    .getAssets()
                    .open(funcaoParametro);

                  byte[] imageBytes = new byte[inputStream.available()];

                  inputStream.read(imageBytes);

                  outerInstance.handler.postDelayed(
                    () -> {

                      logger.info("Enviando imagem para o Flutter");

                      reply.reply(imageBytes);

                    },
                    10000
                  );

                } catch (IOException e) {

                  logger.error("Erro ao obter imagem");

                  e.printStackTrace();

                  reply.reply(null);

                }
                break;
            }

          }
        }
      );
  }
}

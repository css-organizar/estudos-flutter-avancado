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

  private static final String CHANNEL = "br.com.claudneysessa/ExemploBasicMessageChannel";

  private Handler handler;

  public ExemploBasicMessageChannel(
    Context context,
    FlutterEngine flutterEngine
  ) {

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

            HashMap map = (HashMap) message;

            System.out.println(message);

            String methodName = (String) map.get("method");
            String param = (String) map.get("param");

            if ("getImage".equals(methodName)) {
              try {
                outerInstance.handler = new Handler(Looper.getMainLooper());

                InputStream inputStream = context.getAssets().open(param);

                byte[] imageBytes = new byte[inputStream.available()];

                inputStream.read(imageBytes);

                outerInstance.handler.postDelayed(
                  () -> {
                    reply.reply(imageBytes);
                  },
                  10000
                );


              } catch (IOException e) {
                e.printStackTrace();
              }

            }

          }

        }

      );

  }

}

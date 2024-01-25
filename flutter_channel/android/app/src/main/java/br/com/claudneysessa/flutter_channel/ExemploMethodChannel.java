package br.com.claudneysessa.flutter_channel;

import android.os.Handler;
import android.os.Looper;
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.EventChannel.EventSink;
import io.flutter.plugin.common.EventChannel.StreamHandler;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import java.text.SimpleDateFormat;
import java.util.Date;

import android.content.Context;
import android.content.ContextWrapper;

public class ExemploMethodChannel {

  private static final String CHANNEL = "br.com.claudneysessa/ExemploMethodChannel";

  public ExemploMethodChannel(Context context, FlutterEngine flutterEngine) {
    new MethodChannel(
      flutterEngine.getDartExecutor().getBinaryMessenger(),
      CHANNEL
    )
      .setMethodCallHandler(
        new MethodCallHandler() {
          @Override
          public void onMethodCall(MethodCall call, Result result) {
            if ("getHelloWorld".equals(call.method)) {
              String user = call.argument("user");
              if (user == null) {
                result.success("Hello World");
              } else {
                result.success("Hello World, " + user);
                new MethodChannel(
                  flutterEngine.getDartExecutor().getBinaryMessenger(),
                  CHANNEL
                )
                  .invokeMethod("methodCallback", "result callback kt");
              }
            } else {
              result.notImplemented();
            }
          }
        }
      );
  }
}

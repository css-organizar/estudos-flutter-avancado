package br.com.claudneysessa.flutter_channel;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import androidx.annotation.NonNull;
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

import java.util.HashMap;

public class ExemploEventChannel {

  private static final String CHANNEL_Method = "br.com.claudneysessa/ExemploEventChannelMethos";
  private static final String CHANNEL_Event = "br.com.claudneysessa/ExemploEventChannelEvents";

  private EventSink eventSink;
  private Handler handler;
  private FlutterEngine flutterEngine;

  String nomeEvento = "";
  int tipoEvento = 0;

  public ExemploEventChannel(Context context, FlutterEngine flutterEngine) {

    System.out.println("ExemploEventChannel -> Criando o Channel");

    this.flutterEngine = flutterEngine;

    setupEventChannel();

  }

  private void setupEventChannel() {

    System.out.println("ExemploEventChannel -> Configurando o MethodChannel");

    new MethodChannel(
      flutterEngine.getDartExecutor().getBinaryMessenger(),
      CHANNEL_Method
    )
      .setMethodCallHandler(

        new MethodCallHandler() {

          @Override
          public void onMethodCall(MethodCall call, Result result) {
            switch (call.method) {


              //
              // Altera o Tipo do Evento
              //

              case "alterarEvento":

                alterarEvento();

                break;

              //
              // Altera o Nome do Evento e o Tipo do Evento
              //

              case "alterarEventoNome":

                HashMap map = call.argument("args");
                String nomeParametro = (String) map.get("nomeEvento");

                alterarEventoNome(nomeParametro);

                break;

            }

          }

        }

      );

    System.out.println("ExemploEventChannel -> Configurando o EventChannel");

    EventChannel eventChannel = new EventChannel(
      flutterEngine.getDartExecutor().getBinaryMessenger(),
      CHANNEL_Event
    );

    System.out.println("ExemploEventChannel -> Configurando o CustomStreamHandler");

    eventChannel.setStreamHandler(new CustomStreamHandler());
  }

  public void alterarEvento() {

    System.out.println("ExemploEventChannel -> Alterando o Tipo do Evento");

    if (tipoEvento == 0) {
      tipoEvento = 1;
    } else {
      tipoEvento = 0;
    }

  }

  public void alterarEventoNome(String value) {

    System.out.println("ExemploEventChannel -> Alterando o Nome e o Tipo do Evento");

    nomeEvento = value;

    if (tipoEvento == 0) {
      tipoEvento = 1;
    } else {
      tipoEvento = 0;
    }
  }

  private void cancelEventChannel() {

    System.out.println("ExemploEventChannel -> Cancelando o EventChannel");

    if (eventSink != null) {
      eventSink.endOfStream();
      eventSink = null;
    }

    if (handler != null) {
      handler.removeCallbacksAndMessages(null);
      handler = null;
    }

  }

  private class CustomStreamHandler implements StreamHandler {

    @Override
    public void onListen(Object arguments, EventSink events) {

      eventSink = events;
      handler = new Handler(Looper.getMainLooper());

      System.out.println("ExemploEventChannel -> Iniciando o CustomStreamHandler");

      handler.postDelayed(
        new Runnable() {
          @Override
          public void run() {

            if (eventSink != null) {
              String retornoFuncao = "";

              SimpleDateFormat sdf = new SimpleDateFormat("dd/M/yyyy hh:mm:ss");

              if (tipoEvento == 0) {
                retornoFuncao = nomeEvento + " 1 - " + sdf.format(new Date());
              } else {
                retornoFuncao = nomeEvento + " 2 - " + sdf.format(new Date());
              }

              eventSink.success(retornoFuncao);

              handler.postDelayed(this, 1000);
            }
          }
        },
        0
      );
    }

    @Override
    public void onCancel(Object arguments) {

      System.out.println("ExemploEventChannel -> Solicitando o cancelamento do EventChannel");

      cancelEventChannel();

    }
  }
}

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

public class CustomLogger {

  String getStrColor(String pTypeMsg) {
    switch (pTypeMsg) {

      case "black": return "\u001B[30m"; // ANSI_BLACK
      case "red": return "\u001B[31m"; // ANSI_RED
      case "green": return "\u001B[32m"; // ANSI_GREEN
      case "yellow": return "\u001B[33m"; // ANSI_YELLOW
      case "blue": return "\u001B[34m"; // ANSI_BLUE
      case "purple": return "\u001B[35m"; // ANSI_PURPLE
      case "cyan": return "\u001B[36m"; // ANSI_CYAN
      case "white": return "\u001B[37m"; // ANSI_WHITE
      case "cinza": return "\u001B[90m"; // ANSI_CINZA_CLARO

      case "reset": return "\u001B[0m";  // ANSI_RESET
      case "info": return "\u001B[34m"; // ANSI_BLUE
      case "error": return "\u001B[31m"; // ANSI_RED
      case "alert": return "\u001B[35m"; // ANSI_PURPLE
      case "warning": return "\u001B[33m"; // ANSI_YELLOW
      case "log": return "\u001B[90m"; // ANSI_CINZA_CLARO

      default: return "\u001B[0m"; // ANSI_RESET

    }
  }

  public void printCustomMsg(String msg, String pTypeMsg, String... channelName) {
    String corIni = getStrColor(pTypeMsg);
    String corFin = getStrColor("0");

    String channel = (channelName.length > 0 && !channelName[0].isEmpty()) ? " [" + channelName[0] + "] " : "";

    System.out.println(corIni + channel + msg + corFin);
  }

  public void printCustomMsgBox(String msg, String pTypeMsg, String... channelName) {
    String corIni = getStrColor(pTypeMsg);
    String corFin = getStrColor("0");

    String channel = (channelName.length > 0 && !channelName[0].isEmpty()) ? " [" + channelName[0] + "] " : "";

    System.out.println(corIni + "* * * * * * * * * * * * * * *" + corFin);
    System.out.println(corIni + "* " + channel + msg + corFin);
    System.out.println(corIni + "* * * * * * * * * * * * * * *" + corFin);
  }

  public void info(String msg, String... channelName) {
    printCustomMsg(msg, "info", channelName);
  }

  public void error(String msg, String... channelName) {
    printCustomMsg(msg, "error", channelName);
  }

  public void alert(String msg, String... channelName) {
    printCustomMsg(msg, "alert", channelName);
  }

  public void warning(String msg, String... channelName) {
    printCustomMsg(msg, "warning", channelName);
  }

  public void log(String msg, String... channelName) {
    printCustomMsg(msg, "log", channelName);
  }
}

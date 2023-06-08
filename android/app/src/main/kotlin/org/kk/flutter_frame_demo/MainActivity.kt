package org.kk.flutter_frame_demo

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StringCodec

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val messenger = flutterEngine.dartExecutor.binaryMessenger
        val basicMessageChannel =
            BasicMessageChannel(messenger, "testBasicMessageChannel", StringCodec.INSTANCE)
        // Receive messages from Dart
        basicMessageChannel.setMessageHandler { message, reply ->
            println("Android Received message = $message")
            reply.reply("Reply from Android")
        }
        // Send message to Dart
//        Handler().postDelayed({
//            channel.send("Hello World from Android") { reply ->
//                Log.d("Android", "$reply")
//            }
//        }, 500)


        val methodChannel = MethodChannel(messenger, "testNativeChannel")
        methodChannel.setMethodCallHandler { call, res ->
            // 根据方法名，分发不同的处理
            when (call.method) {
                "testNative" -> {
                    // 获取传入的参数
                    val msg = call.argument<String>("msg")
                    println("正在执行原生方法，传入的参数是：「$msg」")
                    // 通知执行成功
                    res.success("from android native")

//                    Thread.sleep(3000) // 模拟延时
                    basicMessageChannel.send("send from android") {
//                        println("sent android ")
                    }
                }

                else -> {
                    // 如果有未识别的方法名，通知执行失败
                    res.error("error_code", "error_message", null)
                }
            }
        }
    }
}

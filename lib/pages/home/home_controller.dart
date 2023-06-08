import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_frame_demo/bean/response/test_bean.dart';
import 'package:flutter_frame_demo/http/api_client.dart';
import 'package:flutter_frame_demo/http/base_result.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  var currentTab = 0.obs;
  final apiClient = ApiClient();

  int pageIndex = 1;
  List<WelcomeData> dataList = [];
  RefreshController refreshController = RefreshController(initialRefresh: false);

  @override
  void onReady() {
    _receiveChannelData();
  }

  void increment() => count.value++;

  void changeTab(int index) => currentTab.value = index;

  String getAppBarTitle() {
    switch (currentTab.value) {
      case 0:
        return '首页';
      case 1:
        return '测试1';
      case 2:
        return '测试2';
      case 3:
        return '我的';
      default:
        return '';
    }
  }

  Future<void> loadData({loadMore = false}) async {
    print("loadData");
    if (!loadMore) {
      pageIndex = 1;
    }
    var currentIndex = pageIndex + (loadMore ? 1 : 0);

    try {
      var result = await getData(currentIndex);
      // if (mounted) {
      // setState(() {
      if (loadMore) {
        if (parseList(result).length == 0) {
          refreshController!.loadNoData();
        } else {
          refreshController!.loadComplete();
        }
        //合成新数组
        dataList = [...dataList, ...parseList(result)];
        if (parseList(result).length != 0) {
          pageIndex++;
        }
      } else {
        dataList = parseList(result);
        refreshController!.refreshCompleted(resetFooterState: true);
      }
      print("dataList: ${dataList.length}");
      // });
      // }
    } catch (e) {
      // setState(() {
      if (loadMore) {
        refreshController!.loadFailed();
      } else {
        refreshController!.refreshFailed();
      }
      // });
    }
  }

  void onRefresh() async {
    loadData(loadMore: false);
  }

  void onLoading() async {
    loadData(loadMore: true);
  }
  //获取对应页吗的数据
  Future<WelcomeData> getData(int currentIndex) async {
    BaseResult a =  await apiClient.test();
    return a.data;
  }
  List<WelcomeData> parseList(WelcomeData result) {
    return [];
  }


  // channel测试
  static const BasicMessageChannel _basicMessageChannel = BasicMessageChannel('testBasicMessageChannel', StringCodec());
  // 使用BasicMessageChannel接收来自native的消息，并向native回复
  void _receiveChannelData() {
    _basicMessageChannel.setMessageHandler(_handlerMessage);
  }
  Future<String> _handlerMessage(message) async {
    EasyLoading.showToast('收到native的消息:\n$message');
    return message;
  }

  // 使用BasicMessageChannel向native发送消息，并接收native的回复
  void _sendMessage() async {
    //response为native回复的消息
    try {
      String response = await _basicMessageChannel.send('发送给native的消息');
    } on PlatformException catch (e) {
      print(e);
    }
  }

  void testCallNative() {
    // 创建渠道
    const channel = MethodChannel("testNativeChannel");
    channel.setMethodCallHandler((call) async {
      /// 逻辑处理...
      print('收到原生调用flutter：'+call.method+'参数：'+call.arguments);
      if (call.method == 'testNative') {
        print("原生testNative方法..");
        return call.arguments;
      }
    });
    try {
      // 通过渠道，调用原生代码代码的方法
      Future future = channel.invokeMethod("testNative", {"msg": "lalal"} );
      // 打印执行的结果
      print(future.toString());
    } on PlatformException catch(e) {
      print(e.toString());
    }
  }
}

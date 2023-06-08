import 'package:flutter/material.dart';
import 'package:flutter_frame_demo/bean/response/test_bean.dart';
import 'package:flutter_frame_demo/http/api_client.dart';
import 'package:flutter_frame_demo/http/base_result.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BaseListReFreshState extends Container {

  late RefreshController? refreshController = RefreshController(initialRefresh: false);

  BaseListReFreshState();

  // get contentChild;
  int pageIndex = 1;

  void _onRefresh() async {
    loadData(loadMore: false);
  }

  void _onLoading() async {
    loadData(loadMore: true);
  }


  //
  // @override
  // void initState() {
  //   refreshController = RefreshController(initialRefresh: false);
  //   loadData(loadMore: false);
  // }
  //
  // @override
  // void dispose() {
  //   refreshController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        // WaterDropHeader、ClassicHeader、CustomHeader、LinkHeader、MaterialClassicHeader、WaterDropMaterialHeader
        header: ClassicHeader(),
        // header: CustomHeader(
        //   builder: (BuildContext context, RefreshStatus? mode) {
        //     return Container(
        //         child: Lottie.asset('assets/lottie/meteorite.json', height: 60)
        //     );
        //   },
        // ),
        // ClassicFooter、CustomFooter、LinkFooter、LoadIndicator
        footer: ClassicFooter(),
        // footer: CustomFooter(
        //   builder: (BuildContext context, LoadStatus? mode) {
        //     Widget body;
        //     if (mode == LoadStatus.idle) {
        //       body = Text("pull up load");
        //     } else if (mode == LoadStatus.loading) {
        //       body = Container(
        //         child: Text("AAAA")// Lottie.asset('assets/lottie/meteorite.json', height: 60),
        //       );
        //     } else if (mode == LoadStatus.failed) {
        //       body = InkWell(
        //         onTap: () {
        //           _onLoading();
        //         },
        //         child: Text("加载失败，点击重新加载"),
        //       );
        //     } else if (mode == LoadStatus.noMore) {
        //       body = InkWell(
        //         onTap: () {
        //           _onLoading();
        //         },
        //         child: Text("暂无更多数据"),
        //       );
        //     } else {
        //       body = Text("暂无更多数据");
        //     }
        //     return Container(
        //       height: 55.0,
        //       child: Center(child: body),
        //     );
        //   },
        // ),
        controller: refreshController!,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (BuildContext context, int index) {
            DataElement item= dataList[index];
            print("item: ${item.title}");
            //在这可以更具item的Type返回不同的Widget
            return Text(item.title);
          },
        ),
      ),
    );
  }
  List<DataElement> dataList = [];
  final apiClient = ApiClient();
  //获取对应页吗的数据
  Future<WelcomeData> getData(int currentIndex) async {
    BaseResult a =  await apiClient.test();
    return a.data;
  }

  ///从Mo中解析出list数据
  List<DataElement> parseList(WelcomeData result) {
    return result.datas;
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
}



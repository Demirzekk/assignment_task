import 'dart:async';

import 'package:assignment_task/utility/constants/color_constants.dart';
import 'package:flutter/material.dart';

class MyRefreshIndicator extends StatefulWidget {
  final Widget? child;
  final Widget? emptyChild;
  final Widget? nullChild;
  //final RefreshCallback onRefresh;
  final int? itemCount;
  final Widget? loadingFooter;
  final Widget Function(BuildContext context, int index)? itemBuilder;
  final Future? Function({
    bool nextPage,
  })? loadData;
  final EdgeInsetsGeometry? padding;
  final bool? paging;
  final ScrollController? controller;
  final bool? loadDataOnLoad;
  final bool? isGridView;
  final SliverGridDelegate? gridDelegate;

  const MyRefreshIndicator(
      {Key? key,
      this.controller,
      this.child,
      this.emptyChild,
      //this.onRefresh,
      this.gridDelegate,
      this.itemCount,
      this.itemBuilder,
      this.nullChild,
      this.loadingFooter,
      this.loadData,
      this.padding = const EdgeInsets.all(0),
      this.paging = false,
      this.isGridView = false,
      this.loadDataOnLoad = false})
      : super(key: key);

  @override
  MyRefreshIndicatorState createState() => MyRefreshIndicatorState();
}

class MyRefreshIndicatorState extends State<MyRefreshIndicator> {
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  ScrollController? _controller;
  bool loadMore = false;

  @override
  void initState() {
    _controller = widget.controller ?? ScrollController();
    if (widget.paging!) _controller?.addListener(_scrollListener);
    super.initState();
    if (widget.loadDataOnLoad == true) {
      Timer(const Duration(milliseconds: 100),
          () => callWidgetLoadData(nextPage: false));
    }
  }

  _scrollListener() {
    if (_controller!.position.outOfRange) return;
    if (_controller!.position.pixels >= _controller!.position.maxScrollExtent) {
      loadMoreData();
    }
  }

  callWidgetLoadData({bool nextPage = false}) {
    if (widget.loadData == null) return Future.value();
    if (nextPage != true) displayLoading(true);
    return widget.loadData!(nextPage: nextPage);
  }

  loadMoreData() {
    if (loadMore || widget.loadData == null) return;
    setState(() {
      loadMore = true;
    });
    callWidgetLoadData(nextPage: true).then((value) {
      setState(() {
        loadMore = false;
      });
    });
  }

  displayLoading(bool show) {
    if (show) _refreshIndicatorKey.currentState?.show();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: () async {
        return callWidgetLoadData(nextPage: false);
      },
      color: Colors.black,
      child: inner,
    );
  }

  Widget get inner {
    return Stack(
      children: [
        SizedBox(
            child: widget.itemCount != null && widget.itemCount! > 0
                ? notificationWrapper(
                    child: widget.isGridView!
                        ? GridView.builder(
                            gridDelegate: widget.gridDelegate ??
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 5.0,
                                    mainAxisSpacing: 5.0,
                                    childAspectRatio: 8 / 2),
                            //controller: _controller, // warning: do not use controller because it's not working with NestedScrollView !!!
                            padding: widget.padding ??
                                const EdgeInsets.symmetric(horizontal: 4),
                            itemCount: widget.itemCount ?? 0,
                            itemBuilder: widget.itemBuilder!)
                        : ListView.builder(
                            //controller: _controller, // warning: do not use controller because it's not working with NestedScrollView !!!
                            padding: widget.padding,
                            itemCount: widget.itemCount ?? 0,
                            itemBuilder: widget.itemBuilder!,
                          ),
                  )
                : notificationWrapper(child: innerLegacy)),
        Align(alignment: Alignment.bottomCenter, child: footer)
      ],
    );
  }

  Widget get innerLegacy {
    return Stack(
      children: [
        ListView(),
        (widget.child ??
                (widget.itemCount == null
                    ? widget.nullChild
                    : widget.emptyChild)) ??
            const SizedBox.shrink(),
      ],
    );
  }

  Widget notificationWrapper({Widget? child}) {
    if (widget.paging == false) return child ?? const SizedBox.shrink();
    return NotificationListener<ScrollEndNotification>(
      onNotification: (scrollNotification) {
        if (!scrollNotification.metrics.outOfRange &&
            scrollNotification.metrics.axisDirection == AxisDirection.down &&
            scrollNotification.metrics.maxScrollExtent > 0 &&
            scrollNotification.metrics.pixels >=
                scrollNotification.metrics.maxScrollExtent) {
          loadMoreData();
        }
        return false;
      },
      child: child ?? const SizedBox.shrink(),
    );
  }

  Widget get footer {
    if (!loadMore) return const SizedBox();
    if (widget.loadingFooter != null) {
      return SafeArea(
        child: Container(
          padding: const EdgeInsets.only(bottom: 2),
          alignment: Alignment.center,
          height: 32,
          width: 110,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blueGrey.shade50),
          child: widget.loadingFooter,
        ),
      );
    }
    return CircularProgressIndicator(color: ColorConstants().appPrimaryColor);
  }
}

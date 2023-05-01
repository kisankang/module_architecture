import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_architecture/data/services/theme_service.dart';

class WrapPage extends StatefulWidget {
  final Widget child;
  late Color statusBarColor;
  late Color bottomBarColor;
  late Color backgroundColor;
  final bool preventBack;
  final Key? scaffoldKey;
  final Widget? drawer;
  final Widget? endDrawer;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final bool resizeToAvoidBottomInset;
  final dynamic backResult;

  WrapPage({
    super.key,
    required this.child,
    Color? statusBarColor,
    Color? bottomBarColor,
    Color? backgroundColor,
    this.preventBack = false,
    this.scaffoldKey,
    this.drawer,
    this.appBar,
    this.endDrawer,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset = true,
    this.backResult,
  }) {
    this.statusBarColor = statusBarColor ?? Colors.transparent;
    this.bottomBarColor = bottomBarColor ?? Colors.transparent;
    this.backgroundColor = backgroundColor ?? Colors.transparent;
  }

  @override
  _WrapPageState createState() => _WrapPageState();
}

class _WrapPageState extends State<WrapPage>
    with WidgetsBindingObserver, AutomaticKeepAliveClientMixin {
  final ThemeService _themeService = Get.find();
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(
      () => WillPopScope(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context)
                .requestFocus(FocusNode()); // hide keyboard when touch anywhere
          },
          child: DefaultTextHeightBehavior(
            textHeightBehavior: const TextHeightBehavior(
              leadingDistribution: TextLeadingDistribution.even,
            ),
            child: Stack(children: [
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: widget.statusBarColor,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: widget.bottomBarColor,
                    ),
                  ),
                ],
              ),
              SafeArea(
                child: Scaffold(
                  resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
                  backgroundColor: widget.backgroundColor,
                  appBar: widget.appBar,
                  key: widget.scaffoldKey,
                  body: widget.child,
                  drawer: widget.drawer,
                  endDrawer: widget.endDrawer,
                  bottomNavigationBar: widget.bottomNavigationBar,
                ),
              ),
              _themeService.isHintShown.value
                  ? GestureDetector(
                      onTap: _themeService.closeHint,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.transparent,
                      ),
                    )
                  : Container(),
            ]),
          ),
        ),
        onWillPop: () {
          Get.back(result: widget.backResult);
          return Future.value(widget.preventBack == false);
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

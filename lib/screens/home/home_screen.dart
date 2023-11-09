// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:provider/provider.dart';

import 'package:qlda_demego/services/provider/auth_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../services/api/api_services.dart';
import '../../widgets/main_drawer.dart';
import '../../widgets/primary_appbar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  InAppWebViewController? webController;

  PullToRefreshController? refreshController;

  late var url;

  double progress = 0;

  @override
  Widget build(BuildContext context) {
    var accessToken = context.watch<AuthProvider>().accessToken;
    print(accessToken);
    var initialUrl = 
    'https://${ApiService.shared.webUrl}?token=$accessToken&mobile=true';
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          // onNavigationRequest: (NavigationRequest request) {
          //   if (request.url.startsWith(initialUrl)) {
          //     return NavigationDecision.prevent;
          //   }
          //   return NavigationDecision.navigate;
          // },
        ),
      )
      ..loadRequest(Uri.parse(initialUrl));

    return Scaffold(
      appBar: const PrimaryAppbar(
        title: "Welcome",
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Expanded(
            child: WebViewWidget(controller: controller),
          ),
        ],
      ),
    );
  }
}

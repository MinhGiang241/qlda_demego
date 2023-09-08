// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:provider/provider.dart';
import 'package:qlda_demego/constant/constants.dart';
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
        '${ApiService.shared.webUrl}?token=$accessToken&mobile=true';
    var ac =
        "https://dev.buildingtenant.demego.vn/l/bao-cao-tong-hop-theo-cong-ty";
    var b = 'http://127.0.0.1/:3000';
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
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(initialUrl)) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(ac));

    return Scaffold(
      appBar: const PrimaryAppbar(
        title: "Welcome",
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          // Expanded(
          //   child: WebviewScaffold(
          //     url: initialUrl,
          //   ),
          // ),
          // Expanded(
          //   child: WebViewWidget(
          //     controller: controller,
          //   ),
          // ),
          Expanded(
            child: InAppWebView(
              onFindResultReceived: (
                controller,
                activeMatchOrdinal,
                numberOfMatches,
                isDoneCounting,
              ) {},
              onConsoleMessage: (controller, consoleMessage) {
                print('conslole: ');
                print(consoleMessage.message ?? '');
              },
              onLoadResource: (controller, resource) {
                // print(controller);
                //   print(resource);
              },
              onUpdateVisitedHistory: (controller, url, androidIsReload) {
                // print(controller);
                // print(url);
                // print(androidIsReload);
              },
              onWebViewCreated: (controller) {
                // print(controller);
              },
              onPageCommitVisible: (controller, url) {
                // print(controller);
                // print(url);
              },
              onJsConfirm: (controller, jsConfirmRequest) async {
                // print(controller);
                // print(jsConfirmRequest);
              },
              onLoadError: (controller, url, code, message) {
                // print(controller);
                // print(url);
                // print(code);
                // print(message);
              },
              onCreateWindow: (controller, createWindowAction) async {
                // print(controller);
                // print(createWindowAction);
              },
              // onAjaxProgress: (controller, ajaxRequest) async {
              //   print(controller);
              //   print(ajaxRequest);
              // },
              onLoadStart: (controller, url) {
                print(controller);
                print(url);
              },
              onJsAlert: (controller, jsAlertRequest) async => JsAlertResponse(
                confirmButtonTitle: "aloo",
                message: "adshdhasdkaskhdashkhk",
              ),
              onJsPrompt: (controller, jsAlertRequest) async =>
                  JsPromptResponse(
                confirmButtonTitle: "aloo",
                message: "adshdhasdkaskhdashkhk",
              ),
              initialUrlRequest: URLRequest(url: Uri.parse(initialUrl)),
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                  allowFileAccessFromFileURLs: true,
                  incognito: true,
                  preferredContentMode: UserPreferredContentMode.MOBILE,
                  useShouldOverrideUrlLoading: true,
                  useShouldInterceptFetchRequest: true,
                  allowUniversalAccessFromFileURLs: true,
                  javaScriptCanOpenWindowsAutomatically: true,
                  javaScriptEnabled: true,
                  mediaPlaybackRequiresUserGesture: false,
                  supportZoom: false,
                ),
                android: AndroidInAppWebViewOptions(
                  domStorageEnabled: true,
                  loadWithOverviewMode: true,
                  mixedContentMode:
                      AndroidMixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

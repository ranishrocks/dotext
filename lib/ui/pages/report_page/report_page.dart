import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../constants/fixed_data.dart';
import '../../widgets/main_appbar.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key, this.appbar, this.isDetail});

  final bool? appbar;
  final bool? isDetail;

  @override
  State<ReportPage> createState() => ReportPageState();
}

class ReportPageState extends State<ReportPage> {
  
  @override
  Widget build(BuildContext context) {
    var WEB_ADDR = (widget.isDetail??false) ? reportWebAddrDetail : reportWebAddrSimple;

    var webViewController = WebViewController()
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
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse(WEB_ADDR));

    return Scaffold(
      appBar: (widget.appbar ?? true) ? MainAppbar(appbarString: "return to main") : null,
      body: WebViewWidget(
        controller: webViewController,
      ),
    );
  }
}
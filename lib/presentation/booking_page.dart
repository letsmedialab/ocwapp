import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BookingPage extends StatelessWidget {
  final Function createSession;

  BookingPage(this.createSession);

  WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebView(
        initialUrl: 'https://cleanngo.in/app-booking',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

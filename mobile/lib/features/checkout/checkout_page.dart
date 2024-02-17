import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class CheckoutPage extends StatefulWidget {
  final Uri checkoutUrl;

  const CheckoutPage({
    super.key,
    required this.checkoutUrl,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final webviewController = WebViewController();

  @override
  void initState() {
    super.initState();
    webviewController.setJavaScriptMode(JavaScriptMode.unrestricted);
    webviewController.loadRequest(widget.checkoutUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Fechar pedido'),
      ),
      body: SafeArea(
        child: WebViewWidget(
          controller: webviewController,
        ),
      ),
    );
  }
}

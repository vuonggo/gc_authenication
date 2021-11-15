import 'package:flutter/material.dart';
import 'package:gc_authenication/l10n/generated/l10n.dart';
import 'package:gc_core/gc_core.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

class PolicyScreen extends StatefulWidget {
  static show(BuildContext context) {
    VoidCallback? dismiss;
    var diablog = Popup.showGeneralPopup(
        context: context,
        child: PolicyScreen(dismiss: () {
          if (dismiss != null) dismiss();
        }));
    dismiss = diablog.dismiss;
  }

  final VoidCallback dismiss;
  const PolicyScreen({Key? key, required this.dismiss}) : super(key: key);

  @override
  _PolicyScreenState createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  final GlobalKey webViewKey = GlobalKey();
  var isLoading = true;
  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  @override
  Widget build(BuildContext context) {
    var url = 'URL';
    var policy = SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(S.of(context).policyTitle,
            style: Theme.of(context).textTheme.headline2),
        const SizedBox(
          height: AppConsts.kDefaultPadding,
        ),
        Text(S.of(context).policyDescription,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400))
      ],
    ));
    return Container(
        height: 85.h,
        padding: AppConsts.kMarginAll,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: url.isNotEmpty
                  ? Stack(
                      children: [
                        Positioned.fill(
                            child: InAppWebView(
                          key: webViewKey,
                          gestureRecognizers: Set()
                            ..add(Factory<VerticalDragGestureRecognizer>(
                                () => VerticalDragGestureRecognizer())),
                          initialOptions: options,
                          initialUrlRequest: URLRequest(url: Uri.parse(url)),
                          onLoadError: (controller, uri, index, text) {
                            debug('load error');
                          },
                          onLoadStart: (controller, uri) {
                            debug('start loading');
                          },
                          onLoadStop: (controller, uri) {
                            debug('stop loading');
                            setState(() {
                              isLoading = false;
                            });
                          },
                          onLoadResource: (controller, resource) {},
                          onWebViewCreated: (controller) {},
                          onProgressChanged: (controller, index) {
                            debug(index);
                            if (index == 100) {
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                          androidOnPermissionRequest:
                              (controller, origin, resources) async {
                            return PermissionRequestResponse(
                                resources: resources,
                                action: PermissionRequestResponseAction.GRANT);
                          },
                        )),
                        if (isLoading)
                          const Positioned.fill(
                              child: Center(
                            child: Loading(),
                          ))
                        else
                          Container()
                      ],
                    )
                  : policy,
            ),
            ButtonContainer(
              icon: Container(),
              text: Text(S.of(context).agree),
              press: widget.dismiss,
            ),
          ],
        ));
  }
}

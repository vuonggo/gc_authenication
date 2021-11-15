import 'package:flutter/material.dart';

class VerticalStackDialog extends StatelessWidget {
  final String? title;
  final String? desc;
  final Widget? btnOk;
  final Widget? btnCancel;
  final Widget? header;
  final Widget? body;
  final bool isDense;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final bool keyboardAware;
  final double? width;
  final bool? showCloseIcon;
  final Function onClose;
  final Widget? closeIcon;
  final Color? dialogBackgroundColor;
  final BorderSide? borderSide;
  final BorderRadiusGeometry? borderRadius;

  const VerticalStackDialog({
    Key? key,
    this.title,
    this.desc,
    this.btnOk,
    this.btnCancel,
    this.body,
    this.alignment,
    this.isDense = true,
    required this.header,
    required this.padding,
    required this.margin,
    this.keyboardAware = true,
    this.width,
    this.showCloseIcon,
    required this.onClose,
    this.closeIcon,
    this.dialogBackgroundColor,
    this.borderSide,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      alignment: alignment,
      padding: EdgeInsets.only(
          bottom: keyboardAware ? mediaQueryData.viewInsets.bottom : 0),
      child: Stack(
        children: <Widget>[
          Container(
            width: width ?? mediaQueryData.size.width,
            padding: margin,
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius ??
                    const BorderRadius.all(
                      const Radius.circular(10),
                    ),
                side: borderSide ?? BorderSide.none,
              ),
              elevation: 0.5,
              color: dialogBackgroundColor ?? theme.cardColor,
              child: Padding(
                padding: padding,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: header != null ? 50.0 : 15,
                      ),
                      body ??
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              if (title != null) ..._titleBody(title!, theme),
                              if (desc != null)
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    child: Text(
                                      desc!,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                      if (desc != null)
                        const SizedBox(
                          height: 16.0,
                        ),
                      if (btnOk != null || btnCancel != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              if (btnCancel != null)
                                Expanded(
                                  child: btnCancel ?? Container(),
                                ),
                              if (btnCancel != null && btnOk != null)
                                const SizedBox(
                                  width: 10,
                                ),
                              if (btnOk != null)
                                Expanded(
                                  child: btnOk!,
                                )
                            ],
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (header != null)
            Container(
              width: width ?? mediaQueryData.size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Material(
                    shape: CircleBorder(
                      side: borderSide ?? BorderSide.none,
                    ),
                    child: CircleAvatar(
                      backgroundColor: dialogBackgroundColor ?? theme.cardColor,
                      radius: 55.0,
                      child: header,
                    ),
                  ),
                ],
              ),
            ),
          if (showCloseIcon!)
            Positioned(
              right: 50.0,
              top: 75.0,
              child: GestureDetector(
                onTap: () {
                  onClose.call();
                },
                child: closeIcon ?? const Icon(Icons.close),
              ),
            ),
        ],
      ),
    );
  }

  List<Widget> _titleBody(String title, ThemeData theme) => [
        Text(
          title,
          textAlign: TextAlign.center,
          style: theme.textTheme.headline6,
        ),
        const SizedBox(
          height: 10.0,
        ),
      ];
}

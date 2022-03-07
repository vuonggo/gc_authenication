import 'package:flutter/material.dart';

import '../../core.dart';

class FormContainer extends StatelessWidget {
  final Widget child;
  final Widget? icon;
  final bool hasFocus;
  final bool hasError;
  final double borderRadius;
  final String title;
  final bool isRequired;
  final String? errorText;
  final bool enabled;
  const FormContainer(
      {Key? key,
      required this.child,
      this.enabled = true,
      this.icon,
      this.hasFocus = false,
      this.hasError = false,
      this.isRequired = true,
      this.borderRadius = 16,
      this.title = '',
      this.errorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(hasError ? 1 : 0),
        decoration: BoxDecoration(
            border: Border.all(
                color: (hasFocus
                    ? AppColors.primary
                    : hasError
                        ? AppColors.red
                        : AppColors.neutral400),
                width: 1.0),
            borderRadius: BorderRadius.circular(borderRadius),
            color: enabled ? Colors.white : AppColors.black.withAlpha(7)),
        child: FormHandlerContainer(
          title: title,
          formField: child,
          isRequired: isRequired,
          hasError: hasError,
          errorText: errorText,
          borderRadius: borderRadius,
          icon: icon,
        ));
  }
}

class FormHandlerContainer extends StatelessWidget {
  final String title;
  final bool isRequired;
  final Widget formField;
  final bool hasError;
  final String? errorText;
  final double borderRadius;
  final Widget? icon;
  const FormHandlerContainer(
      {Key? key,
      this.title = '',
      this.isRequired = true,
      required this.formField,
      this.hasError = false,
      this.errorText,
      this.borderRadius = 12,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                child: Column(
                  children: [
                    if (title.isNotEmpty)
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                color: AppColors.neutral200,
                                fontSize: AppSizes.textTitleSize,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              isRequired == true ? ' *' : '',
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: AppSizes.textTitleSize),
                            )
                          ],
                        ),
                      ),
                    if (title.isNotEmpty)
                      const SizedBox(
                        height: 5,
                      ),
                    Container(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          children: [Container(child: formField)],
                        )),
                    const SizedBox(
                      height: 3,
                    ),
                  ],
                ),
              ),
            ),
            if (icon != null) icon!
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        if (hasError && (errorText ?? '').isNotEmpty)
          Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              decoration: BoxDecoration(
                  color: AppColors.red,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(borderRadius),
                      bottomRight: Radius.circular(borderRadius))),
              child: Text(
                errorText ?? '',
                style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ))
      ],
    );
  }
}

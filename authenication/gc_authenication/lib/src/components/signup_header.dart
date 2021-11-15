import 'package:flutter/material.dart';
import 'package:gc_core/gc_core.dart';
import '../../generated_images.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        TransparentImage(Img.logo),
        SizedBox(
          width: 8,
        ),
      ],
    );
  }
}

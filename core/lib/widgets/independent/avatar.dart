import 'package:flutter/material.dart';

import '../../core.dart';

class Avatar extends StatelessWidget {
  final double size;
  final String? url;
  final String? title;
  const Avatar({Key? key, required this.size, this.title, this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size,
        height: size,
        child: url != null && url!.isNotEmpty
            ? CircleAvatar(radius: size, backgroundImage: NetworkImage(url!))
            : CircleAvatar(
                radius: size,
                backgroundColor: Colors.grey,
                child: Text(getInitials(title ?? ''),
                    style: AppTheme.avatarText)));
  }
}

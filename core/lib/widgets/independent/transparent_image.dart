import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class TransparentImage extends StatelessWidget {
  final String image;
  final BoxFit? fit;
  final Color? color;
  final bool netowrkImage;
  final AlignmentGeometry? alignment;
  const TransparentImage(this.image,
      {Key? key,
      this.fit,
      this.color,
      this.netowrkImage = false,
      this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var component = netowrkImage ? NetworkImage(image) : AssetImage(image);
    return FadeInImage(
      placeholder: MemoryImage(kTransparentImage),
      image: component as ImageProvider<Object>,
      fit: fit,
      fadeInDuration: const Duration(milliseconds: 300),
      alignment: alignment ?? Alignment.center,
    );
  }
}

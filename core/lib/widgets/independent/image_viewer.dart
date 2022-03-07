import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({
    this.imageProvider,
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialScale,
    this.basePosition = Alignment.center,
    this.filterQuality = FilterQuality.none,
    this.disableGestures,
    this.errorBuilder,
  });

  final ImageProvider? imageProvider;
  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final dynamic initialScale;
  final Alignment basePosition;
  final FilterQuality filterQuality;
  final bool? disableGestures;
  final ImageErrorWidgetBuilder? errorBuilder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black.withOpacity(0.3),
        automaticallyImplyLeading: true,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: AppConsts.padding),
              child: GestureDetector(
                  onTap: () => _saveImage(context),
                  child: const Icon(
                    Icons.save_alt,
                    size: 24,
                  )))
        ],
        iconTheme: Theme.of(context)
            .appBarTheme
            .iconTheme
            ?.copyWith(color: Colors.white),
      ),
      body: Container(
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: PhotoView(
          imageProvider: imageProvider,
          loadingBuilder: loadingBuilder,
          backgroundDecoration: backgroundDecoration,
          minScale: minScale,
          maxScale: maxScale,
          initialScale: initialScale,
          basePosition: basePosition,
          filterQuality: filterQuality,
          disableGestures: disableGestures,
          errorBuilder: errorBuilder,
        ),
      ),
    );
  }

  void _saveImage(BuildContext context) async {
    var netowrkImage = imageProvider;
    if (netowrkImage is NetworkImage) {
      Loader.appLoader.showLoading(true);
      var success = await GallerySaver.saveImage(netowrkImage.url,
          headers: netowrkImage.headers);
      Loader.appLoader.showLoading(false);
      if (success ?? false) {
        Popup.showSuccess(context, message: 'Đã lưu ảnh vào thư viện.');
      } else {
        Popup.showError(context, message: 'Không thể lưu ảnh vào thư viện.');
      }
    }
  }
}

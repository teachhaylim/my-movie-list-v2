import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageViewer extends StatefulWidget {
  const CustomImageViewer({super.key, this.url, this.fit = BoxFit.cover, this.height = double.infinity, this.width = double.infinity});

  final String? url;
  final double width;
  final double height;
  final BoxFit fit;

  @override
  State<CustomImageViewer> createState() => _CustomImageViewerState();
}

class _CustomImageViewerState extends State<CustomImageViewer> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.url ?? "https://via.placeholder.com/300",
      fit: widget.fit,
      width: widget.width,
      height: widget.height,
      errorWidget: (context, url, option) {
        return Container();
      },
      progressIndicatorBuilder: (context, url, progress) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}

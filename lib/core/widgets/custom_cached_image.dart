import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCachedImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final double borderRadius;
  final BoxFit fit;

  const CustomCachedImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.borderRadius = 0,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius.r),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width.sp,
        height: height.sp,
        fit: fit,
        placeholder:
            (context, url) =>
                const Center(child: CircularProgressIndicator(strokeWidth: 2)),
        errorWidget:
            (context, url, error) =>
                Icon(Icons.broken_image, color: Colors.grey, size: 40.sp),
      ),
    );
  }
}

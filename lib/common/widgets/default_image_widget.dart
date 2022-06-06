import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../resources/index.dart';

class DefaultImageWidget extends StatelessWidget {
  const DefaultImageWidget(
    this.image, {
    Key? key,
    this.width,
    this.height,
    this.fit,
    this.radius,
    this.borderColor,
  }) : super(key: key);

  final String image;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final double? radius;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 0),
        border: Border.all(
          color: borderColor ?? AppColors.transparent,
        )
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0),
        child: CachedNetworkImage(
          imageUrl: image,
          width: width,
          height: height,
          fit: fit ?? BoxFit.cover,
          placeholder: (_, __) => Image.asset(
            AssetImages.imgDefault,
            width: width,
            height: height,
            fit: fit ?? BoxFit.cover,
          ),
          errorWidget: (_, __, dynamic error) => Image.asset(
            AssetImages.imgDefault,
            width: width,
            height: height,
            fit: fit ?? BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

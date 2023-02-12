import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonLoading {
  static Widget boxSkeleton({
    double marginSize = 0,
    double paddingSize = 0,
    bool isRounded = true,
    double roundedSize = 12,
    double heigh = 200,
    double width = 200,
  }) {
    return Container(
      margin: EdgeInsets.all(marginSize),
      padding: EdgeInsets.all(paddingSize),
      width: width,
      height: heigh,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade300,
        direction: ShimmerDirection.ltr,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(isRounded ? roundedSize : 0),
          ),
        ),
      ),
    );
  }
}

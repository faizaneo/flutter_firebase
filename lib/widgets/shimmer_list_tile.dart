import 'package:cat_app/shared/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListTile extends StatefulWidget {
  const ShimmerListTile({Key? key}) : super(key: key);

  @override
  State<ShimmerListTile> createState() => _ShimmerListTileState();
}

class _ShimmerListTileState extends State<ShimmerListTile> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Shimmer.fromColors(
      baseColor: Color(0xffE0E0E0),
      highlightColor: Colors.white,
      enabled: true,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            gradient: shimmerGradient, borderRadius: BorderRadius.circular(16), border: Border.all(color: Color(0xffE0E0E0))),
        height: height / 7.3,
      ),
    );
  }
}

import 'package:cat_app/shared/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CatListTile extends StatefulWidget {
  final String name;
  final String description;
  final Widget addRemoveButton;
  CatListTile({
    Key? key,
    required this.name,
    required this.description,
    required this.addRemoveButton,
  }) : super(key: key);

  @override
  State<CatListTile> createState() => _CatListTileState();
}

class _CatListTileState extends State<CatListTile> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all(color: Color(0xffE0E0E0))),
        height: height / 7.3,
        child: Row(
          children: [
            Image.asset(
              'assets/pngs/cat.png',
              height: height / 7.3,
              width: height / 7.3,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: titleTextStyle,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      widget.description,
                      style: subtitleTextStyle,
                    ),
                  ),
                  widget.addRemoveButton
                ],
              ),
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:jio_fashion_hack/config/constants/asset_paths.dart';

class LogoContainer extends StatelessWidget {
  final EdgeInsets margin;
  final EdgeInsets padding;

  const LogoContainer(
      {Key? key,
      this.margin = const EdgeInsets.all(32.0),
      this.padding = const EdgeInsets.all(8.0)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: margin,
      padding: padding,
      child: Image(image: AssetImage(AssetPaths.images['logo']!)),
    );
  }
}

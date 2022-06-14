import 'package:flutter/material.dart';
import 'package:jio_fashion_hack/api/auth/signout_api.dart';
import 'package:jio_fashion_hack/components/widgets/logo_widget.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
    this.showBottomShadow = false,
  }) : super(key: key);

  final bool showBottomShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: showBottomShadow
          ? const BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black45,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75))
            ], color: Colors.white)
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 25),
            height: 75,
            width: 200,
            alignment: Alignment.center,
            child: const LogoContainer(margin: EdgeInsets.all(8)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25),
            height: 75,
            width: 100,
            alignment: Alignment.center,
            child: IconButton(
                onPressed: () => signOut(context),
                icon: const Icon(Icons.logout, size: 30)),
          ),
        ],
      ),
    );
  }
}

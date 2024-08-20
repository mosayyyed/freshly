import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class MyCupertinoRecipeAppBarView extends StatelessWidget
    implements PreferredSizeWidget {
  const MyCupertinoRecipeAppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    // Adjust the system UI overlay style to remove the shadow
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: CupertinoColors.white, // Color of the status bar
      statusBarBrightness: Brightness.light, // For iOS (light or dark content)
      statusBarIconBrightness:
          Brightness.dark, // For Android (light or dark icons)
    ));

    return CupertinoNavigationBar(
      leading: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Icon(
          CupertinoIcons.back,
          color: Color(0xFF01937c),
          size: 30.0,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: const Icon(
              CupertinoIcons.heart,
              color: Color(0xff000000),
              size: 20.0,
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: const Icon(
              CupertinoIcons.play,
              color: Color(0xff000000),
              size: 20.0,
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: const Icon(
              CupertinoIcons.cart,
              color: Color(0xff000000),
              size: 20.0,
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: const Icon(
              CupertinoIcons.share,
              color: Color(0xff000000),
              size: 20.0,
            ),
          ),
        ],
      ),
      backgroundColor: CupertinoColors.white,
      border: null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

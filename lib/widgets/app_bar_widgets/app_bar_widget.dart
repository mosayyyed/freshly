import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class MyCupertinoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyCupertinoAppBar(
      {super.key, required this.title, required this.onDrawerPressed});
  final String title;
  final VoidCallback onDrawerPressed;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: CupertinoColors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));

    return CupertinoNavigationBar(
      middle: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF01937c),
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      leading: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onDrawerPressed,
        child: const Icon(
          CupertinoIcons.bars,
          color: Color(0xFF01937c),
          size: 30.0,
        ),
      ),
      trailing: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        child: const Icon(
          CupertinoIcons.search,
          color: Color(0xFF01937c),
          size: 30.0,
        ),
      ),
      backgroundColor: CupertinoColors.white,
      border: null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

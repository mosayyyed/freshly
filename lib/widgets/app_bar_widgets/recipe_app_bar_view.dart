import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../../models/recipe_model.dart';
import '../../services/database_helper.dart';

class MyCupertinoRecipeAppBarView extends StatefulWidget
    implements PreferredSizeWidget {
  final RecipeModel recipe;

  const MyCupertinoRecipeAppBarView({super.key, required this.recipe});

  @override
  _MyCupertinoRecipeAppBarViewState createState() =>
      _MyCupertinoRecipeAppBarViewState();

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

class _MyCupertinoRecipeAppBarViewState
    extends State<MyCupertinoRecipeAppBarView> {
  late Future<bool> _isFavoriteFuture;
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _isFavoriteFuture = _checkIfFavorite();
  }

  Future<bool> _checkIfFavorite() async {
    final favorites = await _databaseHelper.getFavorites();
    return favorites.any((fav) => fav.id == widget.recipe.id);
  }

  void _toggleFavorite() async {
    final isFavorite = await _checkIfFavorite();
    if (isFavorite) {
      await _databaseHelper.deleteFavorite(widget.recipe.id);
    } else {
      await _databaseHelper.insertFavorite(widget.recipe);
    }
    setState(() {
      _isFavoriteFuture = _checkIfFavorite();
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: CupertinoColors.white,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
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
          FutureBuilder<bool>(
            future: _isFavoriteFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: null,
                  child: Icon(
                    CupertinoIcons.heart,
                    color: Color(0xff000000),
                    size: 20.0,
                  ),
                );
              } else {
                final isFavorite = snapshot.data ?? false;
                return CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: _toggleFavorite,
                  child: Icon(
                    isFavorite
                        ? CupertinoIcons.heart_fill
                        : CupertinoIcons.heart,
                    color: isFavorite
                        ? const Color(0xFF01937c)
                        : const Color(0xff000000),
                    size: 20.0,
                  ),
                );
              }
            },
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
}

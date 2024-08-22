import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class RecipeSummaryView extends StatelessWidget {
  final String summary;

  const RecipeSummaryView({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(summary);
  }
}

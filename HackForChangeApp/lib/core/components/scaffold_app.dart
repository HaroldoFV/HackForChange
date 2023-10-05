import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/extension.dart';
import 'package:flutter/material.dart';

class ScaffoldApp extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final AppBar? appbar;
  final List<Widget> body;
  final Color backgroundColor;
  final CrossAxisAlignment crossAxisAlignment;
  const ScaffoldApp({
    super.key,
    this.padding,
    this.appbar,
    required this.body,
    this.backgroundColor = Colors.white,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraint) {
            return ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                padding: padding ?? const EdgeInsets.symmetric(horizontal: 24),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                      child: Column(
                    crossAxisAlignment: crossAxisAlignment,
                    children: [
                      SizedBox(height: 20.hs),
                      ...body,
                      SizedBox(height: 40.hs),
                    ],
                  )),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

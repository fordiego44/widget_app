import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo("Busca la comida", "Et amet tempor enim ipsum ut aute irure et.",
      "assets/images/1.png"),
  SlideInfo(
      "Entrega rápida",
      "Proident duis ex proident sunt commodo elit incididunt proident aute.",
      "assets/images/2.png"),
  SlideInfo("Disfluta la comida", "Adipisicing amet dolor non ut.",
      "assets/images/3.png")
];

class AppTutorialScreen extends StatefulWidget {
  static const name = "tutorial_screen";

  const AppTutorialScreen({Key? key}) : super(key: key);

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageviewControler = PageController();
  bool endReached = false;
  double pagina = 0;

  @override
  void initState() {
    super.initState();

    pageviewControler.addListener(() {
      final page = pageviewControler.page ?? 0;
      if (!endReached && page >= slides.length - 1.5) { 
        setState(() {
          pagina = 2;
          endReached = true;
        });
      } else {
        if (endReached == true && page < slides.length - 1.5) { 
          setState(() {
          pagina = 1;
          endReached = false;
        });
        }
      }
    });
  }

  @override
  void dispose() {
    pageviewControler.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            PageView(
                controller: pageviewControler,
                physics: const BouncingScrollPhysics(),
                children: slides
                    .map(
                      (slideData) => _Slide(
                          title: slideData.title,
                          caption: slideData.caption,
                          imageUrl: slideData.imageUrl),
                    )
                    .toList()),
            Positioned(
                right: 20.0,
                top: 50.0,
                child: TextButton(
                    child: const Text("Salir"),
                    onPressed: () => context.pop())),
            endReached
                ? Positioned(
                    right: 30.0,
                    bottom: 30.0,
                    child: FadeInRight(
                      from: 15.0,
                      delay: const Duration(microseconds: 300),
                      child: FilledButton(
                          onPressed: () => context.pop(),
                          child: const Text("Comenzar")),
                    ))
                :   pagina != 0 ? Positioned(
                    right: 30.0,
                    bottom: 30.0,
                    child: FadeOutRight(
                      from: 15.0,
                      delay: const Duration(microseconds: 300),
                      child: FilledButton(
                          onPressed: () => context.pop(),
                          child: const Text("Comenzar")),
                    )) : const SizedBox()
          ],
        ));
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20.0),
            Text(title, style: titleStyle),
            const SizedBox(height: 10.0),
            Text(caption, style: captionStyle)
          ],
        ),
      ),
    );
  }
}

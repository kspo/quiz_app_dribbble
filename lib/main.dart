import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app_dribbble/bg_painter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;

  late AnimationController _cardAnimationController;
  late Animation<double> cardScaleAnimation,
      cardRotateAnimation,
      cardRadiusAnimation,
      cardTextAnimation;

  bool startTranslationAnimation = false;
  bool firstTranslationAnimation = false;

  final List<CardEntry> _cardList = [
    CardEntry(
      bigTitle: "Quick Play",
      title: "New",
      icon: CupertinoIcons.timer,
      iconColor: Colors.amber,
    ),
    CardEntry(
      bigTitle: "Events",
      title: "January",
      icon: CupertinoIcons.calendar_today,
      iconColor: const Color.fromARGB(255, 10, 225, 249),
    ),
    CardEntry(
      bigTitle: "Share",
      title: "Social Media",
      icon: CupertinoIcons.star,
      iconColor: const Color.fromARGB(255, 17, 200, 26),
    ),
    CardEntry(
      bigTitle: "Edit",
      title: "Settings",
      icon: CupertinoIcons.settings,
      iconColor: const Color.fromARGB(255, 237, 12, 200),
    )
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..forward().then(
        (value) => setState(() {
          firstTranslationAnimation = true;
        }),
      );
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 1, curve: Curves.easeInCubic),
      ),
    );

    _cardAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )
      ..forward()
      ..addListener(() {
        if (_cardAnimationController.value > 0.75) {
          setState(() {
            startTranslationAnimation = true;
          });
        }
        // print(
        //     "value: ${_cardAnimationController.value}, ${cardRotateAnimation.value}");
      });
    cardScaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _cardAnimationController,
        curve: const Interval(0.6, 1, curve: Curves.fastOutSlowIn),
      ),
    );
    cardRotateAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _cardAnimationController,
        curve: const Interval(0.6, 0.75, curve: Curves.ease),
      ),
    );
    cardRadiusAnimation = Tween<double>(begin: 100, end: 20).animate(
      CurvedAnimation(
        parent: _cardAnimationController,
        curve: const Interval(0.6, 0.95, curve: Curves.ease),
      ),
    );
    cardTextAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _cardAnimationController,
        curve: const Interval(0.85, 0.95, curve: Curves.easeInCubic),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return CustomPaint(
                  size: Size(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height),
                  painter: BgPainter(animationValue: animation.value),
                );
              },
            ),
            AnimatedBuilder(
              animation: _cardAnimationController,
              builder: (context, child) {
                return Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Opacity(
                        opacity: cardRotateAnimation.value,
                        child: const Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "David Cortney",
                                style: TextStyle(
                                    fontSize: 70,
                                    height: 0.9,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: -3,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Level",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18,
                                          height: 1,
                                          color: Colors.amber,
                                        ),
                                      ),
                                      Text(
                                        "06",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 40,
                                          height: 1,
                                          color: Colors.white,
                                          letterSpacing: -2,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Points",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18,
                                          height: 1,
                                          color: Colors.amber,
                                        ),
                                      ),
                                      Text(
                                        "3980",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 40,
                                          height: 1,
                                          color: Colors.white,
                                          letterSpacing: -2,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Rank",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18,
                                          height: 1,
                                          color: Colors.amber,
                                        ),
                                      ),
                                      Text(
                                        "720",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 40,
                                          height: 1,
                                          color: Colors.white,
                                          letterSpacing: -2,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Transform.scale(
                            scale: cardScaleAnimation.value,
                            child: Transform.rotate(
                              angle: 4 * pi * cardRotateAnimation.value,
                              origin: const Offset(0, 0),
                              child: SizedBox(
                                height:
                                    (MediaQuery.of(context).size.width / 1.15) +
                                        30,
                                child: Stack(
                                  clipBehavior: Clip.none, // görüntü kesilmesin
                                  alignment: Alignment.center,
                                  children: List.generate(4, (index) {
                                    return AnimatedPositioned(
                                      curve: Curves.elasticOut,
                                      duration:
                                          const Duration(milliseconds: 1500),
                                      left: (startTranslationAnimation
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.18 *
                                                  (index % 2)
                                              : MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4.36) +
                                          30,
                                      top: (startTranslationAnimation
                                              ? (index > 1
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.18
                                                  : 0)
                                              : MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4.36) +
                                          30,
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        height:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        child: Container(
                                          margin: EdgeInsets.zero,
                                          padding: EdgeInsets.all(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.0465),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                cardRadiusAnimation.value),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 15 *
                                                    cardTextAnimation.value,
                                                child: Text(
                                                  _cardList[index].title,
                                                  style: TextStyle(
                                                    color: const Color.fromARGB(
                                                        255, 15, 61, 245),
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.0395,
                                                    height: 0.8,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 25 *
                                                    cardTextAnimation.value,
                                                child: Divider(
                                                  color: _cardList[index]
                                                      .iconColor,
                                                  thickness: 2,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30 *
                                                    cardTextAnimation.value,
                                                child: Text(
                                                  _cardList[index].bigTitle,
                                                  style: TextStyle(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 15, 61, 245),
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.0535,
                                                      height: 1.2,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      letterSpacing: -1),
                                                ),
                                              ),
                                              const Spacer(),
                                              Opacity(
                                                opacity:
                                                    cardTextAnimation.value,
                                                child: Icon(
                                                  _cardList[index].icon,
                                                  size: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.1395,
                                                  color: _cardList[index]
                                                      .iconColor,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            // AnimatedBuilder(
            //     animation: _cardAnimationController,
            //     builder: (context, c) {
            //       return Positioned(
            //         bottom: (dummyCardAnimation.value *
            //                 MediaQuery.of(context).size.height /
            //                 2) -
            //             150,
            //         left: 0,
            //         right: 0,
            //         child: Row(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Transform.rotate(
            //               angle: 5 * pi * dummyCardAnimation.value,
            //               child: Container(
            //                 alignment: Alignment.center,
            //                 height: 300 *
            //                     dummyCardAnimation.value *
            //                     dummyCardScaleAnimation.value,
            //                 width: 300 *
            //                     dummyCardAnimation.value *
            //                     dummyCardScaleAnimation.value,
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(30),
            //                   color: Colors.white,
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       );
            //     })
          ],
        ),
      ),
    );
  }
}

class CardEntry {
  final String title;
  final String bigTitle;
  final IconData icon;
  final Color iconColor;

  CardEntry({
    required this.title,
    required this.bigTitle,
    required this.icon,
    required this.iconColor,
  });
}

import 'package:flutter/material.dart';
import 'package:healtho_gym/common/color_extension.dart';
import 'package:healtho_gym/common_widget/round_button.dart';
import 'package:healtho_gym/screen/login/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int selectPage = 0;
  PageController controller = PageController();

  List pageArr = [
    {
      "title": "Exercises",
      "subtitle": "To Your Personalized Profile",
      "image": "assets/img/in_1.png"
    },
    {
      "title": "Keep Eye On Health\nTracking",
      "subtitle": "Log & reminder your activities",
      "image": "assets/img/in_2.png"
    },
    {
      "title": "Check Your Progress",
      "subtitle": "An tracking calendar",
      "image": "assets/img/in_3.png"
    },
  ];

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        selectPage = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            alignment: Alignment.center,
            child: RoundButton(
                title: "Skip",
                height: 30,
                fontSize: 12,
                width: 70,
                fontWeight: FontWeight.w300,
                type: RoundButtonType.line,
                onPressed: () {
                  // Skip button action: Navigate to Login Screen
                  context.push(const LoginScreen()); // Skip to the Login Screen
                }),
          ),
        ],
      ),
      body: Stack(alignment: Alignment.center, children: [
        PageView.builder(
            controller: controller,
            itemCount: pageArr.length,
            itemBuilder: (context, index) {
              var pObj = pageArr[index] as Map? ?? {};

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Spacer(),
                  Text(
                    pObj["title"].toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    pObj["subtitle"].toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 15,
                    ),
                  ),
                  Container(
                    width: context.width,
                    height: context.width,
                    alignment: Alignment.center,
                    child: Image.asset(
                      pObj["image"],
                      width: context.width * 0.65,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const Spacer(),
                ],
              );
            }),
        SafeArea(
            child: Column(
              children: [
                const Spacer(flex: 2), // Reduced space above the "Next" button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pageArr.map((e) {
                    var index = pageArr.indexOf(e);

                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color:
                        index == selectPage ? TColor.primary : TColor.inactive,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20), // Add space between dots and button
                Padding(
                  padding: const EdgeInsets.only(bottom: 40), // Added padding to control position
                  child: RoundButton(
                    title: "Next",
                    width: 150,
                    onPressed: () {
                      if (selectPage >= 2) {
                        // Navigate to LoginScreen after the last page
                        context.push(const LoginScreen());
                      } else {
                        // Move to the next page
                        selectPage = selectPage + 1;
                        controller.animateToPage(
                          selectPage,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.bounceInOut,
                        );
                        setState(() {});
                      }
                    },
                  ),
                ),
              ],
            )),
      ]),
    );
  }
}
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

  List<Map<String, String>> pageArr = [
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
      "subtitle": "A tracking calendar",
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
    // Get screen dimensions
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            alignment: Alignment.center,
            child: RoundButton(
              title: "Skip",
              height: size.height * 0.04,
              fontSize: size.height * 0.015,
              width: size.width * 0.2,
              fontWeight: FontWeight.w300,
              type: RoundButtonType.line,
              onPressed: () {
                // Navigate to LoginScreen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
            ),
          ),
        ],
      ),
      body: Stack(alignment: Alignment.center, children: [
        PageView.builder(
          controller: controller,
          itemCount: pageArr.length,
          itemBuilder: (context, index) {
            final pObj = pageArr[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text(
                  pObj["title"] ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: size.height * 0.035,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  pObj["subtitle"] ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: size.height * 0.02,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: size.width,
                  height: size.height * 0.4,
                  alignment: Alignment.center,
                  child: Image.asset(
                    pObj["image"] ?? '',
                    width: size.width * 0.65,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const Spacer(),
              ],
            );
          },
        ),
        SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: pageArr.map((e) {
                  final index = pageArr.indexOf(e);

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    height: size.height * 0.01,
                    width: size.height * 0.01,
                    decoration: BoxDecoration(
                      color: index == selectPage
                          ? TColor.primary
                          : TColor.inactive,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.05),
                child: RoundButton(
                  title: "Next",
                  width: size.width * 0.4,
                  onPressed: () {
                    if (selectPage >= 2) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    } else {
                      selectPage = selectPage + 1;
                      controller.animateToPage(
                        selectPage,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

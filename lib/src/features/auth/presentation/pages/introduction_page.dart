import 'package:flutter/material.dart';
import 'package:libary_management/src/core/widget/components/custom_text.dart';
import 'package:libary_management/src/features/auth/presentation/pages/signin_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final controller = PageController();
  int currentPage = 0;
  final int totalPages = 3;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
          child: CustomText(text: '${currentPage + 1}/$totalPages'),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SigninPage(),
                ),
              );
            },
            child: const CustomText(text: 'Skip', fontSize: 16),
          ),
        ],
      ),
      body: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
          child: PageView(
            controller: controller,
            onPageChanged: (value) => {
              setState(() {
                currentPage = value;
              })
            },
            children: <Widget>[
              introduction(),
              pageMakePayment(),
              pageReceiveProducts(),
            ],
          )),
      bottomSheet: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextButton(
              onPressed: () {
                controller.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              },
              child: const Text('Previous'),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const ExpandingDotsEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  activeDotColor: Colors.black,
                  spacing: 8,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }

  Widget introduction() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('assets/images/Store.png'),
        const SizedBox(height: 20),
        const CustomText(
            text: 'Welcome to Libary Management', fontSize: 20, isBold: true),
        const SizedBox(height: 20),
        const CustomText(
          text: 'Manage your books with ease',
          fontSize: 16,
        ),
      ],
    );
  }

  Widget pageMakePayment() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('assets/images/Payment.png'),
        const SizedBox(height: 20),
        const CustomText(
            text: 'Welcome to Libary Management', fontSize: 20, isBold: true),
        const SizedBox(height: 20),
        const CustomText(
          text: 'Manage your books with ease',
          fontSize: 16,
        ),
      ],
    );
  }

  Widget pageReceiveProducts() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('assets/images/Get.png'),
        const SizedBox(height: 20),
        const CustomText(
            text: 'Welcome to Libary Management', fontSize: 20, isBold: true),
        const SizedBox(height: 20),
        const CustomText(
          text: 'Manage your books with ease',
          fontSize: 16,
        ),
      ],
    );
  }
}

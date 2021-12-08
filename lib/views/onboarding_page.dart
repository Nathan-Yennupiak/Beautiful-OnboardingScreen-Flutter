import 'package:flutter/material.dart';
import 'package:onboarding_screen/controllers/onboarding_controller.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class OnboardingPage extends StatefulWidget {
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _controller = OnboardingController();
  _storeOnboardInfo() async {
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('OnboardingPage', isViewed);
    print(prefs.getInt('OnboardingPage'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              PageView.builder(
                  controller: _controller.pageNavigation,
                  onPageChanged: _controller.selectedPageIndex,
                  itemCount: _controller.onboardingPages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 200,
                            width: 500,
                            child: Image.asset(
                                _controller.onboardingPages[index].imageAsset),
                          ),
                          SizedBox(height: 32),
                          Text(_controller.onboardingPages[index].title,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w500),),
                          SizedBox(height: 20),
                          Text(_controller.onboardingPages[index].description, style: TextStyle(
                              fontSize: 16),),
                        ],
                      ),
                    );
                  }),
              Positioned(
                  bottom: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                      List.generate(
                          _controller.onboardingPages.length, (index) =>
                          Obx(() {
                            return Container(
                              margin: const EdgeInsets.all(3),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: _controller.selectedPageIndex.value ==
                                    index ? Colors.indigoAccent : Colors.grey,
                                shape: BoxShape.circle,
                              ),
                            );
                          })
                      ),
                    ),
                  )
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: FloatingActionButton(
                  backgroundColor: Colors.indigoAccent,
                  onPressed: () {
                    _controller.forwardAction();

                    _controller.isLastPage ? Get.to(HomePage()) : null;
                    _storeOnboardInfo();

                  },
                  child: Obx(() {
                    return Text(_controller.isLastPage ? 'Start' : 'Next');
                  }),
                ),

              ),
              Positioned(
                top: 30,
                right: 20,
                child: InkWell(
                    onTap: () {
                      _storeOnboardInfo();
                      _displaySnackBar(context);
                      Get.to(HomePage());
                    },
                    child: Text('Skip', style: TextStyle(fontSize: 20,
                        color: Colors.indigoAccent,
                        fontWeight: FontWeight.w600))),
              ),
            ],
          ),
        )
    );
  }

  _displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(content: Text('Welcome to HomePage !'));
    _scaffoldKey.currentState?.showSnackBar(snackBar);
  }
}
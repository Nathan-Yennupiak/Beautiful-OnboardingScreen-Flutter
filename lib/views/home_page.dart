import 'package:flutter/material.dart';
import 'onboarding_page.dart';
import 'package:onboarding_screen/controllers/onboarding_controller.dart';

class HomePage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _controller = OnboardingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('BooksHub'),
          elevation: 0,
          centerTitle: true,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 2, right: 2),
            child: ListView.builder(
                controller: _controller.pageNavigation,
                itemCount: _controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  return (ListTile(
                    onTap: () {},
                    leading: Container(
                      height: 50,
                      width: 50,
                      child: Image.asset(
                          _controller.onboardingPages[index].imageAsset),
                    ),
                    title: Text(
                      _controller.onboardingPages[index].title,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle:
                        Text(_controller.onboardingPages[index].description),
                  ));
                }),
          ),
        ));
  }
}

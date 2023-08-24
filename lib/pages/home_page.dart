import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram_clone_application/consts/colors.dart';
import 'package:instagram_clone_application/widgets/share_bottomsheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDark,
        elevation: 0,
        title: Container(
          width: 128,
          height: 24,
          child: Image.asset('images/moodinger_logo.png'),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            width: 24,
            height: 24,
            child: Image.asset('images/icon_direct.png'),
          ),
        ],
      ),
      backgroundColor: kDark,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _getStoryListView(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _getPost(),
                childCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getStoryListView() {
    return Container(
      height: 120,
      child: ListView.builder(
        itemCount: 11,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            index == 0 ? _getAddStoryContainer() : _getStoryBox(index),
      ),
    );
  }

  // Widget _getPostListView() {
  //   return ListView.builder(
  //     shrinkWrap: true,
  //     physics: NeverScrollableScrollPhysics(),
  //     itemCount: 3,
  //     itemBuilder: (context, index) => _getPost(),
  //   );
  // }

  Widget _getPost() {
    return Column(
      children: [
        SizedBox(height: 16),
        _getPostBoxHeader(),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GestureDetector(
            onDoubleTap: () {
              setState(() {
                isLiked = !isLiked;
              });
            },
            child: Container(
              width: double.infinity,
              height: 390,
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset('images/post_cover.png'),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Image.asset(
                      'images/icon_video.png',
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                        child: Container(
                          width: 320,
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                              colors: [
                                kWhite.withOpacity(.5),
                                kWhite.withOpacity(.2),
                              ],
                            ),
                          ),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 16),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isLiked = !isLiked;
                                      });
                                    },
                                    child: Image.asset(
                                      isLiked
                                          ? 'images/icon_hart.png'
                                          : 'images/icon_heart_outlined.png',
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    '2.6 K',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: kWhite,
                                        fontFamily: 'Gilroy-Bold'),
                                  ),
                                ],
                              ),
                              SizedBox(width: 32),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Image.asset(
                                      'images/icon_comments.png',
                                      color: kWhite,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    '1.5 K',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: kWhite,
                                        fontFamily: 'Gilroy-Bold'),
                                  ),
                                ],
                              ),
                              SizedBox(width: 32),
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    barrierColor: Colors.transparent,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom,
                                        ),
                                        child: DraggableScrollableSheet(
                                          initialChildSize: .4,
                                          minChildSize: .2,
                                          maxChildSize: .7,
                                          builder:
                                              (context, scrollController) =>
                                                  ShareBottomsheet(
                                            scrollController: scrollController,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Image.asset(
                                  'images/icon_share.png',
                                  color: kWhite,
                                ),
                              ),
                              SizedBox(width: 42),
                              InkWell(
                                onTap: () {},
                                child: Image.asset(
                                  'images/icon_save.png',
                                  color: kWhite,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getPostBoxHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _getProfileBox(),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'amirahamdadibi',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Gilroy-Bold',
                  color: kWhite,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'امیراحمد برنامه‌نویس موبایل',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Shabnam-Medium',
                  color: kWhite,
                ),
              ),
            ],
          ),
          Spacer(),
          Image.asset('images/icon_menu.png'),
        ],
      ),
    );
  }

  Widget _getProfileBox() {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: kPink, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 44,
            height: 44,
            child: Image(
              image: AssetImage('images/profile.png'),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getStoryBox(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              border: Border.all(color: kPink, width: 2),
              borderRadius: BorderRadius.circular(17),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: 58,
                  height: 58,
                  child: Image(
                    image: AssetImage('images/profile.png'),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'User ' + index.toString(),
            style: TextStyle(
              color: kWhite,
              fontFamily: 'Gilroy-Medium',
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getAddStoryContainer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(17),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: kDark,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image(
                  image: AssetImage('images/bigplus.png'),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Your Story',
            style: TextStyle(
              color: kWhite,
              fontFamily: 'Gilroy-Medium',
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

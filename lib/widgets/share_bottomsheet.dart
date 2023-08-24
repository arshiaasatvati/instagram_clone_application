import 'dart:ui';

import 'package:flutter/material.dart';

import '../consts/colors.dart';

// ignore: must_be_immutable
class ShareBottomsheet extends StatelessWidget {
  ScrollController scrollController;
  ShareBottomsheet({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(36),
        topRight: Radius.circular(36),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 30,
          sigmaY: 30,
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                kWhite.withOpacity(.5),
                kWhite.withOpacity(.2),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: _getSheetHeader(),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 32)),
                    SliverToBoxAdapter(
                      child: _getSheetSearchBox(),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 32)),
                    SliverGrid(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return _getGridViewBox(index);
                      }, childCount: 40),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 16,
                          mainAxisExtent: 90),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.only(bottom: 90),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 32,
                  child: SizedBox(
                    width: 130,
                    height: 46,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Send',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getGridViewBox(int index) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset('images/profile.png'),
          ),
        ),
        SizedBox(height: 8),
        Text(
          'User ' + index.toString(),
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13,
            color: kWhite,
            fontFamily: 'Gilroy-bold',
          ),
        ),
      ],
    );
  }

  Widget _getSheetSearchBox() {
    return SizedBox(
      height: 46,
      child: TextField(
        textAlignVertical: TextAlignVertical.bottom,
        style: TextStyle(
          color: kWhite,
          fontSize: 14,
          fontFamily: 'Gilroy-bold',
        ),
        cursorColor: kWhite,
        decoration: InputDecoration(
          filled: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Image.asset(
              'images/icon_search.png',
            ),
          ),
          hintText: 'Search...',
          hintStyle: TextStyle(
            color: kWhite,
            fontSize: 14,
            fontFamily: 'Gilroy-bold',
          ),
          fillColor: kWhite.withOpacity(.4),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(13),
          ),
        ),
      ),
    );
  }

  Widget _getSheetHeader() {
    return Column(
      children: [
        SizedBox(height: 10),
        Image.asset(
          'images/home_indicator.png',
        ),
        SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Share',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Gilroy-bold',
                color: kWhite,
              ),
            ),
            Spacer(),
            Image.asset(
              'images/icon_sheetshare.png',
            ),
          ],
        ),
      ],
    );
  }
}

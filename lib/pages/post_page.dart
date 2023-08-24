import 'package:flutter/material.dart';
import 'package:instagram_clone_application/consts/colors.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDark,
        elevation: 0,
        title: Row(
          children: [
            SizedBox(width: 5),
            Text(
              'Post',
              style: TextStyle(
                color: kWhite,
                fontSize: 16,
                fontFamily: 'Gilroy-Bold',
              ),
            ),
            SizedBox(width: 8),
            Image.asset('images/icon_bottom_arrow.png'),
          ],
        ),
        actions: [
          Row(
            children: [
              Text(
                'Next',
                style: TextStyle(
                  color: kWhite,
                  fontSize: 16,
                  fontFamily: 'Gilroy-Bold',
                ),
              ),
              SizedBox(width: 8),
              Image.asset('images/icon_next.png'),
              SizedBox(width: 16),
            ],
          ),
        ],
      ),
      backgroundColor: kDark,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                // SliverToBoxAdapter(
                //   child: _getHeader(),
                // ),
                SliverToBoxAdapter(
                  child: _getSelectedPost(),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  sliver: _getGridView(),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(bottom: 75),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: kDarkBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Draft',
                      style: TextStyle(
                        color: kPink,
                        fontSize: 16,
                        fontFamily: 'Gilroy-Bold',
                      ),
                    ),
                    Text(
                      'Gallery',
                      style: TextStyle(
                        color: kWhite,
                        fontSize: 16,
                        fontFamily: 'Gilroy-Bold',
                      ),
                    ),
                    Text(
                      'Take',
                      style: TextStyle(
                        color: kWhite,
                        fontSize: 16,
                        fontFamily: 'Gilroy-Bold',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getGridView() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Container(
          decoration: BoxDecoration(
            color: kPink,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('images/image$index.png'),
            ),
          ),
        );
      }, childCount: 9),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
    );
  }

  Widget _getSelectedPost() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        width: double.infinity,
        height: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset('images/moon.png'),
          ),
        ),
      ),
    );
  }

  Widget _getHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Post',
                style: TextStyle(
                  color: kWhite,
                  fontSize: 16,
                  fontFamily: 'Gilroy-Bold',
                ),
              ),
              SizedBox(width: 8),
              Image.asset('images/icon_bottom_arrow.png'),
            ],
          ),
          Row(
            children: [
              Text(
                'Next',
                style: TextStyle(
                  color: kWhite,
                  fontSize: 16,
                  fontFamily: 'Gilroy-Bold',
                ),
              ),
              SizedBox(width: 8),
              Image.asset('images/icon_next.png'),
            ],
          ),
        ],
      ),
    );
  }
}

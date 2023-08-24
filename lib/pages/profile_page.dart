import 'package:flutter/material.dart';
import 'package:instagram_clone_application/consts/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDark,
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  toolbarHeight: 50,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(top: 32, right: 16),
                      child: Icon(Icons.menu),
                    ),
                  ],
                  backgroundColor: kDark,
                  expandedHeight: 170,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      'images/profile_header.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(14),
                    child: Container(
                      height: 14,
                      decoration: BoxDecoration(
                        color: kDark,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(36),
                          topRight: Radius.circular(36),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: _getHeaderDetails(),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _getBioDetails(),
                        SizedBox(height: 16),
                        _getFollowersDetails(),
                        SizedBox(height: 32),
                        _getActionButtons(),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: _getHighlights(),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverPersistentHeader(
                    pinned: true,
                    floating: true,
                    delegate: TabBarViewDelegate(
                      TabBar(
                        indicatorColor: kPink,
                        indicatorWeight: 4,
                        tabs: [
                          Tab(
                            icon: Image.asset('images/icon_posts.png'),
                          ),
                          Tab(
                            icon: Image.asset('images/icon_tags.png'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                _getGridView('item'),
                _getGridView('image'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getGridView(String image) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kPink,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('images/$image$index.png'),
                    ),
                  ),
                );
              },
              childCount: 9,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
          ),
        ),
      ],
    );
  }

  Widget _getBioDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'برنامه‌نویسی فلاتر و اندروید ، مدرس محبوب‌ترین',
          style: TextStyle(
            color: kWhite,
            fontFamily: 'Shabnam-Medium',
            fontSize: 12,
          ),
        ),
        Text(
          'دوره مکتب‌خونه و برنامه نویس سابق زرین پال',
          style: TextStyle(
            color: kWhite,
            fontFamily: 'Shabnam-Medium',
            fontSize: 12,
          ),
        ),
        Text(
          'تخصص برنامه نویسی یعنی آینده و تاثیر گذاری',
          style: TextStyle(
            color: kWhite,
            fontFamily: 'Shabnam-Medium',
            fontSize: 12,
          ),
        ),
        Text(
          'آموزش رایگان',
          style: TextStyle(
            color: kWhite,
            fontFamily: 'Shabnam-Medium',
            fontSize: 12,
          ),
        ),
        SizedBox(height: 6),
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              child: Image.asset('images/icon_link.png'),
            ),
            SizedBox(width: 6),
            Text(
              'yek.link/Amirahmad',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Gilroy-Bold',
                color: Color(0xFF55B9F7),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('images/icon_job.png'),
                SizedBox(width: 6),
                Text(
                  'Developer',
                  style: TextStyle(
                    color: kGrey,
                    fontSize: 12,
                    fontFamily: 'Gilroy-Bold',
                  ),
                ),
              ],
            ),
            SizedBox(width: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset('images/icon_location.png'),
                    SizedBox(width: 6),
                    Text(
                      'Iran',
                      style: TextStyle(
                        color: kGrey,
                        fontSize: 12,
                        fontFamily: 'Gilroy-Bold',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _getHeaderDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(color: kPink, width: 2),
              borderRadius: BorderRadius.circular(17),
            ),
            child: Padding(
              padding: EdgeInsets.all(3),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FittedBox(
                  child: Image.asset('images/profile.png'),
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          Container(
            height: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'امیر‌احمد برنامه‌نویس موبایل',
                  style: TextStyle(
                    color: kWhite,
                    fontSize: 14,
                    fontFamily: 'Shabnam-Medium',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'amirahmadadibi',
                  style: TextStyle(
                    color: kGrey,
                    fontSize: 14,
                    fontFamily: 'Gilroy-Bold',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset('images/icon_edit.png'),
        ],
      ),
    );
  }

  Widget _getFollowersDetails() {
    return Row(
      children: [
        Row(
          children: [
            Text(
              '23',
              style: TextStyle(
                fontSize: 14,
                color: kWhite,
                fontFamily: 'Gilroy-Bold',
              ),
            ),
            SizedBox(width: 6),
            Text(
              'Posts',
              style: TextStyle(
                fontSize: 12,
                color: kGrey,
                fontFamily: 'Gilroy-Medium',
              ),
            ),
          ],
        ),
        SizedBox(width: 16),
        Row(
          children: [
            Text(
              '16.2K',
              style: TextStyle(
                fontSize: 14,
                color: kWhite,
                fontFamily: 'Gilroy-Bold',
              ),
            ),
            SizedBox(width: 6),
            Text(
              'Followers',
              style: TextStyle(
                fontSize: 12,
                color: kGrey,
                fontFamily: 'Gilroy-Medium',
              ),
            ),
            SizedBox(width: 16),
            Row(
              children: [
                Text(
                  '280',
                  style: TextStyle(
                    fontSize: 14,
                    color: kWhite,
                    fontFamily: 'Gilroy-Bold',
                  ),
                ),
                SizedBox(width: 6),
                Text(
                  'Following',
                  style: TextStyle(
                    fontSize: 12,
                    color: kGrey,
                    fontFamily: 'Gilroy-Medium',
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _getActionButtons() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 46,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Follow'),
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: SizedBox(
            height: 46,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  width: 2,
                  color: kWhite,
                ),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Message',
                style: TextStyle(
                  color: kWhite,
                  fontSize: 16,
                  fontFamily: 'Gilroy-Bold',
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _getHighlights() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _getAddHighlightContainer(),
          _getHighlightItems('flutter_vip', 'Flutter VIP'),
          _getHighlightItems('support', 'Support'),
          _getHighlightItems('learning', 'Learning'),
          _getHighlightItems('sale', 'Sale'),
        ],
      ),
    );
  }

  _getHighlightItems(String image, String title) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
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
                      image: AssetImage('images/$image.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                '$title',
                style: TextStyle(
                  color: kWhite,
                  fontFamily: 'Gilroy-Medium',
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _getAddHighlightContainer() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                'New',
                style: TextStyle(
                  color: kWhite,
                  fontFamily: 'Gilroy-Medium',
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TabBarViewDelegate extends SliverPersistentHeaderDelegate {
  TabBarViewDelegate(this.tabBar);
  TabBar tabBar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: kDark,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

import 'package:flutter/material.dart';
import 'package:instagram_clone_application/consts/colors.dart';
import 'package:instagram_clone_application/data/model/enum/activity_enum.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDark,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 60,
              width: double.infinity,
              child: TabBar(
                labelStyle: TextStyle(
                  color: kWhite,
                  fontSize: 16,
                  fontFamily: 'Gilroy-Bold',
                ),
                controller: _tabController,
                indicatorColor: kPink,
                indicatorWeight: 4,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 32),
                tabs: [
                  Tab(
                    text: 'Following',
                    height: 60,
                  ),
                  Tab(
                    text: 'You',
                    height: 60,
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _getFollowingActivityContent(),
                  _getYouActivityContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getYouActivityContent() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 32, top: 32),
            child: Text(
              'New',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Gilroy-bold',
                color: kWhite,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return _getPageContent(ActivityStatus.following);
            }, childCount: 2),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 32, top: 0),
            child: Text(
              'Today',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Gilroy-bold',
                color: kWhite,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return _getPageContent(ActivityStatus.followBack);
            }, childCount: 3),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 32, top: 0),
            child: Text(
              'This Week',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Gilroy-bold',
                color: kWhite,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return _getPageContent(ActivityStatus.likes);
            }, childCount: 4),
          ),
        ),
      ],
    );
  }

  Widget _getFollowingActivityContent() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 32, top: 32),
            child: Text(
              'New',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Gilroy-bold',
                color: kWhite,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return _getPageContent(ActivityStatus.followBack);
            }, childCount: 2),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 32, top: 0),
            child: Text(
              'Today',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Gilroy-bold',
                color: kWhite,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return _getPageContent(ActivityStatus.following);
            }, childCount: 4),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 32, top: 0),
            child: Text(
              'This Week',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Gilroy-bold',
                color: kWhite,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return _getPageContent(ActivityStatus.likes);
            }, childCount: 4),
          ),
        ),
      ],
    );
  }

  Widget _getActivityStatus(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.followBack:
        return SizedBox(
          width: 70,
          height: 36,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Follow',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Gilroy-Bold',
                color: kWhite,
              ),
            ),
          ),
        );

      case ActivityStatus.following:
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              width: 2,
              color: kGrey,
            ),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Message',
            style: TextStyle(
              fontSize: 12,
              color: kGrey,
              fontFamily: 'Gilroy-Bold',
            ),
          ),
        );

      case ActivityStatus.likes:
        return Container(
          width: 45,
          height: 45,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('images/post_cover.png'),
            ),
          ),
        );

      default:
        return ElevatedButton(
          onPressed: () {},
          child: Text('Follow'),
        );
    }
  }

  Widget _getPageContent(ActivityStatus status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kPink,
            ),
          ),
          SizedBox(width: 6),
          Container(
            width: 40,
            height: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FittedBox(
                child: Image.asset('images/profile.png'),
              ),
            ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    'Amirahmadadibii',
                    style: TextStyle(
                      color: kWhite,
                      fontSize: 12,
                      fontFamily: 'Gilroy-bold',
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Started following',
                    style: TextStyle(
                      color: kGrey,
                      fontSize: 12,
                      fontFamily: 'Gilroy-Medium',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'you',
                    style: TextStyle(
                      color: kGrey,
                      fontSize: 12,
                      fontFamily: 'Gilroy-Medium',
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    '3min',
                    style: TextStyle(
                      color: kGrey,
                      fontSize: 10,
                      fontFamily: 'Gilroy-bold',
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          _getActivityStatus(status),
        ],
      ),
    );
  }
}

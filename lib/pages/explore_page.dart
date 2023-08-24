import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_clone_application/consts/colors.dart';
import 'package:instagram_clone_application/consts/strings.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.only(top: 24),
              ),
              SliverToBoxAdapter(
                child: _getSearchBox(),
              ),
              SliverPadding(
                padding: EdgeInsets.only(top: 24),
              ),
              SliverToBoxAdapter(
                child: _getCategoryList(),
              ),
              SliverPadding(
                padding: EdgeInsets.only(top: 24),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                sliver: _getGridView(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getSearchBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 46,
        child: TextField(
          style: TextStyle(
            color: kWhite,
            fontSize: 14,
            fontFamily: 'Gilroy-Bold',
          ),
          cursorColor: kWhite,
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(
                color: kWhite, fontSize: 14, fontFamily: 'Gilroy-Bold'),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Image.asset('images/icon_search.png'),
            ),
            suffixIcon: Image.asset('images/icon_scan.png'),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(13),
            ),
            filled: true,
            fillColor: kDarkBlue,
          ),
        ),
      ),
    );
  }

  Widget _getCategoryList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: exploreCategories.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              width: 70,
              height: 23,
              decoration: BoxDecoration(
                color: kDarkBlue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  exploreCategories[index],
                  style: TextStyle(
                    color: kWhite,
                    fontSize: 12,
                    fontFamily: 'Gilroy-bold',
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _getGridView() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kPink,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('images/item$index.png'),
            ),
          ),
        );
      }, childCount: 10),
      gridDelegate: SliverQuiltedGridDelegate(
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        pattern: [
          QuiltedGridTile(2, 1),
          QuiltedGridTile(2, 2),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/models.dart';
import '../components/components.dart';

class FriendPostListView extends StatelessWidget {
  //1
  final List<Post> friendsPosts;

  const FriendPostListView({
    Key? key,
    required this.friendsPosts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //25
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 0),
      //3
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //4
          Text('Social Chefs 👩‍🍳',
              style: Theme.of(context).textTheme.headline1),
          //5
          const SizedBox(height: 16),
          //TODO: Add PostListView
          //1
          ListView.separated(
            //2
            primary: false,
            //3
            physics: const NeverScrollableScrollPhysics(),
            //4
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: friendsPosts.length,
            itemBuilder: (context, index) {
              //5
              final post = friendsPosts[index];
              return FriendPostTile(post: post);
            },
            separatorBuilder: (context, index) {
              //6
              return const SizedBox(height: 16);
            },
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:game_ui/models/forms_model.dart';
import '../common/forum_name_widget.dart';
import '../common/forum_details_widget.dart';
import '../screens/details_screen.dart';

// ignore: must_be_immutable
class ForumCard extends StatelessWidget {
  Forum? forum;
  ForumCard({
    Key? key,
    required this.forum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(
                forum: forum,
              ),
            ));
      },
      child: Hero(
        tag: forum!.id!,
        child: SizedBox(
          width: 280.0,
          child: Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 60.0,
            ),
            elevation: 20,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Stack(
                children: [
                  Image.asset(
                    forum!.imagePath!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: ForumDetailsWidget(
                      forum: forum!,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 80,
                    child: ForumNameWidget(
                      forumText: forum!.title,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

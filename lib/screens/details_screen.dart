import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game_ui/common/test_style_widget.dart';
import 'package:game_ui/models/topic_model.dart';
import 'package:game_ui/styleguide/text_style.dart';
import '../models/forms_model.dart';
import '../common/app_bacground.dart';
import '../styleguide/colors.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  Forum? forum;
  DetailsScreen({
    Key? key,
    this.forum,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _fadeAnimation, _scaleAnimation;
  Animation<Offset>? _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller!);
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller!);
    _offsetAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(_controller!);
  }

  _playAnimation() {
    _controller!.reset();
    _controller!.forward();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppBackground(
            firstColor: firstOrangeCircleColor,
            secondColor: secondCircleColor,
            thirdColor: thirdCircleColor,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              if (!kIsWeb)
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: _playAnimation(),
                builder: (ctx, _) {
                  return FadeTransition(
                    opacity: _fadeAnimation!,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 120),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LabelTextWidget(
                            lable: 'topics',
                            value: widget.forum!.topics!.length.toString(),
                            valueStyle: whiteValueTextStyle,
                            labelStyle: whiteLabelTextStyle,
                          ),
                          LabelTextWidget(
                            lable: 'threads',
                            value: widget.forum!.threads,
                            valueStyle: whiteValueTextStyle,
                            labelStyle: whiteLabelTextStyle,
                          ),
                          LabelTextWidget(
                            lable: 'subs',
                            value: widget.forum!.subs,
                            valueStyle: whiteValueTextStyle,
                            labelStyle: whiteLabelTextStyle,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Hero(
                tag: widget.forum!.id!,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.only(topLeft: Radius.circular(45)),
                  child: Image.asset(
                    widget.forum!.imagePath!,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.only(topLeft: Radius.circular(45)),
              child: Container(
                height: 220,
                // width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Topics',
                        style: subHeadingStyle,
                      ),
                      Expanded(
                        child: SlideTransition(
                          position: _offsetAnimation!,
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              TopicTitle(
                                topic: widget.forum!.topics![0],
                              ),
                              TopicTitle(
                                topic: widget.forum!.topics![1],
                              ),
                              TopicTitle(
                                topic: widget.forum!.topics![2],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 200,
            child: ScaleTransition(
              scale: _scaleAnimation!,
              child: Material(
                elevation: 10,
                color: Colors.white,
                shape: const CircleBorder(),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    widget.forum!.rank!,
                    style: rankBigStyle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class TopicTitle extends StatelessWidget {
  Topic? topic;
  TopicTitle({Key? key, this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                topic!.question!,
                style: topicQuestinTextStyle,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: primaryColor,
                ),
                child: Text(
                  topic!.answerCount!,
                  style: topicAnswerCountTextStyle,
                ),
              )
            ],
          ),
          Text(
            topic!.recentAnswer!,
            style: topicAnswerTextStyle,
          ),
        ],
      ),
    );
  }
}

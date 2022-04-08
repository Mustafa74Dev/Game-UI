import 'topic_model.dart';

class Forum {
  int? id;
  String? title;
  String? imagePath;
  String? rank;
  List<Topic>? topics;
  String? threads;
  String? subs;
  Forum({
    this.id,
    this.title,
    this.imagePath,
    this.rank,
    this.topics,
    this.threads,
    this.subs,
  });
}

final fortniteForum = Forum(
    id: 1,
    title: "Fortnite",
    imagePath: "assets/images/fortnite.jpg",
    rank: "31",
    threads: "88",
    subs: "500+",
    topics: fortniteTopics);

final pubgForum = Forum(
    id: 2,
    title: "PUBG",
    imagePath: "assets/images/pubg.png",
    rank: "25",
    threads: "120",
    subs: "1000+",
    topics: pubgTopics);

final godOfWar = Forum(
    id: 3,
    title: "God Of War",
    imagePath: "assets/images/war.jpg",
    rank: "1",
    threads: "120",
    subs: "1000+",
    topics: pubgTopics);

final forums = [fortniteForum, pubgForum, godOfWar];

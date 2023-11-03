import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/src/models/tutor.dart';
import 'package:lettutor/src/tutor_list_page/tutor_specialties.dart';
import 'package:lettutor/src/tutor_list_page/tutor_details_page/video_app.dart';

import '../../custom_widgets/pro_heading1.dart';
import '../../custom_widgets/pro_header.dart';
import '../../custom_widgets/pro_toggle_button.dart';
import '../../helpers/padding.dart';
import 'tutor_card_minimal.dart';
import 'reviews_page/reviews_page.dart';

class TutorDetailsPage extends StatefulWidget {
  const TutorDetailsPage({
    super.key,
    required this.tutor,
  });

  final Tutor tutor;

  @override
  State<TutorDetailsPage> createState() => _TutorDetailsPageState();
}

class _TutorDetailsPageState extends State<TutorDetailsPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProHeader(
                title: 'Tutor Detail',
                start: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.chevron_left,
                      size: 30,
                      color: theme.colorScheme.primary,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.background,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Colors.grey,
                            offset: Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          TutorCardMinimal(tutor: widget.tutor),
                          vpad(5),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${widget.tutor.bio}",
                              maxLines: 4,
                              overflow: TextOverflow.fade,
                              style: theme.textTheme.bodyMedium,
                            ),
                          ),
                          vpad(5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: ProToggleButton(
                                  onPressed: () {
                                    setState(() {
                                      isFavorite = !isFavorite;
                                    });
                                  },
                                  selectedIcon: Icons.favorite,
                                  unselectedIcon: Icons.favorite_border,
                                  isSelected: isFavorite,
                                  label: "Favorite",
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                child: VerticalDivider(),
                              ),
                              Expanded(
                                child: ProToggleButton(
                                  onPressed: () {
                                    to(context, ReviewsPage());
                                  },
                                  selectedIcon: Icons.star,
                                  unselectedIcon: Icons.star_border,
                                  isSelected: false,
                                  label: "Reviews",
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                child: VerticalDivider(),
                              ),
                              Expanded(
                                child: ProToggleButton(
                                  onPressed: () {},
                                  selectedIcon: Icons.report,
                                  unselectedIcon: Icons.report_gmailerrorred,
                                  isSelected: false,
                                  label: "Report",
                                  color: theme.colorScheme.error,
                                ),
                              ),
                            ],
                          ),
                          vpad(5),
                          FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.edit_calendar),
                                hpad(5),
                                Text("Book now"),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProHeading1(text: "Education"),
                          Text(""
                              "Reiciendis blanditiis sunt non. Porro rem voluptatem eum. Perspiciatis blanditiis enim at at suscipit doloremque a."),
                          ProHeading1(text: "Languages"),
                          ProChipsFromString(string: "English, Vietnamese"),
                          ProHeading1(text: "Specialities"),
                          ProChipsFromString(
                              string: "Pwn, Re, Crypto, Web, Forensics"),
                          ProHeading1(text: "Introduction"),
                          // VideoApp(),
                          ProHeading1(text: "Suggested Courses"),
                          Row(
                            children: [
                              Text(
                                "Course 1",
                                style: theme.textTheme.titleSmall,
                              ),
                              ElevatedButton(
                                  onPressed: () {}, child: Text("Go")),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Course 2",
                                style: theme.textTheme.titleSmall,
                              ),
                              ElevatedButton(
                                  onPressed: () {}, child: Text("Go")),
                            ],
                          ),
                          ProHeading1(text: "Interests"),
                          Text(
                              "Cumque atque sapiente quibusdam laboriosam provident blanditiis suscipit modi quia. In odit rerum nemo inventore pariatur autem. Odio hic eveniet velit deleniti aut. Quod harum unde illum. Neque reiciendis et sit.Repudiandae dolorum voluptatum ut ab sit ab placeat doloremque. Molestias nemo commodi aut vitae dolorem. Labore tempora facilis voluptas enim ducimus voluptatum. Et nam delectus modi ut ad. Nostrum exercitationem et assumenda.Est ad eum recusandae repellat enim sunt iusto ea. Nulla repudiandae iusto impedit iste velit nesciunt accusamus nemo. Sint magnam voluptatem atque qui ad pariatur id fugiat. Voluptatum nam architecto ratione qui aut. Optio est molestiae eos nam ad ut eum quia. Ea et hic fugiat aut ut id esse fuga iure."),
                          ProHeading1(text: "Teaching Experience"),
                          Text(
                              "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              vpad(10),
            ],
          ),
        ),
      ),
    );
  }
}

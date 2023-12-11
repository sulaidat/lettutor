import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/login_page/auth.dart';
import 'package:lettutor/src/models/schedule_info.dart';
import 'package:lettutor/src/models/search_filter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lettutor/src/models/tutor_info.dart';
import 'package:lettutor/src/models/tutor_list.dart';
import 'package:provider/provider.dart';

import '../custom_widgets/pro_chips_from_string.dart';
import '../custom_widgets/pro_choice_chip.dart';
import '../custom_widgets/pro_fav_toggle_icon.dart';
import '../custom_widgets/pro_heading.dart';
import '../custom_widgets/pro_neg_button.dart';
import '../custom_widgets/pro_pos_button.dart';
import '../helpers/padding.dart';
import '../custom_widgets/pro_filter_chip.dart';
import 'profile_button.dart';
import 'upcoming_banner.dart';

class TutorListPage extends StatefulWidget {
  const TutorListPage({
    super.key,
  });

  @override
  State<TutorListPage> createState() => _TutorListPageState();
}

class _TutorListPageState extends State<TutorListPage> {
  String name = "";
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildTutorCard(BuildContext context, int index) {
    ThemeData theme = Theme.of(context);
    final tutorList = context.read<TutorList>();
    final tutor = tutorList.displayedTutors[index];

    return GestureDetector(
      onTap: () {
        // context.push('/list/0');
        context.push('/tutor/${tutor.id}');
      },
      child: Container(
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
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: Image.network(
                    "${tutor.imageUrl}",
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                hpad(5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${tutor.name}",
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onBackground,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.flag),
                          Text("${tutor.country}"),
                        ],
                      ),
                      Row(
                        children: [
                          RatingBarIndicator(
                            itemBuilder: (context, index) => Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                            ),
                            rating: tutor.rating!,
                            unratedColor: Colors.grey,
                            itemCount: 5,
                            itemSize: 20.0,
                          ),
                          hpad(5),
                          Text(tutor.rating!.toStringAsFixed(1)),
                        ],
                      ),
                    ],
                  ),
                ),
                ProFavToggleIcon(
                  tutorId: tutor.id,
                  hook: (isToggled) {},
                )
              ],
            ),
            vpad(5),
            ProChipsFromList(
              list: tutor.specialties!.toList(),
            ),
            vpad(5),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "${tutor.bio}",
                maxLines: 4,
                overflow: TextOverflow.fade,
                style: theme.textTheme.bodyMedium,
              ),
            )
          ],
        ),
      ),
    );
  }

  var key = UniqueKey();

  Widget _buildEndDrawer() {
    if (!mounted) return Container();
    final tutorInfo = context.read<TutorInfo>();
    final searchFilter = context.read<SearchFilter>();
    final nameController = TextEditingController(text: searchFilter.name);
    return Drawer(
      key: key,
      width: MediaQuery.of(context).size.width * .85,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Heading1(text: "Filter"),
                  Divider(),
                  vpad(10),
                  Heading2(text: "Name"),
                  // TODO: Implement auto complete
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Enter tutor name',
                    ),
                  ),
                  vpad(10),
                  Heading2(text: "Nationality"),
                  ProFilterChip(
                    all: tutorInfo.availNationalities.toList(),
                    selected: searchFilter.nationalities.toList(),
                    hook: (selected) {
                      searchFilter.nationalities = selected;
                    },
                  ),
                  vpad(10),
                  Heading2(text: "Specialties"),
                  ProFilterChip(
                    all: tutorInfo.availSpecialities.toList(),
                    selected: searchFilter.specialties.toList(),
                    hook: (selected) {
                      searchFilter.specialties = selected;
                    },
                  ),
                  Heading2(text: "Sort"),
                  ProChoiceChip(
                    all: {"Favorite", "Rating", "Price"},
                    selected: searchFilter.sort,
                    hook: (selected) {
                      if (selected != null) {
                        searchFilter.sort = selected;
                      }
                    },
                  ),
                  vpad(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProNegButton(
                        label: "Reset",
                        onPressed: () {
                          searchFilter.nationalities.clear();
                          searchFilter.specialties.clear();
                          nameController.clear();
                          setState(() {
                            key = UniqueKey();
                          });
                        },
                      ),
                      ProPosButton(
                        label: "Confirm",
                        icon: Icon(Icons.search),
                        onPressed: () {
                          final tutorList = context.read<TutorList>();
                          tutorList.displayedTutors = tutorList.tutors;
                          searchFilter.name = nameController.text;
                          print(searchFilter);
                          if (searchFilter.name != "") {
                            tutorList.filterByName(searchFilter.name);
                          }
                          if (searchFilter.nationalities.isNotEmpty) {
                            tutorList.filtelByNationalities(
                                searchFilter.nationalities.toList());
                          }
                          if (searchFilter.specialties.isNotEmpty) {
                            tutorList.filterBySpecialty(
                                searchFilter.specialties.toList());
                          }
                          if (searchFilter.sort != "") {
                            tutorList.sortBy(searchFilter.sort);
                          }
                          setState(() {});
                          scaffoldKey.currentState?.closeEndDrawer();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final auth = Auth();
    final scheduleInfo = context.watch<ScheduleInfo>();

    return Scaffold(
      drawerEnableOpenDragGesture: false,
      endDrawerEnableOpenDragGesture: false,
      endDrawer: _buildEndDrawer(),
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Text(
              //       auth.username, // replace with your username variable
              //       style: TextStyle(fontSize: 16),
              //     ),
              //     IconButton(
              //       icon: CircleAvatar(
              //         backgroundImage: NetworkImage(
              //             auth.avatar), // replace with your image url
              //         radius: 20,
              //       ),
              //       onPressed: () {
              //         context.push('/settings');
              //       },
              //     ),
              //     hpad(20),
              //   ],
              // ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    if (scheduleInfo.bookedLessons!.isNotEmpty) // Add this line
                      UpcomingBanner(onJoin: () {
                        context.push('/meet/wait');
                      }),
                    vpad(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Pick a tutor",
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: theme.colorScheme.onBackground,
                            )),
                        TextButton(
                          onPressed: () {
                            scaffoldKey.currentState?.openEndDrawer();
                          },
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.filter_list_rounded,
                                size: 20,
                                color: Colors.grey,
                              ),
                              hpad(5),
                              Text("Filter",
                                  style: theme.textTheme.labelMedium
                                      ?.copyWith(color: Colors.grey)),
                            ],
                          ),
                        )
                      ],
                    ),
                    vpad(10),
                    ListView.separated(
                      itemBuilder: (context, index) {
                        return _buildTutorCard(context, index);
                      },
                      shrinkWrap: true,
                      itemCount:
                          context.read<TutorList>().displayedTutors.length,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => vpad(10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

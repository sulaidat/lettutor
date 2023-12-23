import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/api/tutor_api.dart';
import 'package:lettutor/src/api/user_api.dart';
import 'package:lettutor/src/login_page/auth.dart';
import 'package:lettutor/src/models/schedule_info.dart';
import 'package:lettutor/src/models/search_filter.dart';
import 'package:lettutor/src/models/tutor/tutor.dart';
// import 'package:lettutor/src/models/tutor/tutor.dart';
import 'package:lettutor/src/models/tutor_info.dart';
import 'package:lettutor/src/models/tutor_list.dart';
import 'package:lettutor/src/tutor_list_page/tutor_card.dart';
import 'package:provider/provider.dart';

import '../custom_widgets/pro_chips_from_string.dart';
import '../custom_widgets/pro_choice_chip.dart';
import '../custom_widgets/pro_fav_toggle_icon.dart';
import '../custom_widgets/pro_heading.dart';
import '../custom_widgets/pro_neg_button.dart';
import '../custom_widgets/pro_pos_button.dart';
import '../helpers/padding.dart';
import '../custom_widgets/pro_filter_chip.dart';
import 'upcoming_banner.dart';

class TutorListPage extends StatefulWidget {
  const TutorListPage({
    super.key,
  });

  @override
  State<TutorListPage> createState() => _TutorListPageState();
}

class _TutorListPageState extends State<TutorListPage> {
  var key = UniqueKey();
  String name = "";
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isLoading = true;
  bool _noMoreTutors = false;
  int _page = 1;
  final ScrollController _scrollController = ScrollController();
  List<Tutor> _tutors = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_endOfList);
  }

  _endOfList() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _fetchTutors();
    }
  }

  _fetchTutors() async {
    await TutorApi.getListTutorWithPage(
      page: _page,
      perPage: 100,
      token: AppState.token.access!.token!,
    ).then((value) {
      setState(() {
        if (value.length == 0) {
          _noMoreTutors = true;
          _scrollController.removeListener(_endOfList);
          return;
        }
        _page++;
        _tutors.addAll(value as List<Tutor>);
        _isLoading = false;
      });
    }).catchError((e) {
      print(e);
    });
  }

  Widget _buildEndDrawer() {
    if (!mounted) return Container();
    // final tutorInfo = context.read<TutorInfo>();
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
                  // ProFilterChip(
                  //   all: tutorInfo.availNationalities.toList(),
                  //   selected: searchFilter.nationalities.toList(),
                  //   hook: (selected) {
                  //     searchFilter.nationalities = selected;
                  //   },
                  // ),
                  vpad(10),
                  Heading2(text: "Specialties"),
                  // ProFilterChip(
                  //   all: tutorInfo.availSpecialities.toList(),
                  //   selected: searchFilter.specialties.toList(),
                  //   hook: (selected) {
                  //     searchFilter.specialties = selected;
                  //   },
                  // ),
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

    if (_isLoading) {
      _fetchTutors();
    }

    return Scaffold(
      drawerEnableOpenDragGesture: false,
      endDrawerEnableOpenDragGesture: false,
      endDrawer: _buildEndDrawer(),
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    vpad(10),
                    UpcomingBanner(),
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
                    _isLoading
                        ? Center(child: CircularProgressIndicator())
                        : ListView.separated(
                            itemCount: _noMoreTutors
                                ? _tutors.length
                                : _tutors.length + 1,
                            itemBuilder: (context, index) {
                              if (index == _tutors.length) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              return TutorCard(tutor: _tutors[index]);
                            },
                            shrinkWrap: true,
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

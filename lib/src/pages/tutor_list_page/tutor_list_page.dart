import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/api/tutor_api.dart';
import 'package:lettutor/src/api/user_api.dart';
import 'package:lettutor/src/custom_widgets/pro_chips_from_string.dart';
import 'package:lettutor/src/custom_widgets/pro_filter_chip.dart';
import 'package:lettutor/src/custom_widgets/rating_bar.dart';
import 'package:lettutor/src/pages/login_page/auth.dart';
import 'package:lettutor/src/models/tutor/search_info.dart';
import 'package:lettutor/src/models/tutor/tutor.dart';
import 'package:lettutor/src/routes.dart';

import '../../custom_widgets/pro_avatar.dart';
import '../../custom_widgets/pro_choice_chip.dart';
import '../../custom_widgets/pro_heading.dart';
import '../../custom_widgets/pro_neg_button.dart';
import '../../custom_widgets/pro_pos_button.dart';
import '../../helpers/padding.dart';
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
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> _allSpecialties = [];
  List<String> _nationality = [];
  String _sort = "";
  List<String> _specialties = [];

  final ScrollController _scrollController = ScrollController();
  List<Tutor> _tutors = [];
  final TextEditingController _nameController = TextEditingController();
  SearchInfo? searchInfo;
  int _perPage = 20;
  int _page = 1;

  bool _isLoading = false;
  bool _isSearching = false;
  bool _dontLoadMore = false;

  @override
  void initState() {
    super.initState();
    _getUserInfo();
    _getFirstPage();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getNextPage();
      }
    });
  }

  _getUserInfo() async {
    try {
      var user = await UserApi.getUserInfo();
      AppState.user = user;
    } catch (e) {
      print(e.toString());
    }
  }

  _getFirstPage() async {
    setState(() {
      _page = 1;
      _isLoading = true;
    });

    _tutors = await TutorApi.searchTutor(_perPage, 1, searchInfo);
    if (_sort == "Favorite") {
      _tutors.sort((a, b) {
        if (a.isFavoriteTutor == b.isFavoriteTutor) {
          return 0;
        } else if (a.isFavoriteTutor == true) {
          return -1;
        } else {
          return 1;
        }
      });
    } else if (_sort == "Rating") {
      _tutors.sort((a, b) {
        if (a.rating == b.rating) {
          return 0;
        } else if (a.rating == null) {
          return 1;
        } else if (b.rating == null) {
          return -1;
        } else {
          return b.rating!.compareTo(a.rating!);
        }
      });
    }

    // wrong behavior, but i do this for now
    if (!_isSearching) {
      _allSpecialties = _tutors
          .map((e) => str2list(e.specialties as String))
          .expand((element) => element)
          .toSet()
          .toList();
    }

    setState(() {
      _page++;
      _isLoading = false;
      _dontLoadMore = _tutors.length > 1 ? false : true;
    });
  }

  _getNextPage() async {
    setState(() {
      _isLoading = true;
    });

    try {
      List<Tutor> nextPage =
          await TutorApi.searchTutor(_perPage, _page, searchInfo);
      if (nextPage.isNotEmpty) {
        if (_isSearching) {
          _allSpecialties.addAll(nextPage
              .map((e) => str2list(e.specialties as String))
              .expand((element) => element)
              .toSet()
              .toList());
        }
      }

      setState(() {
        if (nextPage.isEmpty) {
          _dontLoadMore = true;
        } else {
          _page++;
          _tutors.addAll(nextPage);
        }
        _isLoading = false;
      });
    } catch (e) {
      print("[TutorListPage::_getNextPage] $e");
    }
  }

  _search(List<String> specialties, bool isVietnamese, bool isNative,
      String name) async {
    _isSearching = true;
    SearchInfo info = SearchInfo();
    info.search = name;
    info.filters = Filters(
      specialties: specialties,
      nationality: Nationality(
        isVietnamese: isVietnamese,
        isNative: isNative,
      ),
    );
    searchInfo = info;
    _getFirstPage();
    Navigator.pop(context);
  }

  _resetSearch() {
    _isSearching = false;
    searchInfo = null;
    _sort = "";
    _nameController.clear();
    _getFirstPage();
    Navigator.pop(context);
  }

  Widget _buildEndDrawer() {
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
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Enter tutor name',
                    ),
                  ),
                  vpad(10),
                  Heading2(text: "Nationality"),
                  ProFilterChip(
                    all: ["Vietnamese", "Native"],
                    selected: _nationality,
                    hook: (selected) {
                      _nationality = selected.toList();
                    },
                  ),
                  vpad(10),
                  Heading2(text: "Specialties"),
                  ProFilterChip(
                    all: _allSpecialties,
                    selected: _specialties,
                    hook: (selected) {
                      _specialties = selected.toList();
                    },
                  ),
                  Heading2(text: "Sort"),
                  ProChoiceChip(
                    all: {"Favorite", "Rating"},
                    selected: _sort,
                    hook: (selected) {
                      if (selected != null) {
                        _sort = selected;
                      }
                    },
                  ),
                  vpad(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProNegButton(label: "Reset", onPressed: _resetSearch),
                      ProPosButton(
                        label: "Confirm",
                        icon: Icon(Icons.search),
                        onPressed: () {
                          _search(
                              _specialties,
                              _nationality.contains('Vietnamese'),
                              _nationality.contains('Native'),
                              _nameController.value.text);
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

  _changeFavorite(String userId) async {
    try {
      return await TutorApi.changeFavorite(
        token: AppState.token.access!.token!,
        tutorId: userId,
      );
    } catch (e) {
      print(e.toString());
    }
  }

  _buildTutorCard(BuildContext context, Tutor tutor) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        context
            .pushNamed(
          routeName['/tutor/detail']!,
          queryParameters: {'tutorId': tutor.userId},
          extra: tutor,
        )
            .then((value) {
          _getFirstPage();
        });
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
                ProAvatar(url: tutor.avatar ?? ""),
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
                      tutor.rating == null
                          ? Text("No rating")
                          : RatingBar(rating: tutor.rating!),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        tutor.isFavoriteTutor = !(tutor.isFavoriteTutor!);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            tutor.isFavoriteTutor!
                                ? "Added to favorite"
                                : "Removed from favorite",
                          ),
                          duration: Duration(seconds: 1),
                        ),
                      );
                      _changeFavorite(tutor.userId!).catchError((e) {
                        setState(() {
                          tutor.isFavoriteTutor = !(tutor.isFavoriteTutor!);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Error: ${e.toString()}",
                            ),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      });
                    },
                    icon: (tutor.isFavoriteTutor ?? false)
                        ? Icon(Icons.favorite, color: Colors.red)
                        : Icon(
                            Icons.favorite_border,
                            color: Colors.grey,
                          )),
                // ProFavToggleIcon(
                //   tutorId: tutor.id!,
                //   hook: (isToggled) async {},
                // )
              ],
            ),
            vpad(5),
            ProChipsFromList(
              list: str2list(tutor.specialties as String),
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                    _tutors.isEmpty
                        ? _isLoading
                            ? Center(child: CircularProgressIndicator())
                            : Text("There is no matched tutor")
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) => vpad(10),
                            itemCount: _dontLoadMore
                                ? _tutors.length
                                : _tutors.length + 1,
                            itemBuilder: (context, index) {
                              if (index == _tutors.length) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else {
                                return _buildTutorCard(context, _tutors[index]);
                              }
                            },
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

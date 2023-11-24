import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/models/search_filter.dart';
import 'package:lettutor/src/models/tutor.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lettutor/src/models/tutor_info.dart';
import 'package:provider/provider.dart';

import '../custom_widgets/pro_chips_from_string.dart';
import '../helpers/padding.dart';
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
  List<int> _favoriteIdx = [];
  List<Tutor> _tutors = [
    Tutor(
        imageUrl: "assets/imgs/avt.jpg",
        name: "Hanna Graham",
        bio:
            "Aliquid beatae esse dolorem corporis ex. Et quidem qui nam numquam doloremque. Quaerat molestias repellat aut sint."),
    Tutor(
        imageUrl: "assets/imgs/avt.jpg",
        name: "Gretchen Orn",
        bio:
            "Aliquid beatae esse dolorem corporis ex. Et quidem qui nam numquam doloremque. Quaerat molestias repellat aut sint."),
    Tutor(
        imageUrl: "assets/imgs/avt.jpg",
        name: "Marvin McClure",
        bio:
            "Aliquid beatae esse dolorem corporis ex. Et quidem qui nam numquam doloremque. Quaerat molestias repellat aut sint."),
    Tutor(
        imageUrl: "assets/imgs/avt.jpg",
        name: "Demarco Purdy",
        bio:
            "Aliquid beatae esse dolorem corporis ex. Et quidem qui nam numquam doloremque. Quaerat molestias repellat aut sint."),
    Tutor(
        imageUrl: "assets/imgs/avt.jpg",
        name: "Paris Bernier",
        bio:
            "Aliquid beatae esse dolorem corporis ex. Et quidem qui nam numquam doloremque. Quaerat molestias repellat aut sint."),
    Tutor(
        imageUrl: "assets/imgs/avt.jpg",
        name: "Katelin Tromp",
        bio:
            "Aliquid beatae esse dolorem corporis ex. Et quidem qui nam numquam doloremque. Quaerat molestias repellat aut sint."),
    Tutor(
        imageUrl: "assets/imgs/avt.jpg",
        name: "Linnie Stehr",
        bio:
            "Aliquid beatae esse dolorem corporis ex. Et quidem qui nam numquam doloremque. Quaerat molestias repellat aut sint."),
    Tutor(
        imageUrl: "assets/imgs/avt.jpg",
        name: "Abdullah Hills",
        bio:
            "Aliquid beatae esse dolorem corporis ex. Et quidem qui nam numquam doloremque. Quaerat molestias repellat aut sint."),
    Tutor(
        imageUrl: "assets/imgs/avt.jpg",
        name: "Torey Watsica",
        bio:
            "Aliquid beatae esse dolorem corporis ex. Et quidem qui nam numquam doloremque. Quaerat molestias repellat aut sint."),
  ];

  String name = "";
  List<String> availNationality = properSpit("Vietnamese, English");
  List<String> availSpecialties =
      properSpit("All, Reversing, Pwn, Web, Cryptography, Forensics");
  List<String> selectedNationality = [];
  List<String> selectedSpecialties = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildTutorCard(BuildContext context, int index) {
    ThemeData theme = Theme.of(context);
    Tutor tutor = _tutors[index];
    bool isFavorite = false;
    if (_favoriteIdx.contains(index)) isFavorite = true;

    return GestureDetector(
      onTap: () {
        context.push('/list/0');
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
                  child: Image.asset(
                    "${tutor.imageUrl}",
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                hpad(10),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
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
                          Text("Vietnam"),
                        ],
                      ),
                      RatingBarIndicator(
                        itemBuilder: (context, index) => Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                        ),
                        rating: 3,
                        unratedColor: Colors.grey,
                        itemCount: 5,
                        itemSize: 20.0,
                      ),
                    ],
                  ),
                ),
                ToggleIcon(
                  onPressed: () {
                    setState(() {
                      if (isFavorite) {
                        _favoriteIdx.remove(index);
                      } else {
                        _favoriteIdx.add(index);
                      }
                      isFavorite = !isFavorite;
                    });
                  },
                  value: isFavorite,
                )
              ],
            ),
            vpad(5),
            ProChipsFromList(
              all: properSpit(
                  "a, aa, aaa, aaaa, aa aa, aaaaaaa, , verylonggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg"),
              selected: [],
              onSelect: (_) {},
              onUnselect: (_) {},
              disabled: true,
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

  Widget _buildEndDrawer() {
    final nameController = TextEditingController();
    final tutorInfo = context.read<TutorInfo>();
    final searchFilter = context.read<SearchFilter>();
    return Drawer(
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
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Enter tutor name',
                    ),
                  ),
                  vpad(10),
                  Heading2(text: "Nationality"),
                  ProFilterChip(
                    allCat: tutorInfo.availNationalities.toList(),
                    hook: (value) {
                      searchFilter.nationalities = value;
                    },
                  ),
                  vpad(10),
                  Heading2(text: "Specialties"),
                  ProFilterChip(
                    allCat: tutorInfo.availSpecialities.toList(),
                    hook: (value) {
                      searchFilter.specialties = value;
                    },
                  ),
                  vpad(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedNegButton(
                        label: "Reset",
                        onPressed: () {
                          setState(() {
                            searchFilter.nationalities.clear();
                            searchFilter.specialties.clear();
                            nameController.clear();
                          });
                        },
                      ),
                      FilledPosButton(
                        label: "Confirm",
                        icon: Icon(Icons.search),
                        onPressed: () {
                          name = nameController.text;
                          print(name);
                          print(searchFilter.nationalities);
                          print(searchFilter.specialties);
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

    return Scaffold(
      drawerEnableOpenDragGesture: false,
      endDrawerEnableOpenDragGesture: false,
      endDrawer: _buildEndDrawer(),
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ProfileButton(),
                  hpad(20),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
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
                      itemCount: _tutors.length,
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

// TODO : Make a three-state filter chip
class ProFilterChip extends StatefulWidget {
  const ProFilterChip({super.key, required this.allCat, required this.hook});

  final List<String> allCat;
  final ValueChanged<Set<String>> hook;

  @override
  State<ProFilterChip> createState() => _ProFilterChipState();
}

class _ProFilterChipState extends State<ProFilterChip> {
  Set<String> filter = {};

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: 0,
        runSpacing: 0,
        children: widget.allCat.map((e) {
          bool isSelected = filter.contains(e);
          return FilterChip(
            label: Text(
              e,
              style: TextStyle(
                fontSize: 12,
                color: isSelected
                    ? theme.colorScheme.onPrimary // Updated label color
                    : theme.colorScheme.onSecondaryContainer,
              ),
            ),
            selected: isSelected,
            onSelected: (bool value) {
              setState(() {
                if (value) {
                  filter.add(e);
                } else {
                  filter.remove(e);
                }
              });
              widget.hook(filter);
            },
            side: BorderSide.none,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(200),
            ),
            visualDensity: VisualDensity.compact,
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            selectedColor: Theme.of(context).colorScheme.primary,
          );
        }).toList(),
      ),
    );
  }
}

class ToggleIcon extends StatelessWidget {
  const ToggleIcon({
    super.key,
    required this.value,
    required this.onPressed,
    this.onIcon = const Icon(
      Icons.favorite,
      color: Colors.pink,
    ),
    this.offIcon = const Icon(
      Icons.favorite_border_outlined,
      color: Colors.pink,
    ),
  });

  final Widget onIcon, offIcon;
  final Function() onPressed;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: value ? onIcon : offIcon,
    );
  }
}

class ProNegButton extends StatelessWidget {
  const ProNegButton({super.key, required this.label, this.icon});
  final String label;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.black12),
      ),
      child: Text(
        label,
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}

class FilledPosButton extends StatelessWidget {
  const FilledPosButton({
    Key? key,
    required this.label,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  final String label;
  final Icon? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      child: Row(
        children: [
          icon ?? SizedBox.shrink(),
          Text(label),
        ],
      ),
    );
  }
}

class OutlinedNegButton extends StatelessWidget {
  const OutlinedNegButton({
    Key? key,
    required this.label,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  final String label;
  final Icon? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.red),
      ),
      child: Row(
        children: [
          icon ?? SizedBox.shrink(),
          Text(
            label,
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}

class Heading1 extends StatelessWidget {
  final String text;

  const Heading1({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class Heading2 extends StatelessWidget {
  final String text;

  const Heading2({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class Heading3 extends StatelessWidget {
  final String text;

  const Heading3({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

List<String> properSpit(String s) {
  List<String> list = [];
  var arr = s.split(',');
  for (var element in arr) {
    if (element.trim() != "") {
      list.add(element.trim());
    }
  }
  return list;
}

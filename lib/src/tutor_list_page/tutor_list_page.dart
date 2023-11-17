import 'package:flutter/material.dart';
import 'package:lettutor/src/models/tutor.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../custom_widgets/pro_chips_from_string.dart';
import '../helpers/padding.dart';
import 'profile_button.dart';
import 'upcoming_banner.dart';

class TutorListPage extends StatefulWidget {
  const TutorListPage({
    super.key,
    required this.onItemSelect,
    required this.onJoinMeeting,
  });

  final VoidCallback onItemSelect;
  final VoidCallback onJoinMeeting;

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
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildTutorCard(BuildContext context, int index) {
    ThemeData theme = Theme.of(context);
    Tutor tutor = _tutors[index];
    bool isFavorite = false;
    if (_favoriteIdx.contains(index)) isFavorite = true;

    return GestureDetector(
      onTap: widget.onItemSelect,
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
            ProChipsFromString(
              string:
                  "a, aa, aaa, aaaa, aa aa, aaaaaaa, , verylonggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg",
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
    final theme = Theme.of(context);
    return Drawer(
      width: MediaQuery.of(context).size.width * .85,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vpad(20),
                Row(
                  children: [
                    hpad(20),
                    Text(
                      "Filter",
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    hpad(20),
                    Text(
                      "Name",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  // controller: controller,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Enter tutor name',
                    // contentPadding:
                    // EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  ),
                ),
                vpad(10),
                Row(
                  children: [
                    hpad(20),
                    Text(
                      "Nationality",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                ProChipsFromString(string: "Vietnamese, English"),
                vpad(10),
                Row(
                  children: [
                    hpad(20),
                    Text(
                      "Specialities",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                ProChipsFromString(
                    string:
                        "All, Reversing, Pwn, Web, Cryptography, Forensics"),
                vpad(10),
                Divider(),
                vpad(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProNegButton(label: "Reset"),
                    ProPosButton(
                      label: "Confirm",
                      icon: Icon(Icons.search),
                    ),
                  ],
                ),
              ],
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
                    UpcomingBanner(onJoin: widget.onJoinMeeting),
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

class ProPosButton extends StatelessWidget {
  const ProPosButton({
    super.key,
    required this.label,
    this.icon,
  });

  final String label;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      child: Row(
        children: [
          icon ?? SizedBox.shrink(),
          Text(label),
        ],
      ),
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

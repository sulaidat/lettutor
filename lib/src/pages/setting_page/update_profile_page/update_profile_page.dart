import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/src/api/constants.dart';
import 'package:lettutor/src/api/user_api.dart';
import 'package:lettutor/src/custom_widgets/pro_avatar.dart';
import 'package:lettutor/src/custom_widgets/pro_filter_chip.dart';
import 'package:lettutor/src/custom_widgets/pro_heading.dart';
import 'package:lettutor/src/custom_widgets/pro_pos_button.dart';
import 'package:lettutor/src/models/user/user.dart';
import 'package:lettutor/src/pages/login_page/auth.dart';
import 'package:lettutor/src/pages/tutor_list_page/tutor_details_page/tutor_details_page.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  bool _isLoading1 = true;
  bool _isLoading2 = true;
  final _birthdayController =
      TextEditingController(text: AppState.user.birthday);

  final _countryController = TextEditingController(text: AppState.user.country);
  final _nameController = TextEditingController(text: AppState.user.name);
  final _phoneController = TextEditingController(text: AppState.user.phone);
  List<String> _wantToLearn = AppState.user.learnTopics
          ?.map((e) => e.name ?? '')
          .toList() ??
      []
    ..addAll(
        AppState.user.testPreparations?.map((e) => e.name ?? '').toList() ?? [])
    ..map((e) => e.toLowerCase()).toList();
  final List<String> topics = AppState.topics.map((e) => e.name ?? '').toList()
    ..addAll(AppState.testPreparations.map((e) => e.name ?? '').toList());

  @override
  void initState() {
    super.initState();
    _getTopics();
    _getTestPreparations();
  }

  _getTopics() async {
    try {
      List<LearnTopic> topics = await UserApi.getLearnTopics();
      AppState.topics = topics;
      setState(() {
        _isLoading1 = false;
      });
    } catch (e) {
      print("[UpdateProfilePage::_getTopics] $e");
    }
  }

  _getTestPreparations() async {
    try {
      List<TestPreparation> test = await UserApi.getTestPreparations();
      AppState.testPreparations = test;
      setState(() {
        _isLoading2 = false;
      });
    } catch (e) {
      print("[UpdateProfilePage::_getTestPreparations] $e");
    }
  }

  TextFormField _scheduleField(BuildContext context) {
    return TextFormField(
      autofocus: false,
      initialValue: AppState.user.studySchedule,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.indigo,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1.0,
          ),
        ),
        contentPadding:
            EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
        hintText: 'Note the time of the week you want to study on LetTutor\n',
        hintMaxLines: 5,
      ),
    );
  }

  GestureDetector _birthdayField(BuildContext context) {
    return GestureDetector(
      onTap: () => DatePicker.showDatePicker(context,
          showTitleActions: true,
          minTime: DateTime(1900, 1, 1),
          maxTime: DateTime(2100, 12, 31), onConfirm: (date) {
        setState(() {
          _birthdayController.text = DateFormat('yyyy-MM-dd').format(date);
        });
      }, currentTime: DateTime.now()),
      child: TextFormField(
        controller: _birthdayController,
        enabled: false,
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.calendar_today_outlined,
            size: 20,
          ),
          // disabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(10),
          //   borderSide: BorderSide(
          //     width: 1.0,
          //   ),
          // ),
          contentPadding:
              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
        ),
      ),
    );
  }

  TextFormField _phoneField(BuildContext context) {
    return TextFormField(
      controller: _phoneController,
      enabled: false,
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1.0,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        contentPadding:
            EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
      ),
    );
  }

  TextFormField _emailField(BuildContext context) {
    return TextFormField(
      enabled: false,
      initialValue: AppState.user.email,
      decoration: InputDecoration(
        filled: true,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1.0,
          ),
        ),
        contentPadding:
            EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
      ),
    );
  }

  GestureDetector _countryField(BuildContext context) {
    return GestureDetector(
      onTap: () => showCountryPicker(
          countryListTheme: CountryListThemeData(
            flagSize: 20,
            bottomSheetHeight: 500,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            inputDecoration: InputDecoration(),
          ),
          showSearch: false,
          context: context,
          onSelect: (value) {
            AppState.user.country = value.name;
            setState(() {
              _countryController.text = AppState.user.country!;
            });
          }),
      child: TextFormField(
        controller: _countryController,
        enabled: false,
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.language, size: 20),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 1.0,
            ),
          ),
          contentPadding:
              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
        ),
      ),
    );
  }

  TextFormField _nameField(BuildContext context) {
    return TextFormField(
        controller: _nameController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 1.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 1.0,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 1.0,
            ),
          ),
          contentPadding:
              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Name must not be null.';
          }
          return null;
        });
  }

  _levelField(BuildContext context) {
    return DropdownButtonFormField(
      value: levelIdToLevel[AppState.user.level],
      icon: const Icon(
        Icons.expand_more,
        color: Colors.grey,
      ),
      elevation: 16,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
        contentPadding:
            EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          AppState.user.level = levelToLevelId[value];
        });
      },
      items: levelToLevelId.keys.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  _wantToLearnField(BuildContext context) {
    return ProFilterChip(
      all: topics,
      selected: _wantToLearn,
      hook: (selected) {
        _wantToLearn = selected.toList();
      },
    );
  }

  _updateUserInfo() async {
    String name = _nameController.text;
    String country = _countryController.text;
    String phone = _phoneController.text;
    String birthday = _birthdayController.text;
    String level = AppState.user.level ?? '';
    List<String> learnTopics = _wantToLearn
        .where((e) => learnTopicsToId.keys.contains(e))
        .map((e) => learnTopicsToId[e] ?? '')
        .where((e) => e != '')
        .toList();
    List<String> testPreparations = _wantToLearn
        .where((e) => testPreparationsToId.keys.contains(e))
        .map((e) => testPreparationsToId[e] ?? '')
        .where((e) => e != '')
        .toList();

    try {
      var user = await UserApi.updateUserInfo(
        name: name,
        country: country,
        phone: phone,
        birthday: birthday,
        level: level,
        learnTopics: learnTopics,
        testPreparations: testPreparations,
      );
      AppState.user = user;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Update successfully')),
      );
    } catch (e) {
      print("[UpdateProfilePage::_updateUserInfo] $e");
    }
  }

  _avatarDialog() async {
    final avatarUrl = await showDialog(
        context: context, builder: (context) => ChangeAvatarDialog());
    String name = _nameController.text;
    String country = _countryController.text;
    String phone = _phoneController.text;
    String birthday = _birthdayController.text;
    String level = AppState.user.level ?? '';
    List<String> learnTopics = _wantToLearn
        .where((e) => learnTopicsToId.keys.contains(e))
        .map((e) => learnTopicsToId[e] ?? '')
        .where((e) => e != '')
        .toList();
    List<String> testPreparations = _wantToLearn
        .where((e) => testPreparationsToId.keys.contains(e))
        .map((e) => testPreparationsToId[e] ?? '')
        .where((e) => e != '')
        .toList();

    try {
      var user = await UserApi.updateUserInfo(
        name: name,
        country: country,
        phone: phone,
        birthday: birthday,
        level: level,
        learnTopics: learnTopics,
        testPreparations: testPreparations,
        avatar: avatarUrl,
      );
      AppState.user = user;
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Update successfully')),
      );
    } catch (e) {
      print("[UpdateProfilePage::_avatarDialog] $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                title: Text('Update Information'),
                centerTitle: true,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: _isLoading1 || _isLoading2
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(children: [
                            ProAvatar(
                              url: AppState.user.avatar!,
                              height: 90,
                              width: 90,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  _avatarDialog();
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey[300],
                                  radius: 18,
                                  child: const Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            )
                          ]),
                          Heading3(text: 'Name'),
                          _nameField(context),
                          SizedBox(height: 6),
                          Heading3(text: 'Country'),
                          _countryField(context),
                          SizedBox(height: 6),
                          Heading3(text: 'Email Address'),
                          _emailField(context),
                          SizedBox(height: 6),
                          Heading3(text: 'Phone Number'),
                          _phoneField(context),
                          SizedBox(height: 6),
                          Heading3(text: 'Birthday'),
                          _birthdayField(context),
                          SizedBox(height: 6),
                          Row(
                            children: [
                              Text("*",
                                  style: theme.textTheme.bodyMedium
                                      ?.copyWith(color: Colors.red)),
                              Heading3(text: 'Level'),
                            ],
                          ),
                          _levelField(context),
                          SizedBox(height: 6),
                          Heading3(text: 'Want to learn'),
                          _wantToLearnField(context),
                          SizedBox(height: 6),
                          Heading3(text: 'Study Schedule'),
                          _scheduleField(context),
                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ProPosButton(
                                label: "Save changes",
                                icon: Icon(Icons.search),
                                onPressed: () {
                                  _updateUserInfo();
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 100),
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

class ChangeAvatarDialog extends StatefulWidget {
  const ChangeAvatarDialog({super.key});

  @override
  State<ChangeAvatarDialog> createState() => _ChangeAvatarDialogState();
}

class _ChangeAvatarDialogState extends State<ChangeAvatarDialog> {
  String _url = "";
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text('Image Url'),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                _url = value;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, null);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, _url);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ],
    );
  }
}

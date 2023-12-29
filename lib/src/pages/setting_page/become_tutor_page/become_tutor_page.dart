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
import 'package:lettutor/src/helpers/padding.dart';
import 'package:lettutor/src/models/user/user.dart';
import 'package:lettutor/src/pages/login_page/auth.dart';

class BecomeTutorPage extends StatefulWidget {
  const BecomeTutorPage({super.key});

  @override
  State<BecomeTutorPage> createState() => _BecomeTutorPageState();
}

class _BecomeTutorPageState extends State<BecomeTutorPage> {
  final List<String> topics = AppState.topics.map((e) => e.name ?? '').toList()
    ..addAll(AppState.testPreparations.map((e) => e.name ?? '').toList());

  final _bioController = TextEditingController();
  final _birthdayController =
      TextEditingController(text: AppState.user.birthday);

  final _countryController = TextEditingController(text: AppState.user.country);
  final _educationController = TextEditingController();
  final _experienceController = TextEditingController();
  final _interestController = TextEditingController();

  bool _isLoading1 = true;
  bool _isLoading2 = true;
  final _languageController = TextEditingController();
  final _nameController = TextEditingController(text: AppState.user.name);
  final _phoneController = TextEditingController(text: AppState.user.phone);
  final _specialtiesController = TextEditingController();
  List<String> _wantToLearn = AppState.user.learnTopics
          ?.map((e) => e.name ?? '')
          .toList() ??
      []
    ..addAll(
        AppState.user.testPreparations?.map((e) => e.name ?? '').toList() ?? [])
    ..map((e) => e.toLowerCase()).toList();

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

  TextFormField _interestField(BuildContext context) {
    return TextFormField(
      controller: _interestController,
      autofocus: false,
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
        hintMaxLines: 5,
      ),
    );
  }

  TextFormField _educationField(BuildContext context) {
    return TextFormField(
      controller: _educationController,
      autofocus: false,
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
      ),
    );
  }

  TextFormField _languageField(BuildContext context) {
    return TextFormField(
      controller: _languageController,
      autofocus: false,
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
      ),
    );
  }

  TextFormField _experienceField(BuildContext context) {
    return TextFormField(
      controller: _experienceController,
      autofocus: false,
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
      ),
    );
  }

  TextFormField _specialtiesField(BuildContext context) {
    return TextFormField(
      controller: _specialtiesController,
      autofocus: false,
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
      ),
    );
  }

  TextFormField _bioField(BuildContext context) {
    return TextFormField(
      controller: _bioController,
      autofocus: false,
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

  _becomeTutor() async {
    String name = _nameController.text;
    String country = _countryController.text;
    String birthday = _birthdayController.text;
    String interest = _interestController.text;
    String education = _educationController.text;
    String experience = _experienceController.text;
    String language = _languageController.text;
    String bio = _bioController.text;
    String specialties = _specialtiesController.text;

    try {
      await UserApi.becomeTutor(
        name: name,
        country: country,
        birthday: birthday,
        interests: interest,
        education: education,
        experience: experience,
        languages: language,
        bio: bio,
        specialties: specialties,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Successfully become a tutor')),
      );
    } catch (e) {
      print("[BecomeTutorPage::_becomeTutor] $e");
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
                title: Text('Become a Tutor'),
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
                          vpad(5),
                          Heading3(text: 'Country'),
                          _countryField(context),
                          vpad(5),
                          Heading3(text: 'Birthday'),
                          _birthdayField(context),
                          vpad(5),
                          Heading3(text: 'Interest'),
                          _interestField(context),
                          vpad(5),
                          Heading3(text: 'Education'),
                          _educationField(context),
                          vpad(5),
                          Heading3(text: 'Experience'),
                          _experienceField(context),
                          vpad(5),
                          Heading3(text: 'Language'),
                          _languageField(context),
                          vpad(5),
                          Heading3(text: 'Bio'),
                          _bioField(context),
                          vpad(5),
                          Heading3(text: 'Specialties'),
                          _specialtiesField(context),
                          vpad(5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ProPosButton(
                                label: "Submit",
                                icon: Icon(Icons.search),
                                onPressed: () {
                                  _becomeTutor();
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

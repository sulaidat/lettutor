import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/src/api/auth_api.dart';
import 'package:lettutor/src/api/constants.dart';
import 'package:lettutor/src/login_page/auth.dart';
import 'package:lettutor/src/models/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String birthday = '';
  List<Topic> chosenTestPreparations = [];
  List<Topic> chosenTopics = [];
  String country = '';
  String emailAddress = '';
  String level = '';
  String phoneNumber = '';
  User? user;

  bool _isInitiated = false;
  bool _isLoading = true;
  final nameController = TextEditingController();
  final _studyScheduleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _isInitiated = false;
  }

  void _initiateUserProfile() {
    final appUser = AppState.user;

    nameController.text = appUser.name ?? 'null name';
    emailAddress = appUser.email ?? 'null email';
    phoneNumber = appUser.phone ?? 'null phone number';
    birthday = appUser.birthday ?? 'yyyy-MM-dd';
    country = appUser.country ?? 'US';
    level = appUser.level ?? 'BEGINNER';
    _studyScheduleController.text = appUser.studySchedule ?? 'null';

    chosenTopics = appUser.learnTopics ?? [];
    chosenTestPreparations = appUser.testPreparations ?? [];

    setState(() {
      user = appUser;
      _isInitiated = true;
      _isLoading = false;
    });
  }

  Future<void> _updateUserProfile() async {
    final pref = await SharedPreferences.getInstance();
    final String token = pref.getString('token')!;
    final learnTopics =
        chosenTopics.map((topic) => topic.id.toString()).toList();
    final testPreparations =
        chosenTestPreparations.map((test) => test.id.toString()).toList();

    // AppState.user = await AuthApi.updateUserInfo(
    //   token,
    //   nameController.value.text,
    //   country,
    //   phoneNumber,
    //   birthday,
    //   level,
    //   learnTopics,
    //   testPreparations,
    //   context,
    // );

    setState(() {
      _isLoading = true;
      _isInitiated = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitiated) {
      _initiateUserProfile();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Container(
                          width: 108,
                          height: 108,
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            AppState.user.avatar!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.person_rounded),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {},
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
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[900],
                    ),
                  ),
                  const SizedBox(height: 4),
                  TextField(
                    controller: nameController,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Email Address',
                    style: TextStyle(fontSize: 16, color: Colors.grey[900]),
                  ),
                  const SizedBox(height: 4),
                  Text(emailAddress),
                  const SizedBox(height: 16),
                  Text(
                    'Phone Number',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[900],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(phoneNumber),
                  const SizedBox(height: 16),
                  Text(
                    'Country',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[900],
                    ),
                  ),
                  const SizedBox(height: 4),
                  DropdownButtonFormField(
                    isExpanded: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    value: countryList[country],
                    items: countryList.values
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e, overflow: TextOverflow.ellipsis),
                            ))
                        .toList(),
                    onChanged: (value) {
                      final chosenCountry = countryList.keys.firstWhere(
                        (element) => countryList[element] == value,
                        orElse: () => 'US',
                      );
                      setState(() {
                        country = chosenCountry;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Birthday',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[900],
                    ),
                  ),
                  const SizedBox(height: 4),
                  SelectDate(
                    initialValue: birthday,
                    onChanged: (newValue) {
                      setState(() {
                        birthday = newValue;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Level',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[900],
                    ),
                  ),
                  const SizedBox(height: 4),
                  DropdownButtonFormField(
                    isExpanded: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    value: userLevels[level],
                    items: userLevels.values
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e, overflow: TextOverflow.ellipsis),
                            ))
                        .toList(),
                    onChanged: (value) {
                      final chosenLevel = userLevels.keys.firstWhere(
                        (element) => userLevels[element] == value,
                        orElse: () => 'BEGINNER',
                      );
                      setState(() {
                        level = chosenLevel;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Topic',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[900],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 8,
                    runSpacing: -4,
                    children: List<Widget>.generate(
                      AppState.user.learnTopics!.length,
                      (index) => ChoiceChip(
                        backgroundColor: Colors.grey[100],
                        selectedColor: Colors.lightBlue[100],
                        selected: chosenTopics
                            .map((e) => e.id)
                            .toList()
                            .contains(AppState.user.learnTopics![index].id),
                        label: Text(
                          AppState.user.learnTopics![index].name ?? 'null',
                          style: TextStyle(
                            fontSize: 14,
                            color: chosenTopics
                                    .map((e) => e.id)
                                    .toList()
                                    .contains(
                                        AppState.user.learnTopics![index].id)
                                ? Colors.blue[700]
                                : Colors.black54,
                          ),
                        ),
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              chosenTopics
                                  .add(AppState.user.learnTopics![index]);
                            } else {
                              chosenTopics.removeWhere(
                                (element) =>
                                    element.id ==
                                    AppState.user.learnTopics![index].id,
                              );
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Test Preparation',
                    style: TextStyle(fontSize: 16, color: Colors.grey[900]),
                  ),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 8,
                    runSpacing: -4,
                    children: List<Widget>.generate(
                      AppState.user.testPreparations!.length,
                      (index) => ChoiceChip(
                        backgroundColor: Colors.grey[100],
                        selectedColor: Colors.lightBlue[100],
                        selected: chosenTestPreparations
                            .map((e) => e.id)
                            .toList()
                            .contains(
                                AppState.user.testPreparations![index].id),
                        label: Text(
                          AppState.user.testPreparations![index].name ?? 'null',
                          style: TextStyle(
                            fontSize: 14,
                            color: chosenTestPreparations
                                    .map((e) => e.id)
                                    .toList()
                                    .contains(AppState
                                        .user.testPreparations![index].id)
                                ? Colors.blue[700]
                                : Colors.black54,
                          ),
                        ),
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              chosenTestPreparations
                                  .add(AppState.user.testPreparations![index]);
                            } else {
                              chosenTestPreparations.removeWhere(
                                (element) =>
                                    element.id ==
                                    AppState.user.testPreparations![index].id,
                              );
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Study Schedule',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[900],
                    ),
                  ),
                  const SizedBox(height: 4),
                  TextField(
                    controller: _studyScheduleController,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  TextButton(
                    onPressed: () {
                      _updateUserProfile();
                    },
                    style: TextButton.styleFrom(
                      minimumSize: const Size.fromHeight(48),
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      'SAVE',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

class SelectDate extends StatefulWidget {
  const SelectDate({
    Key? key,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  final String initialValue;
  final Function(String newValue) onChanged;

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  String _selectedDate = '';

  void _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950, 1, 1),
      lastDate: DateTime(2050),
    );
    if (selectedDate != null) {
      _selectedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
      widget.onChanged(_selectedDate);
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectDate(context);
      },
      child: Container(
        width: 160,
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.grey[400]!),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Text(
          _selectedDate,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: _selectedDate == 'dd/MM/yyyy'
                ? FontWeight.normal
                : FontWeight.w500,
            letterSpacing: 1.0,
            color: _selectedDate == 'dd/MM/yyyy'
                ? Colors.grey[400]
                : Colors.black54,
          ),
        ),
      ),
    );
  }
}

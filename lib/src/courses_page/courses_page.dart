import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/api/constants.dart';
import 'package:lettutor/src/api/course_api.dart';
import 'package:lettutor/src/helpers/padding.dart';
import 'package:lettutor/src/models/course/course.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  List<Course> _courses = [];
  bool _isLoading = true;
  bool _dontLoadMore = false;
  int _perPage = 5;
  int _page = 1;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // _getData();
    _getFirstPage();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getNextPage();
      }
    });
  }

  _getFirstPage() async {
    setState(() {
      _isLoading = true;
      _page = 1;
    });
    try {
      _courses = await CourseApi.getCourses(_perPage, 1);
    } catch (e) {
      print("[_getFirstPage] $e");
    }
    setState(() {
      _isLoading = false;
      _page++;
      _dontLoadMore = _courses.length > 1 ? false : true;
    });
  }

  _getNextPage() async {
    setState(() {
      _isLoading = true;
    });
    try {
      List<Course> nextPage = await CourseApi.getCourses(_perPage, _page);
      setState(() {
        if (nextPage.isEmpty) {
          _dontLoadMore = true;
        } else {
          _page++;
          _courses.addAll(nextPage);
        }
        _isLoading = false;
      });
    } catch (e) {
      print("[_getNextPaeg] $e");
    }
  }

  _getData() async {
    try {
      List<Course> courses = await CourseApi.getCourses(999, 1);
      setState(() {
        _courses = courses;
        _isLoading = false;
      });
    } catch (e) {
      print("[_getData] $e");
    }
  }

  Widget _buildCourseCard(BuildContext context, Course course) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          color: theme.colorScheme.background,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4,
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10),
              bottom: Radius.circular(30),
            ),
            child: CachedNetworkImage(
                imageUrl: course.imageUrl!,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Icon(
                      Icons.image,
                      size: 48,
                      color: Colors.grey,
                    ),
                errorWidget: (context, url, error) => const Icon(
                      Icons.image_not_supported,
                      size: 48,
                      color: Colors.grey,
                    )),
          ),
          // Image.network("${course.bannerUrl}"),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${course.name}",
                  style: theme.textTheme.titleLarge?.copyWith(),
                ),
                vpad(5),
                Text("${course.description}"),
                vpad(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${courseLevels[course.level]} - ${course.topics!.length} Lessons",
                      style: theme.textTheme.bodySmall,
                    ),
                    FilledButton(
                      onPressed: () {
                        context.go('/course/detail', extra: course);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.public),
                          Text("Discover"),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              AppBar(
                title: Text('Courses'),
                centerTitle: true,
              ),
              _courses.isEmpty
                  ? _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : const Center(child: Text("No courses found"))
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) => vpad(10),
                              itemCount: _dontLoadMore
                                  ? _courses.length
                                  : _courses.length + 1,
                              itemBuilder: (context, index) {
                                if (index == _courses.length) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return _buildCourseCard(
                                      context, _courses[index]);
                                }
                              }),
                        )
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}

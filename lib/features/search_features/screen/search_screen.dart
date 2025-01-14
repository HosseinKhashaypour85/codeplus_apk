import 'package:codeplus/const/shape/border_radius.dart';
import 'package:codeplus/features/courses_widget/screen/courses_info_screen.dart';
import 'package:codeplus/features/public_features/widget/error_screen_widget.dart';
import 'package:codeplus/features/search_features/logic/search_bloc.dart';
import 'package:codeplus/features/search_features/model/search_model.dart';
import 'package:codeplus/features/search_features/services/search_api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/responsive.dart';
import '../../../const/shape/media_query.dart';
import '../../../const/theme/colors.dart';
import '../../public_features/functions/number_to_three/number_to_three.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  static const String screenId = '/search';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  Future<bool> onWillPop() async {
    var currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus || currentFocus.focusedChild != null) {
      currentFocus.focusedChild!.unfocus();
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(
        SearchApiRepository(),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: primary2Color,
        body: SafeArea(
          child: Builder(
            builder: (context) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.sp),
                    margin: EdgeInsets.all(10.sp),
                    child: TextField(
                      controller: _textEditingController,
                      style: TextStyle(fontFamily: 'sahel'),
                      textAlignVertical: TextAlignVertical.center,
                      textDirection: TextDirection.rtl,
                      maxLength: 30,
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey.withOpacity(0.7),
                        ),
                        counter: SizedBox.shrink(),
                      ),
                      onSubmitted: (value) {
                        if (_textEditingController.text.trim().length > 1) {
                          BlocProvider.of<SearchBloc>(context)
                              .add(CallSearchEvent());
                        }
                      },
                      onTap: () {
                        if (_textEditingController.text.isNotEmpty &&
                            !_textEditingController.text.endsWith(' ')) {
                          _textEditingController.text =
                              _textEditingController.text + ' ';
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<SearchBloc, SearchState>(
                      builder: (context, state) {
                        if (state is SearchLoadingState) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: primaryColor,
                            ),
                          );
                        }
                        if (state is SearchCompletedState) {
                          return SearchScreenContent(
                              searchModel: state.searchModel);
                        }
                        if (state is SearchErrorState) {
                          return ErrorScreenWidget(
                            errorMsg: state.error.errorMsg!,
                            function: () {
                              BlocProvider.of<SearchBloc>(context)
                                  .add(CallSearchEvent());
                            },
                          );
                        }
                        return SizedBox.shrink();
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class SearchScreenContent extends StatelessWidget {
  const SearchScreenContent({
    super.key,
    required this.searchModel,
  });

  final SearchModel searchModel;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return Container(
      child: ListView.builder(
        itemCount: searchModel.items!.length,
        itemBuilder: (context, index) {
          final helper = searchModel.items![index];
          final String courseId = helper.id ?? 'unknown';
          final String imageUrl = helper.imageUrl ?? 'no image';
          final String description = helper.description ?? 'no desc';
          final String courseName = helper.courseName ?? 'no name';
          final dynamic category = helper.category ?? 'no catgory';
          final Object price = helper.coursePrice ?? 'no price';
          return InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                CoursesInfoScreen.screenId,
                arguments: {
                  'id': courseId,
                  'imageUrl' : imageUrl,
                  'description' : description,
                  'courseName' : courseName,
                  'category' : category,
                  'coursePrice' : price,
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  color: boxColors, borderRadius: getBorderRadiusFunc(10)),
              width: getAllWidth(context),
              height: Responsive.isTablet(context) ? 230 : 150,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: getBorderRadiusFunc(5),
                      child: FadeInImage(
                        placeholder: const AssetImage('assets/images/logo.jpg'),
                        image: NetworkImage(
                          helper.imageUrl!,
                        ),
                        imageErrorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                          'assets/images/logo.jpg',
                          width: getWidth(context, 0.3),
                        ),
                        // width: getAllWidth(context),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getWidth(context, 0.03),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          helper.courseName!,
                          style: TextStyle(
                              fontFamily: 'sahel',
                              fontSize: 12.sp,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              getFormatPrice(helper.coursePrice!.toString()) +
                                  'تومان',
                              style: TextStyle(
                                fontFamily: 'sahel',
                                fontSize: 12.sp,
                                color: Colors.white,
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                fixedSize: Size(getWidth(context, 0.4),
                                    getHeight(context, 0.05)),
                              ),
                              onPressed: () {
                              },
                              child: Text(
                                'مشاهده دوره',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'sahel',
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

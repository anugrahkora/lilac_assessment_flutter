import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lilac_assessment_flutter/core/constants/app_colors/app_colors.dart';
import 'package:lilac_assessment_flutter/core/constants/assets/app_assets.dart';
import 'package:lilac_assessment_flutter/core/route/app_routes.dart';
import 'package:lilac_assessment_flutter/core/themes/app_themes.dart';
import 'package:lilac_assessment_flutter/presentation/widgets/back_button.dart';
import 'package:lilac_assessment_flutter/utils/svg_helper.dart';

class ChatList extends StatefulWidget {
  final Map<String, dynamic>? response;
  const ChatList({super.key, required this.response});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> stories = [
      {'name': 'Christina', 'image': AppImages.avatar1},
      {'name': 'Patricia', 'image': AppImages.avatar2},
      {'name': 'Celestine', 'image': AppImages.avatar3},
      {'name': 'Celestine', 'image': AppImages.avatar1},
      {'name': 'Elizabeth', 'image': AppImages.avatar2},
    ];

    final List<Map<String, String>> chats = [
      {'name': 'Regina Bearden', 'image': AppImages.avatar1},
      {'name': 'Rhonda Rivera', 'image': AppImages.avatar2},
      {'name': 'Mary Gratton', 'image': AppImages.avatar3},
      {'name': 'Annie Medved', 'image': AppImages.avatar1},
      {'name': 'Regina Bearden', 'image': AppImages.avatar2},
    ];

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: BackButtonCustom(),
          title: Text('Messages', style: AppTextStyles.heading2),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                // Stories
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: stories.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 80,
                        width: 80,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundImage: stories[index]['image'] != null
                                    ? AssetImage(stories[index]['image']!)
                                    : null,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                stories[index]['name'] ?? '',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w200,
                                  color: AppTextColors.darkGrey,
                                  fontSize: 14,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),

                // Search Field
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: SvgHelper.asset(AppIcons.searchFavourite),
                    ),
                    suffixIconConstraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),

                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 16,
                    ),
                    hintStyle: AppTextStyles.body1.copyWith(
                      color: AppTextColors.mediumGrey,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: Color(0xFFDDD3D3)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: Color(0xFFDDD3D3)),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                Text(
                  'Chat',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: AppTextColors.darkGrey,
                  ),
                ),
                const SizedBox(height: 12),

                // Chat List
                Expanded(
                  child: ListView.separated(
                    itemCount: chats.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          radius: 26,
                          backgroundImage: stories[index]['image'] != null
                              ? AssetImage(stories[index]['image']!)
                              : null,
                        ),
                        title: Text(
                          chats[index]['name'] ?? '',
                          style:AppTextStyles.subHeading1,
                        ),
                        trailing: const Text(
                          '10:00 AM',
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                        onTap: () {
                          context.push(
                            AppRoutes.chatView,
                            // extra: widget.response,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'journey_player_screen.dart';
import '../utils/size_utils.dart';

const Color kPurple = Color(0xFF6C2BF3);
const Color kPurpleDark = Color(0xFF5930E5);
const Color kPurpleDark2 = Color(0xFF3F16B6);
const Color kPurpleMid = Color(0xFF7B41FF);
const Color kPill = Color(0xFFF2E9FF);

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPurple,
      appBar: const _HeaderAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 12.h),
          child: Column(
            children: [
              SizedBox(height: 0.8.h),
              const _AvatarSection(),
              SizedBox(height: 2.2.h),
              const _StreakHeader(),
              SizedBox(height: 1.h),
              const _StreakStrip(),
              SizedBox(height: 2.2.h),
              const _ProgressFlowCard(),
            ],
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: const Color(0xFFF6DDF6),
      //   onPressed: () =>
      //       Navigator.of(context).pushNamed(JourneyPlayerScreen.routeName),
      //   child: const Icon(Icons.search, color: Colors.black87),
      // ),
      bottomNavigationBar: const _BottomBar(currentIndex: 3),
    );
  }
}

class _HeaderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HeaderAppBar();
  @override
  Size get preferredSize => Size.fromHeight(7.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 3.w),
        child: _roundIcon(Icons.settings_outlined),
      ),
      title: const Text(
        'Profile',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 3.w),
          child: _roundIcon(Icons.notifications_none),
        ),
      ],
    );
  }

  Widget _roundIcon(IconData icon) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: kPurpleDark2,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: () {},
      ),
    );
  }
}

class _AvatarSection extends StatefulWidget {
  const _AvatarSection();
  @override
  State<_AvatarSection> createState() => _AvatarSectionState();
}

class _AvatarSectionState extends State<_AvatarSection> {
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  String _name = 'Karan J.';

  Future<void> _onEditPhoto() async {
    try {
      final XFile? x = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );
      if (x != null) setState(() => _imageFile = File(x.path));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Unable to open camera: $e')),
      );
    }
  }

  Future<void> _onEditName() async {
    final controller = TextEditingController(text: _name);
    final newName = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Edit name'),
        content: TextField(controller: controller, autofocus: true),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Cancel')),
          TextButton(
              onPressed: () => Navigator.of(ctx).pop(controller.text.trim()),
              child: const Text('Save')),
        ],
      ),
    );
    if (newName != null && newName.isNotEmpty) {
      setState(() => _name = newName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ImageProvider avatar = _imageFile != null
        ? FileImage(_imageFile!)
        : const AssetImage('assets/images/profile.png');
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 32.w,
              height: 32.w,
              margin: EdgeInsets.only(bottom: 2.4.h),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.7.w),
              ),
              child: CircleAvatar(backgroundImage: avatar),
            ),
            Positioned(
              right: 1.7.w,
              top: 1.2.h,
              child: GestureDetector(
                onTap: _onEditPhoto,
                child: Container(
                  width: 7.5.w,
                  height: 7.5.w,
                  decoration: BoxDecoration(
                    color: kPurpleDark2,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 0.3.w),
                  ),
                  child: const Icon(
                    Icons.edit_square,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: GestureDetector(
                onTap: _onEditName,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.5.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Text(
                    _name,
                    style: const TextStyle(
                      color: kPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        // const SizedBox(height: 10),
        // Container(
        //   padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        //   decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(22)),
        //   child: const Text(
        //     'Karan J.',
        //     style: TextStyle(color: kPurple, fontWeight: FontWeight.bold, fontSize: 16),
        //   ),
        // ),
      ],
    );
  }
}

class _StreakHeader extends StatelessWidget {
  const _StreakHeader();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        children: const [
          Text(
            'My Streak',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Spacer(),
          Text(
            '🔥21 Days',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _StreakStrip extends StatelessWidget {
  const _StreakStrip();

  DateTime _startOfWeek(DateTime d) {
    // DateTime.weekday: Mon=1..Sun=7; map Sunday to 0 offset
    final dateOnly = DateTime(d.year, d.month, d.day);
    final daysFromSunday = dateOnly.weekday % 7; // Sun -> 0
    return dateOnly.subtract(Duration(days: daysFromSunday));
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final start = _startOfWeek(today);
    const dayNames = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    final weekDates = List<DateTime>.generate(
      7,
      (i) => start.add(Duration(days: i)),
    );

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      padding: EdgeInsets.symmetric(vertical: 1.5.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Row(
          children: List.generate(7, (i) {
            final date = weekDates[i];
            final bool isSel = !date.isAfter(today); // select past + today
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 1.w),
              padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
              decoration: BoxDecoration(
                color: isSel ? kPurple : kPill,
                borderRadius: BorderRadius.circular(60),
                border: Border.all(
                  color: isSel ? kPurple : const Color(0xFFE6E0FF),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    dayNames[i],
                    style: TextStyle(
                      color: isSel ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Container(
                    width: 7.5.w,
                    height: 7.5.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      // color: isSel ? Colors.white : kPill,
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 0.5.w),
                    ),
                    child: Text(
                      '${date.day}',
                      style: TextStyle(
                        // color: isSel ? kPurple : Colors.black87,
                        color: Colors.black87,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _ProgressFlowCard extends StatelessWidget {
  const _ProgressFlowCard();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Progress Flow',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 0.5.h),
          const Text(
            'Your Growth In A Glance!',
            style: TextStyle(color: Color(0xFFEAD8FF)),
          ),
          SizedBox(height: 1.5.h),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.all(3.w),
            child: GridView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 3.w,
                mainAxisSpacing: 3.w,
                childAspectRatio: 1.5,
              ),
              children: const [
                // icon 1 - bg #DCE1F4 , bbg - #A9B7E4
                // icon 1 - bg #F0F0F0 , bbg - #D6D6D6
                // icon 1 - bg #F2E2F7 , bbg - #DDB3EA
                // icon 1 - bg #FFD9D9 , bbg - #FFB2B2
                _StatTile(
                  title: 'Daily Goal',
                  value: '30',
                  unit: 'Mins',
                  color: Color(0xFFDCE1F4),
                  iconColor: Color(0xFFA9B7E4),
                  iconPath: 'assets/images/acute.png',
                ),
                _StatTile(
                  title: 'Challenges',
                  value: '08',
                  unit: '/15',
                  color: Color(0xFFF0F0F0),
                  iconColor: Color(0xFFD6D6D6),
                  iconPath: 'assets/images/rewarded_ads.png',
                ),
                _StatTile(
                  title: 'Streaks',
                  value: '21',
                  unit: 'Days',
                  color: Color(0xFFF2E2F7),
                  iconColor: Color(0xFFDDB3EA),
                  iconPath: 'assets/images/local_fire_department.png',
                ),
                _StatTile(
                  title: 'Progress',
                  value: '70',
                  unit: '/100%',
                  color: Color(0xFFFFD9D9),
                  iconColor: Color(0xFFFFB2B2),
                  iconPath: 'assets/images/rocket_launch.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final Color color;
  final Color iconColor;
  final String iconPath;
  const _StatTile({
    required this.title,
    required this.value,
    required this.unit,
    required this.color,
    required this.iconColor,
    required this.iconPath,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: EdgeInsets.all(3.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                // radius: 5.6.w,
                // backgroundColor: Colors.white.withOpacity(0.8),
                backgroundColor: iconColor,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset(
                    iconPath,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(0.6.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(Icons.more_vert, color: Colors.black, size: 5.w),
              ),
            ],
          ),
          // const SizedBox(height: 6),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              // const SizedBox(width: 4),
              Text(
                unit,
                style: const TextStyle(color: Colors.black54, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  final int currentIndex;
  const _BottomBar({required this.currentIndex});
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: kPurple,
      elevation: 0,
      child: SizedBox(
        height: 8.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(Icons.home_outlined, 'Home', selected: currentIndex == 0),
            _navItem(
              Icons.article_outlined,
              'Bytes',
              selected: currentIndex == 1,
            ),
            _searchItem(context),
            _navItem(
              Icons.bookmark_border,
              'Saved',
              selected: currentIndex == 2,
            ),
            _navItem(
              Icons.person_outline,
              'Profile',
              selected: currentIndex == 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, {bool selected = false}) {
    final color = selected ? Color(0xFFFFD9D9) : Colors.white;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        SizedBox(height: 0.5.h),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _searchItem(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () =>
          Navigator.of(context).pushNamed(JourneyPlayerScreen.routeName),
      child: Container(
        width: 12.w,
        height: 12.w,
        decoration: BoxDecoration(
          color: const Color(0xFFFFD9D9),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Icon(Icons.search, color: kPurple, size: 6.w),
      ),
    );
  }
}

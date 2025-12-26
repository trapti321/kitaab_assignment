import 'package:flutter/material.dart';
import 'package:kitab_assignment/screens/profile_screen.dart';
import '../utils/radius_utils.dart';
import '../utils/size_utils.dart';

const Color kPurple = Color(0xFF6C2BF3);
const Color kPurpleMid = Color(0xFF7B41FF);

class JourneyPlayerScreen extends StatelessWidget {
  const JourneyPlayerScreen({super.key});
  static const routeName = '/journey';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPurple,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 3.w),
          child: CircleAvatar(
            backgroundColor: kPurpleDark2,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Journeys',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 3.w),
            child: CircleAvatar(
              backgroundColor: kPurpleDark2,
              child: IconButton(
                icon: const Icon(Icons.bookmark_border, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(5.w, 1.2.h, 5.w, 3.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  'assets/images/gita.png',
                  height: 36.h,
                  width: double.infinity,
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(height: 2.h),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Know Yourself - Insight 1 of 18',
                  style: TextStyle(color: Color(0xFFEEDCFF)),
                ),
              ),
              SizedBox(height: 0.7.h),
              const Text(
                'Introduction',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 1.7.h),
              _SliderRow(),
              const _TimeRow(),
              SizedBox(height: 2.h),
              const _ControlsRow(),

              SizedBox(height: 8.h),
              const _BottomSegmented(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliderRow extends StatefulWidget {
  @override
  State<_SliderRow> createState() => _SliderRowState();
}

class _SliderRowState extends State<_SliderRow> {
  double v = 0.2;
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Colors.white,
        inactiveTrackColor: Colors.white24,
        thumbColor: Colors.white,
      ),
      child: Slider(value: v, onChanged: (nv) => setState(() => v = nv)),
    );
  }
}

class _TimeRow extends StatelessWidget {
  const _TimeRow();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            '02:12',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          Text(
            '10:12',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class _ControlsRow extends StatelessWidget {
  const _ControlsRow();
  @override
  Widget build(BuildContext context) {
    Widget circle(IconData icon, {double? size, Color? color}) {
      final s = size ?? 12.w;
      return Container(
        width: s,
        height: s,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color ?? Colors.white12,
        ),
        child: Icon(icon, color: Colors.white, size: s * 0.5),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(Icons.replay_10_outlined, color: Colors.white, size: 8.r),
        Icon(Icons.skip_previous_outlined, color: Colors.white, size: 8.r),
        Icon(Icons.play_circle_outline_rounded, size: 18.r, color: Colors.white),
        Icon(Icons.skip_next_outlined, color: Colors.white, size: 8.r),
        Icon(Icons.forward_10_outlined, color: Colors.white, size: 8.r),
      ],
    );
  }
}

class _BottomSegmented extends StatelessWidget {
  const _BottomSegmented();
  @override
  Widget build(BuildContext context) {
    const cream = Color(0xFFF7DCC1);
    return Row(
      children: [
        SizedBox(
          width: 5.w,
        ),
        _chip('0.5x'),
        SizedBox(width: 8.w),
        Container(
          padding: EdgeInsets.all(1.5.w),
          decoration: BoxDecoration(
            color: kPurpleDark2,
            borderRadius: BorderRadius.circular(28),
          ),
          child: SizedBox(
            width: 40.w,
            height: 6.h,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: cream,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(22),
                          bottomRight: Radius.circular(22),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 1.2,
                    height: 3.2.h,
                    color: Colors.white70,
                  ),
                ),
                Row(
                  children: const [
                    Expanded(
                      child: Center(
                        child: Icon(Icons.menu_book_rounded, color: cream),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Icon(Icons.headphones_outlined, color: kPurple),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget _chip(String label) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 0.7.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Text(
      label,
      style: const TextStyle(color: kPurple, fontWeight: FontWeight.w700),
    ),
  );
}

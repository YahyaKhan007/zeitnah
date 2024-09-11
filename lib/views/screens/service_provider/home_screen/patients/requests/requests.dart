import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/accept_deline_request.dart';

class PatientRequests extends StatelessWidget {
  const PatientRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CupertinoScrollbar(
        thickness: 4.w,
        radius: Radius.circular(40.r),
        thumbVisibility: true,
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return AcceptDeclineRequest(
              index: index,
            );
          },
        ),
      ),
    );
  }
}

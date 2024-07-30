// import 'package:flutter/material.dart';
//
// class DaysListWidget extends StatefulWidget {
//   const DaysListWidget({super.key});
//
//   @override
//   State<DaysListWidget> createState() => _DaysListWidgetState();
// }
//
// class _DaysListWidgetState extends State<DaysListWidget> {
//   List<String> selectedDays = [];
//
//   List<String> days = [''];
//
//   void _toggleActiveState(String day) {
//     setState(() {
//       if (selectedDays.contains(day)) {
//         selectedDays.remove(day);
//       } else {
//         selectedDays.add(day);
//       }
//     });
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     days = [
//       "sun",
//       "mon",
//       "tue",
//       "wed",
//       "thur",
//       "fri",
//       "sat",
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
//       color: Colors.white,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "days",
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(
//               days.length,
//               (index) {
//                 final String title = days[index];
//                 final bool isActive = selectedDays.contains(title);
//                 return GestureDetector(
//                   onTap: () => _toggleActiveState(title),
//                   child: Container(
//                     padding: const EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       color: isActive ? Colors.indigo : Colors.grey,
//                     ),
//                     child: Text(
//                       "$title",
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class DaysListWidget extends StatefulWidget {
  const DaysListWidget({super.key});

  @override
  State<DaysListWidget> createState() => _DaysListWidgetState();
}

class _DaysListWidgetState extends State<DaysListWidget> {
  List<String> selectedDays = [];

  List<String> days = [''];

  void _toggleActiveState(String day) {
    setState(() {
      if (selectedDays.contains(day)) {
        selectedDays.remove(day);
      } else {
        selectedDays.add(day);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    days = [
      "sun",
      "mon",
      "tue",
      "wed",
      "thur",
      "fri",
      "sat",
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Days"),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              days.length,
                  (index) {
                final String title = days[index];
                final bool isActive = selectedDays.contains(title);
                return GestureDetector(
                  onTap: () => _toggleActiveState(title),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isActive ? Colors.indigo : Colors.grey,
                    ),
                    child: Text("$title"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

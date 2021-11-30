import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:universal_salary_calculator/logic/calendar_utils.dart';
import 'package:universal_salary_calculator/screens/partial_screens/add_job.dart';
import 'home_screen.dart';


class JobScreen extends StatefulWidget {
  const JobScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<JobScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  late final ValueNotifier<List<Event>> _selectedEvents;

  List<Event> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: MediaQuery.of(context).size.height / 1.5,
          child: ListView(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _focusedDay,
                  headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true),
                  selectedDayPredicate: (day) {
                    // Use `selectedDayPredicate` to determine which day is currently selected.
                    // If this returns true, then `day` will be marked as selected.

                    // Using `isSameDay` is recommended to disregard
                    // the time-part of compared DateTime objects.
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay, selectedDay)) {
                      // Call `setState()` when updating the selected day
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    }
                  },
                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      // Call `setState()` when updating calendar format
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    // No need to call `setState()` here
                    _focusedDay = focusedDay;
                  },
                  eventLoader: (day) {
                    return _getEventsForDay(day);
                  },
                ),
              ),
              /*Expanded(child: ValueListenableBuilder<List<Event>>(valueListenable: _selectedEvents,
              builder: (context, value, _){
                return ListView.builder(itemCount: value.length, itemBuilder: (context, index){
                  return Container(margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12.0),
                  ),child: ListTile(
                        onTap: () => print('${value[index]}'),
                        title: Text('${value[index]}'),
                      ),);
                });
              },)),*/
              Container(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 12, right: MediaQuery.of(context).size.width / 12, top: MediaQuery.of(context).size.width / 25, bottom: MediaQuery.of(context).size.height / 40),
                child: ElevatedButton.icon(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const AddJobScreen()));}, icon: const Icon(Icons.add_circle), label: const Text("Add Entry"), style: ElevatedButton.styleFrom(primary: Colors.blueAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),),
              ),
              const Divider(
                thickness: 1,
                height: 4,
              ),
              Container(padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20), child: const Text("Entries", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),),
              // only show entries for the selected date!
              CardFb2(text: "Vikar", imageUrl: "https://katrinebjergskolen.aarhus.dk/media/23192/aula-logo.jpg?anchor=center&mode=crop&width=1200&height=630&rnd=132022572610000000", subtitle: "+1290 DKK", onPressed: showIncomeInfo),
              CardFb2(text: "Vikar", imageUrl: "https://katrinebjergskolen.aarhus.dk/media/23192/aula-logo.jpg?anchor=center&mode=crop&width=1200&height=630&rnd=132022572610000000", subtitle: "+1290 DKK", onPressed: showIncomeInfo),
              CardFb2(text: "Vikar", imageUrl: "https://katrinebjergskolen.aarhus.dk/media/23192/aula-logo.jpg?anchor=center&mode=crop&width=1200&height=630&rnd=132022572610000000", subtitle: "+1290 DKK", onPressed: showIncomeInfo),
              CardFb2(text: "Vikar", imageUrl: "https://katrinebjergskolen.aarhus.dk/media/23192/aula-logo.jpg?anchor=center&mode=crop&width=1200&height=630&rnd=132022572610000000", subtitle: "+1290 DKK", onPressed: showIncomeInfo),
              CardFb2(text: "Vikar", imageUrl: "https://katrinebjergskolen.aarhus.dk/media/23192/aula-logo.jpg?anchor=center&mode=crop&width=1200&height=630&rnd=132022572610000000", subtitle: "+1290 DKK", onPressed: showIncomeInfo),
              CardFb2(text: "Vikar", imageUrl: "https://katrinebjergskolen.aarhus.dk/media/23192/aula-logo.jpg?anchor=center&mode=crop&width=1200&height=630&rnd=132022572610000000", subtitle: "+1290 DKK", onPressed: showIncomeInfo),
              CardFb2(text: "Vikar", imageUrl: "https://katrinebjergskolen.aarhus.dk/media/23192/aula-logo.jpg?anchor=center&mode=crop&width=1200&height=630&rnd=132022572610000000", subtitle: "+1290 DKK", onPressed: showIncomeInfo),
              CardFb2(text: "Vikar", imageUrl: "https://katrinebjergskolen.aarhus.dk/media/23192/aula-logo.jpg?anchor=center&mode=crop&width=1200&height=630&rnd=132022572610000000", subtitle: "+1290 DKK", onPressed: showIncomeInfo),
              CardFb2(text: "Vikar", imageUrl: "https://katrinebjergskolen.aarhus.dk/media/23192/aula-logo.jpg?anchor=center&mode=crop&width=1200&height=630&rnd=132022572610000000", subtitle: "+1290 DKK", onPressed: showIncomeInfo),
            ],
          ),
        );
  }
  Future showIncomeInfo () => showSlidingBottomSheet(
    context,
    builder: (context) => SlidingSheetDialog(
      duration: const Duration(milliseconds: 450),
      snapSpec: const SnapSpec(
          snappings: [0.4, 0.7, 1], initialSnap: 0.4
      ),
      builder: showIncome,
      /////headerBuilder: buildHeader,
      avoidStatusBar: true,
      cornerRadius: 15,
    ),
  );

  Widget showIncome(context, state) => Material(
    child: ListView(
      shrinkWrap: true,
      primary: false,
      children: [
        Container(margin: const EdgeInsets.only(left: 10, right: 10), child: ElevatedButton(style: ElevatedButton.styleFrom(shape: const StadiumBorder(), padding: const EdgeInsets.symmetric(horizontal: 1)), onPressed: () => Navigator.of(context).pop(), child: const Text("Close")))
      ],
    ),
  );
}

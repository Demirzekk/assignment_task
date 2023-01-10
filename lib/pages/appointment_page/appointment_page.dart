import 'package:assignment_task/base/base_widgets.dart';
import 'package:assignment_task/base/my_pages_widget.dart';
import 'package:assignment_task/pages/appointment_detail/appointment_detail.dart';
import 'package:assignment_task/pages/appointment_page/appointment_model.dart';
import 'package:assignment_task/utility/constants/color_constants.dart';

import 'package:assignment_task/utility/extensions/general_extensions.dart';
import 'package:flutter/material.dart';

import 'appointment_modelview.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> with ColorConstants {
  late Future<List<AppointmentModel?>> fetchData;
  Future<List<AppointmentModel?>> fetchAppointments() {
    return AppointmentModelViewModel().fetchAppointments();
  }

  @override
  void initState() {
    fetchData = fetchAppointments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: "Randevularım",
        ),
        body: FutureBuilder<List<AppointmentModel?>>(
            future: fetchData,
            builder:
                (context, AsyncSnapshot<List<AppointmentModel?>> snapshot) {
              if (snapshot.hasError) {
                "Appointment page error: ${snapshot.error}".log();
                return const Center(
                    child: Text("Some error occured. Please try later.."));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  color: appPrimaryColor,
                ));
              }
              return Scrollbar(
                thumbVisibility: true,
                thickness: 6,
                radius: const Radius.circular(20),
                child: MyRefreshIndicator(
                    loadData: ({bool? nextPage}) {
                      // this provide paging. But assignment task not wanted paging.
                      return null;
                    },
                    padding: const EdgeInsets.only(top: 48),
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final data = snapshot.data?[index];
                      final Color color =
                          HexColor.fromHex(data?.color ?? '#aabbcc');

                      return MyAppointmentListContainer(
                          data: data,
                          color: color,
                          appSecondaryTextColor: appSecondaryTextColor);
                    }),
              );
            }));
  }
}

class MyAppointmentListContainer extends StatelessWidget {
  const MyAppointmentListContainer({
    Key? key,
    required this.data,
    required this.color,
    required this.appSecondaryTextColor,
  }) : super(key: key);

  final AppointmentModel? data;
  final Color color;
  final Color appSecondaryTextColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (data != null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AppointmentDetail(appointmentModel: data!)));
        }
      },
      child: Container(
        height: 167,
        margin: const EdgeInsets.only(left: 24, right: 24, top: 0, bottom: 12),
        decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.only(left: 12, right: 12, top: 12),
                    width: double.maxFinite,
                    padding:
                        const EdgeInsets.only(left: 12, right: 12, top: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white.withOpacity(0.5)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  NetworkImage(data?.photo ?? "null", scale: 2),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 110,
                                  child: Text(
                                    data?.doctor ?? "null",
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Tedavi",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: appSecondaryTextColor),
                                    ),
                                    Text(
                                      data?.treatment ?? "null",
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              color: Colors.grey.shade50,
                            ),
                          ),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 4,
                                backgroundColor: Colors.black,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                data?.type ?? "",
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      height: 46,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.grey.shade50,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SvgIconFromAssets(
                              height: 13,
                              width: 14,
                              iconName: "calendar-Filled"),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            data?.datetime?.dateFormatWithoutHour() ?? "null",
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: Container(
                      height: 46,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        border: Border.all(
                          color: Colors.grey.shade50,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SvgIconFromAssets(
                              height: 13, width: 14, iconName: "clock"),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            data?.datetime?.dateFormatJustHour() ?? "null",
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

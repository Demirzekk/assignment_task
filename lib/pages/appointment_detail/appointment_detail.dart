import 'package:assignment_task/base/base_widgets.dart';
import 'package:assignment_task/pages/appointment_page/appointment_model.dart';
import 'package:assignment_task/utility/extensions/general_extensions.dart';
import 'package:flutter/material.dart';

class AppointmentDetail extends StatelessWidget {
  const AppointmentDetail({super.key, required this.appointmentModel});
  final AppointmentModel appointmentModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Randevu Detay",
      ),
      body: Scrollbar(
        thumbVisibility: true,
        trackVisibility: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyAppointmentsDetailContainers(
                  appointmentModel: appointmentModel),
              DetailListiles(appointmentModel: appointmentModel),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailListiles extends StatelessWidget {
  const DetailListiles({
    Key? key,
    required this.appointmentModel,
  }) : super(key: key);

  final AppointmentModel appointmentModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 12,
        ),
        InfoListtile(
            iconName: "dash",
            title: "Randevu Id",
            appointmentId: appointmentModel.id ?? "null"),
        InfoListtile(
            iconName: "paper",
            title: "Tedavi",
            appointmentId: appointmentModel.treatment ?? "null"),
        InfoListtile(
            iconName: "doctor",
            title: "Doctor",
            appointmentId: appointmentModel.doctor ?? "null"),
        const FeedBackHeaderWidget(),
        const RateStarsWidgets(),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            appointmentModel.feedbackComment ?? "null",
            style: const TextStyle(fontSize: 14),
          ),
        )
      ],
    );
  }
}

class FeedBackHeaderWidget extends StatelessWidget {
  const FeedBackHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 232, 232, 232),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              SvgIconFromAssets(
                iconName: "ring",
                height: 15,
                width: 15,
                color: Colors.purple,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                "Geri bildirim",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SvgIconFromAssets(
            iconName: "ok_down",
            height: 10,
            width: 10,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}

class MyAppointmentsDetailContainers extends StatelessWidget {
  const MyAppointmentsDetailContainers({
    Key? key,
    required this.appointmentModel,
  }) : super(key: key);

  final AppointmentModel appointmentModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MyAppointmentDetailContainer(
            iconName: "healty_guard",
            appointmentType: appointmentModel.type ?? "null",
            title: "Randevu türü",
            color: const Color(0xff58489D)),
        MyAppointmentDetailContainer(
          iconName: "calendar-Filled",
          appointmentType:
              appointmentModel.datetime?.dateFormatWithoutHour() ?? "null",
          title: "Tarih",
          color: const Color(0xff316A49),
        ),
        MyAppointmentDetailContainer(
            iconName: "clock",
            appointmentType:
                appointmentModel.datetime?.dateFormatJustHour() ?? "null",
            title: "Saat",
            color: const Color(0xff7C4F47))
      ],
    );
  }
}

class RateStarsWidgets extends StatelessWidget {
  const RateStarsWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (int i = 0; i < 5; i++)
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  SvgIconFromAssets(
                    iconName: "stars",
                    height: 30,
                    width: 29,
                    color: Colors.yellow.shade700,
                    padding: const EdgeInsets.only(bottom: 8),
                  ),
                  Text(
                    i.starsIndexToNamed ?? "",
                    style: const TextStyle(color: Color(0xff6B7386)),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}

class InfoListtile extends StatelessWidget {
  const InfoListtile({
    Key? key,
    required this.iconName,
    required this.title,
    required this.appointmentId,
  }) : super(key: key);
  final String iconName;
  final String title;
  final String appointmentId;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgIconFromAssets(
                    iconName: iconName,
                    height: 19,
                    width: 19,
                    color: const Color(0xff899DC5)),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Flexible(
              child: Text(
            appointmentId,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
          ))
        ],
      ),
    );
  }
}

class MyAppointmentDetailContainer extends StatelessWidget {
  const MyAppointmentDetailContainer({
    Key? key,
    required this.iconName,
    required this.title,
    required this.appointmentType,
    required this.color,
  }) : super(key: key);
  final String iconName;
  final String title;
  final String appointmentType;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 79,
      width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      margin: const EdgeInsets.only(
        top: 24,
      ),
      decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgIconFromAssets(
              iconName: iconName, height: 19, width: 15, color: color),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
          ),
          Text(
            appointmentType,
            style: const TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}

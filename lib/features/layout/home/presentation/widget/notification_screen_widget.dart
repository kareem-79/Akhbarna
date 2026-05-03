import 'package:akhbarna/features/layout/home/presentation/widget/notification_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/resources/assets_managers.dart';
import 'notification_header_widget.dart';

class NotificationScreenWidget extends StatefulWidget {
  const NotificationScreenWidget({super.key});

  @override
  State<NotificationScreenWidget> createState() =>
      _NotificationScreenWidgetState();
}

class _NotificationScreenWidgetState extends State<NotificationScreenWidget> {
  List<int> items = [1, 2, 3, 4, 5, 6, 7];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color shadowColor = Theme.of(context).shadowColor;

    return Scaffold(
      body: Column(
        children: [
          NotificationHeaderWidget(
            onDeleteAll: () {
              setState(() {
                items.clear();
              });
            },
          ),
          Expanded(
            child: items.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          IconManagers.noNotification,
                          width: 250,
                          height: 250,
                          color: shadowColor,
                        ),
                        SizedBox(height: 10),
                        Text("لا يوجد اشعارات", style: textTheme.bodyLarge),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return NotificationItemWidget(
                        onDelete: () {
                          setState(() {
                            items.removeAt(index);
                          });
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

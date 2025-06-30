import 'package:dreamvila/core/utils/app_export.dart';

void showContextMenu(BuildContext context, Offset offset) async {
  showMenu(
    context: context,
    color: Colors.white,
    position: RelativeRect.fromLTRB(offset.dx, offset.dy, offset.dx, offset.dy),
    items: [
      const PopupMenuItem(
          value: 'update',
          child: Text(
            'Update',
            style: TextStyle(fontSize: 12, color: Colors.black54),
          )),
      const PopupMenuItem(
        value: 'delete',
        child: Text(
          'Delete',
          style: TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ),
    ],
  );
}

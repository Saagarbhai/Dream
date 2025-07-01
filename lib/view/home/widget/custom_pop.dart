import 'package:dreamvila/core/utils/app_export.dart';

void showContextMenu(BuildContext context, Offset offset,
    VoidCallback onupdatetap, VoidCallback ondeletetap) async {
  showMenu(
    context: context,
    color: Colors.white,
    position: RelativeRect.fromLTRB(offset.dx, offset.dy, offset.dx, offset.dy),
    items: [
      PopupMenuItem(
        value: 'update',
        onTap: onupdatetap,
        child: Text(
          'Update',
          style: TextStyle(fontSize: 16),
        ),
      ),
      PopupMenuItem(
        value: 'delete',
        onTap: ondeletetap,
        child: Text(
          'Delete',
          style: TextStyle(fontSize: 16),
        ),
      ),
    ],
  );
}

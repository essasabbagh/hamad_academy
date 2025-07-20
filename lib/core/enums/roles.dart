import 'package:hamad/core/data/storage_service.dart';
import 'package:hamad/core/keys/keys.dart';
import 'package:hamad/features/auth/models/auth_model.dart';
import 'package:hamad/initialize_app.dart';

enum UserRole {
  teacher,
  student,
  parent,
  supervisor;

  String get name {
    return switch (this) {
      UserRole.student => 'Student',
      UserRole.parent => 'Parent',
      UserRole.teacher => 'Teacher',
      UserRole.supervisor => 'Supervisor',
    };
  }
}

extension RolesExtension on String {
  UserRole? get toRole => switch (toLowerCase()) {
    'teacher' => UserRole.teacher,
    'student' => UserRole.student,
    'guardian' => UserRole.parent,
    'supervisor' => UserRole.supervisor,
    _ => null,
  };
}

UserRole getCurrentRole() {
  final storageService = locator<StorageService>();
  final storedJson = storageService.readJson(localUserKey);

  if (storedJson == null) return UserRole.student;

  final role = AuthModel.fromJson(storedJson).data?.role?.toRole;
  return role ?? UserRole.student;
}

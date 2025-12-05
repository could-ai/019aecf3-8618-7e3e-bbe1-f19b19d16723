class Permissions {
  // Backend keyword map for permissions lookup
  static const Map<String, String> permissionMap = {
    'investment': 'investments',
    'withdrawal': 'withdrawals',
    'payout': 'payouts',
    'referral': 'referrals',
    'clients': 'users',
  };

  // Helper: Role owner always fully allowed
  static bool isOwner(Map<String, dynamic>? role) {
    return role?['name'] == 'owner';
  }

  // Check if module can be shown in UI (Table Tab Visible)
  static bool moduleAllowedForDisplay(Map<String, dynamic> permissionsObj, String? backendKey, Map<String, dynamic>? role) {
    if (permissionsObj.isEmpty || backendKey == null) return false;
    if (isOwner(role)) return true;

    final module = permissionsObj[backendKey];
    if (module == null) return false;

    return (module['canView'] == true ||
        module['canCreate'] == true ||
        module['canEdit'] == true ||
        module['canApproveReject'] == true ||
        module['canDelete'] == true ||
        module['canExport'] == true ||
        module['canSeeConfidentialData'] == true);
  }

  // Create permission check
  static bool canCreateModule(Map<String, dynamic> permissionsObj, String? backendKey, Map<String, dynamic>? role) {
    if (isOwner(role)) return true;
    return permissionsObj[backendKey]?['canCreate'] == true;
  }

  // Approval / Reject permission check
  static bool canApproveReject(Map<String, dynamic> permissionsObj, String? backendKey, Map<String, dynamic>? role) {
    if (isOwner(role)) return true;
    return permissionsObj[backendKey]?['canApproveReject'] == true;
  }

  // Edit permission check
  static bool canEdit(Map<String, dynamic> permissionsObj, String? backendKey, Map<String, dynamic>? role) {
    if (isOwner(role)) return true;
    return permissionsObj[backendKey]?['canEdit'] == true;
  }

  // Create permission check (alias for consistency with your code)
  static bool canCreate(Map<String, dynamic> permissionsObj, String? backendKey, Map<String, dynamic>? role) {
    if (isOwner(role)) return true;
    return permissionsObj[backendKey]?['canCreate'] == true;
  }

  // Delete permission check
  static bool canDeleteModule(Map<String, dynamic> permissionsObj, String? backendKey, Map<String, dynamic>? role) {
    if (isOwner(role)) return true;
    return permissionsObj[backendKey]?['canDelete'] == true;
  }

  // View permission check
  static bool canViewModule(Map<String, dynamic> permissionsObj, String? backendKey, Map<String, dynamic>? role) {
    if (isOwner(role)) return true;
    return permissionsObj[backendKey]?['canView'] == true;
  }
}

class StokvelRuleResponse {
  String? stokvelId;
  StokvelRuleResponse.fromJson(Map<String, dynamic> json) {
    stokvelId = json['stokvel_id'];
  }
}

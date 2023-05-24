class Ticket {
  String title;
  int id;
  int alertId;
  String picture;
  String description;

  Ticket.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        id = json["id"],
        alertId = json["alert_id"],
        picture = json["picture"],
        description = json["description"];
}

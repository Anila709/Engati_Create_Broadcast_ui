class DemoModel{

  String broadcastName;
  String targetChannel;
  String broadcastType;
  String broadcastMessage;
  String targetSegment;
  String broadcastRepeatition;
  String date;
  String time;
  
  DemoModel({
    required this.broadcastName,
    required this.targetChannel,
    required this.broadcastType,
    required this.broadcastMessage,
    required this.targetSegment,
    required this.broadcastRepeatition,
    required this.date,
    required this.time,
  });

  Map<String,dynamic> toJson(){
    return {
      "broadcastName" : broadcastName,
      "targetChannel":targetChannel,
      "broadcastType":broadcastType,
      "broadcastMessage":broadcastMessage,
      "targetSegment":targetSegment,
      "broadcastRepeatition":broadcastRepeatition,
      "date":date,
      "time":time,
    };
  }
}
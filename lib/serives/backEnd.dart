import 'dart:convert';
import 'package:chatbot/serives/open_ai.dart';
import 'package:http/http.dart' as http;
import 'package:chatbot/utils/logger.dart';

class BackendServices implements Implementlog {
  @override
  // TODO: implement showLogs
  bool get showLogs => true;
  @override
  void log(message, functionName, {LogType logType = LogType.info}) {
    if (showLogs) return;

    functionName = 'merchantBackendService.dart: ' + functionName.toString();

    switch (logType) {
      case LogType.info:
        Logger.logI(message, functionName);
        break;
      case LogType.success:
        Logger.logS(message, functionName);
        break;
      case LogType.error:
        Logger.logE(message, functionName);
        break;
      case LogType.warning:
        Logger.logW(message, functionName);
        break;
      case LogType.danger:
        Logger.logU(message, functionName);
        break;
    }
  }

  Future<String> openAI({required String text}) async {
    var urlString = "https://api.openai.com/v1/completions";
    var url = Uri.parse(urlString);

    var body = jsonEncode({
      "model": "gpt-3.5-turbo-instruct",
      "prompt": text,
      "max_tokens": 2000,
      "temperature": 0.1,
    });
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${api + "-" + key}",
    };
    final response = await http.post(url, headers: headers, body: body);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse.toString());
    return "${jsonResponse['choices'][0]['text']}";
  }
}

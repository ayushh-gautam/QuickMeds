
import 'package:get_ip_address/get_ip_address.dart';

Future<String> getUserIPAddress() async {
  try {
    var ipAddress = IpAddress(type: RequestType.json);
    dynamic data = await ipAddress.getIpAddress();
    return data['ip'];
  } on IpAddressException catch (exception) {
    throw Exception('Failed to get IP address: ${exception.message}');
  }
}

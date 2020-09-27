import 'package:grpc/grpc.dart';
import 'package:grpc/src/server/call.dart';
import 'package:grpc_example/src/generated/helloworld.pbgrpc.dart';

class GreeterService extends GreeterServiceBase {
  @override
  Future<HelloReply> sayHello(ServiceCall call, HelloRequest request) async {
    return HelloReply()..message = 'Hello, ${request.name}!';
  }
}

Future main(List<String> args) async {
  final server = Server([GreeterService()]);
  await server.serve(port: 50051);
  print('Server listening on port ${server.port}...');
}

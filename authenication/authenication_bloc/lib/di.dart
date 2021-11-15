import 'bloc/authenication_bloc.dart';
import 'package:authenication_repository/repositories/authenication_client.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_cpnetworking_service/flutter_cpnetworking_service.dart';

void buildDI({
  required StorageTokenProcessor storageTokenProcessor,
  required NetworkConfigurable networkConfigurable,
}) async {
  GetIt.instance.registerFactory<AuthenicationBloc>(() {
    var client = AuthenicationClient(
        storageTokenProcessor: storageTokenProcessor,
        networkConfigurable: networkConfigurable);

    return AuthenicationBloc(
        repository: client,
        storageTokenProcessor: storageTokenProcessor,
        domain: networkConfigurable);
  });
}

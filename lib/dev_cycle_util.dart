
import 'package:dartz/dartz.dart';
import 'package:devcycle_flutter_client_sdk/devcycle_flutter_client_sdk.dart';
import 'package:temp_project/const.dart';
import 'package:temp_project/failure.dart';

abstract class IDevCycleUtils {
  Future<Either<Failure, String>> getAdsData();
}


class DevCycleUtil extends IDevCycleUtils {
  DevCycleClient? devCClient;

  DevCycleClient _setupDevCycleClient(String? userId){
    if(devCClient == null) {
      devCClient = DevCycleClientBuilder()
          .sdkKey(devCycleKey ?? "")
          .user(DevCycleUserBuilder().userId(userId ?? '1ee').build())
          .options(DevCycleOptionsBuilder().logLevel(LogLevel.info).build())
          .build();
      return devCClient!;
    } else {
      return devCClient!;
    }
  }
  
  @override
  Future<Either<Failure, String>> getAdsData() async {
    try{
      var client = _setupDevCycleClient("1ee");
      var adsData = await client.variableValue('ads-management', {});
      print("DEV CYCLE ADS");
      print(adsData);
      return Right(adsData.toString());
    }catch(e){
      return Left(DevCycleFailure());
    }
  }

}
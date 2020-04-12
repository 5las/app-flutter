import 'package:app_5las/src/core/network/network_info.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker{}

void main(){
  NetworkInfoImpl networkInfoImpl;
  MockDataConnectionChecker mockDataConnectionChecker;

  setUp((){
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group('isConnected', (){
    test(
      'should forwars the call to DataConnectionChecker.hasConnection',
          () async {
        // arrange
            final tHasConnectionFuture = Future.value(true);

          when(mockDataConnectionChecker.hasConnection)
              .thenAnswer((_) async => tHasConnectionFuture);
        //act
          final result = await networkInfoImpl.isConnected;
        //assert
          verify(mockDataConnectionChecker.hasConnection);
          expect(result, true);
      },
    );
  });

}
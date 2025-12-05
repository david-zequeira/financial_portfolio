import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

/// Mock Storage for HydratedBloc testing
class MockStorage extends Mock implements Storage {}

late Storage hydratedStorage;

/// Initialize mock storage with default empty behavior
void initMockHydratedStorage() {
  TestWidgetsFlutterBinding.ensureInitialized();
  hydratedStorage = MockStorage();

  // Mock write operation
  when(
    () => hydratedStorage.write(any(), any<dynamic>()),
  ).thenAnswer((_) async {});

  // Mock read operation - returns null by default (no persisted state)
  when(() => hydratedStorage.read(any())).thenReturn(null);

  // Mock delete operation
  when(() => hydratedStorage.delete(any())).thenAnswer((_) async {});

  // Mock clear operation
  when(() => hydratedStorage.clear()).thenAnswer((_) async {});

  HydratedBloc.storage = hydratedStorage;
}

/// Initialize mock storage with a specific persisted value
void initMockHydratedStorageWithValue(Map<String, dynamic> persistedValue) {
  TestWidgetsFlutterBinding.ensureInitialized();
  hydratedStorage = MockStorage();

  when(
    () => hydratedStorage.write(any(), any<dynamic>()),
  ).thenAnswer((_) async {});

  // Return the persisted value when read is called
  when(() => hydratedStorage.read(any())).thenReturn(persistedValue);

  when(() => hydratedStorage.delete(any())).thenAnswer((_) async {});

  when(() => hydratedStorage.clear()).thenAnswer((_) async {});

  HydratedBloc.storage = hydratedStorage;
}

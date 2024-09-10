import 'package:flutter_dotenv/flutter_dotenv.dart';

String? devCycleKey=dotenv.get('H_DEVELDEV_CYCLE_KEYSOPER_ID', fallback: 'no dev cycle key set');
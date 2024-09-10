import 'package:flutter_dotenv/flutter_dotenv.dart';

String? devCycleKey=dotenv.get('DEV_CYCLE_KEYS', fallback: 'no dev cycle key set');
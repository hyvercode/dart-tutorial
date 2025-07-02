import 'dart:io';
import 'package:system_info/system_info.dart';

const int MEGABYTE = 1024 * 1024;
int cpu = 0;
void main() {
  stdout.writeln();
  stdout.writeln("Welcome to Dart Programming System Information CLI");
  print(
    "========================= Information Detail =========================",
  );
  stdout.writeln();
  print("Operatig System         : ${SysInfo.operatingSystemName}");
  print("Operatig System Version : ${SysInfo.operatingSystemVersion}");
  print("Kernel architecture     : ${SysInfo.kernelArchitecture}");
  print("Kernel bitness          : ${SysInfo.kernelBitness}");
  print("Kernel name             : ${SysInfo.kernelName}");
  print("Kernel version          : ${SysInfo.kernelVersion}");
  print("Operating system name   : ${SysInfo.operatingSystemName}");
  print("Operating system version: ${SysInfo.operatingSystemVersion}");
  print("User directory          : ${SysInfo.userDirectory}");
  print("User id                 : ${SysInfo.userId}");
  print("User name               : ${SysInfo.userName}");
  print("User space bitness      : ${SysInfo.userSpaceBitness}");
  var processors = SysInfo.processors;
  print("Number of processors    : ${processors.length}");
  for (var processor in processors) {
    print("  Cpu                   : ${cpu++}");
    print("  Architecture          : ${processor.architecture}");
    print("  Name                  : ${processor.name}");
    print("  Socket                : ${processor.socket}");
    print("  Vendor                : ${processor.vendor}");
  }
  print(
    "Total physical memory   : ${SysInfo.getTotalPhysicalMemory() ~/ MEGABYTE} MB",
  );
  print(
    "Free physical memory    : ${SysInfo.getFreePhysicalMemory() ~/ MEGABYTE} MB",
  );
  print(
    "Total virtual memory    : ${SysInfo.getTotalVirtualMemory() ~/ MEGABYTE} MB",
  );
  print(
    "Free virtual memory     : ${SysInfo.getFreeVirtualMemory() ~/ MEGABYTE} MB",
  );
  print(
    "Virtual memory use     : ${SysInfo.getVirtualMemorySize() ~/ MEGABYTE} MB",
  );
}

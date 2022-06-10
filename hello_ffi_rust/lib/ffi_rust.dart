import 'dart:ffi';

import 'dart:io';

final DynamicLibrary ccl = Platform.isAndroid
    ? DynamicLibrary.open('libnative_rust.so')
    : DynamicLibrary.process();

final int Function(int x, int y) add = ccl
    .lookup<NativeFunction<Int32 Function(Int32, Int32)>>('add')
    .asFunction();
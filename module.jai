#module_parameters(USE_STATIC_LIB := true);

#if OS == .WINDOWS && USE_STATIC_LIB {
    #system_library,link_always "gdi32";
    #system_library,link_always "user32";
    #system_library,link_always "shell32";
} else #if OS == .LINUX && USE_STATIC_LIB {
    #system_library,link_always "libm";
} else #if OS == .MACOS && USE_STATIC_LIB {
    #system_library,link_always "IOKit";
}

GLFW_USE_STATIC_LIB :: USE_STATIC_LIB;

#if OS == .WINDOWS {
    #load "dist/windows/windows.jai";
} else #if OS == .MACOS {
    #load "dist/macos/macos.jai";
} else #if OS == .LINUX {
    #load "dist/linux/linux.jai";
} else {
    #assert false "OS not supported";
}

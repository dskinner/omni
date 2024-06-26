(define-module (glfw ffi))

(use-modules (system foreign) (system foreign-library))

(define-public GLFW_VERSION_MAJOR           3)
(define-public GLFW_VERSION_MINOR           3)
(define-public GLFW_VERSION_REVISION        4)
(define-public GLFW_TRUE                    1)
(define-public GLFW_FALSE                   0)
(define-public GLFW_RELEASE                 0)
(define-public GLFW_PRESS                   1)
(define-public GLFW_REPEAT                  2)
(define-public GLFW_HAT_CENTERED            0)
(define-public GLFW_HAT_UP                  1)
(define-public GLFW_HAT_RIGHT               2)
(define-public GLFW_HAT_DOWN                4)
(define-public GLFW_HAT_LEFT                8)
(define-public GLFW_HAT_RIGHT_UP            (logior GLFW_HAT_RIGHT GLFW_HAT_UP))
(define-public GLFW_HAT_RIGHT_DOWN          (logior GLFW_HAT_RIGHT GLFW_HAT_DOWN))
(define-public GLFW_HAT_LEFT_UP             (logior GLFW_HAT_LEFT GLFW_HAT_UP))
(define-public GLFW_HAT_LEFT_DOWN           (logior GLFW_HAT_LEFT GLFW_HAT_DOWN))
(define-public GLFW_KEY_UNKNOWN             -1)
(define-public GLFW_KEY_SPACE               32)
(define-public GLFW_KEY_APOSTROPHE          39)
(define-public GLFW_KEY_COMMA               44)
(define-public GLFW_KEY_MINUS               45)
(define-public GLFW_KEY_PERIOD              46)
(define-public GLFW_KEY_SLASH               47)
(define-public GLFW_KEY_0                   48)
(define-public GLFW_KEY_1                   49)
(define-public GLFW_KEY_2                   50)
(define-public GLFW_KEY_3                   51)
(define-public GLFW_KEY_4                   52)
(define-public GLFW_KEY_5                   53)
(define-public GLFW_KEY_6                   54)
(define-public GLFW_KEY_7                   55)
(define-public GLFW_KEY_8                   56)
(define-public GLFW_KEY_9                   57)
(define-public GLFW_KEY_SEMICOLON           59)
(define-public GLFW_KEY_EQUAL               61)
(define-public GLFW_KEY_A                   65)
(define-public GLFW_KEY_B                   66)
(define-public GLFW_KEY_C                   67)
(define-public GLFW_KEY_D                   68)
(define-public GLFW_KEY_E                   69)
(define-public GLFW_KEY_F                   70)
(define-public GLFW_KEY_G                   71)
(define-public GLFW_KEY_H                   72)
(define-public GLFW_KEY_I                   73)
(define-public GLFW_KEY_J                   74)
(define-public GLFW_KEY_K                   75)
(define-public GLFW_KEY_L                   76)
(define-public GLFW_KEY_M                   77)
(define-public GLFW_KEY_N                   78)
(define-public GLFW_KEY_O                   79)
(define-public GLFW_KEY_P                   80)
(define-public GLFW_KEY_Q                   81)
(define-public GLFW_KEY_R                   82)
(define-public GLFW_KEY_S                   83)
(define-public GLFW_KEY_T                   84)
(define-public GLFW_KEY_U                   85)
(define-public GLFW_KEY_V                   86)
(define-public GLFW_KEY_W                   87)
(define-public GLFW_KEY_X                   88)
(define-public GLFW_KEY_Y                   89)
(define-public GLFW_KEY_Z                   90)
(define-public GLFW_KEY_LEFT_BRACKET        91)
(define-public GLFW_KEY_BACKSLASH           92)
(define-public GLFW_KEY_RIGHT_BRACKET       93)
(define-public GLFW_KEY_GRAVE_ACCENT        96)
(define-public GLFW_KEY_WORLD_1             161)
(define-public GLFW_KEY_WORLD_2             162)
(define-public GLFW_KEY_ESCAPE              256)
(define-public GLFW_KEY_ENTER               257)
(define-public GLFW_KEY_TAB                 258)
(define-public GLFW_KEY_BACKSPACE           259)
(define-public GLFW_KEY_INSERT              260)
(define-public GLFW_KEY_DELETE              261)
(define-public GLFW_KEY_RIGHT               262)
(define-public GLFW_KEY_LEFT                263)
(define-public GLFW_KEY_DOWN                264)
(define-public GLFW_KEY_UP                  265)
(define-public GLFW_KEY_PAGE_UP             266)
(define-public GLFW_KEY_PAGE_DOWN           267)
(define-public GLFW_KEY_HOME                268)
(define-public GLFW_KEY_END                 269)
(define-public GLFW_KEY_CAPS_LOCK           280)
(define-public GLFW_KEY_SCROLL_LOCK         281)
(define-public GLFW_KEY_NUM_LOCK            282)
(define-public GLFW_KEY_PRINT_SCREEN        283)
(define-public GLFW_KEY_PAUSE               284)
(define-public GLFW_KEY_F1                  290)
(define-public GLFW_KEY_F2                  291)
(define-public GLFW_KEY_F3                  292)
(define-public GLFW_KEY_F4                  293)
(define-public GLFW_KEY_F5                  294)
(define-public GLFW_KEY_F6                  295)
(define-public GLFW_KEY_F7                  296)
(define-public GLFW_KEY_F8                  297)
(define-public GLFW_KEY_F9                  298)
(define-public GLFW_KEY_F10                 299)
(define-public GLFW_KEY_F11                 300)
(define-public GLFW_KEY_F12                 301)
(define-public GLFW_KEY_F13                 302)
(define-public GLFW_KEY_F14                 303)
(define-public GLFW_KEY_F15                 304)
(define-public GLFW_KEY_F16                 305)
(define-public GLFW_KEY_F17                 306)
(define-public GLFW_KEY_F18                 307)
(define-public GLFW_KEY_F19                 308)
(define-public GLFW_KEY_F20                 309)
(define-public GLFW_KEY_F21                 310)
(define-public GLFW_KEY_F22                 311)
(define-public GLFW_KEY_F23                 312)
(define-public GLFW_KEY_F24                 313)
(define-public GLFW_KEY_F25                 314)
(define-public GLFW_KEY_KP_0                320)
(define-public GLFW_KEY_KP_1                321)
(define-public GLFW_KEY_KP_2                322)
(define-public GLFW_KEY_KP_3                323)
(define-public GLFW_KEY_KP_4                324)
(define-public GLFW_KEY_KP_5                325)
(define-public GLFW_KEY_KP_6                326)
(define-public GLFW_KEY_KP_7                327)
(define-public GLFW_KEY_KP_8                328)
(define-public GLFW_KEY_KP_9                329)
(define-public GLFW_KEY_KP_DECIMAL          330)
(define-public GLFW_KEY_KP_DIVIDE           331)
(define-public GLFW_KEY_KP_MULTIPLY         332)
(define-public GLFW_KEY_KP_SUBTRACT         333)
(define-public GLFW_KEY_KP_ADD              334)
(define-public GLFW_KEY_KP_ENTER            335)
(define-public GLFW_KEY_KP_EQUAL            336)
(define-public GLFW_KEY_LEFT_SHIFT          340)
(define-public GLFW_KEY_LEFT_CONTROL        341)
(define-public GLFW_KEY_LEFT_ALT            342)
(define-public GLFW_KEY_LEFT_SUPER          343)
(define-public GLFW_KEY_RIGHT_SHIFT         344)
(define-public GLFW_KEY_RIGHT_CONTROL       345)
(define-public GLFW_KEY_RIGHT_ALT           346)
(define-public GLFW_KEY_RIGHT_SUPER         347)
(define-public GLFW_KEY_MENU                348)
(define-public GLFW_KEY_LAST                GLFW_KEY_MENU)
(define-public GLFW_MOD_SHIFT            #x0001)
(define-public GLFW_MOD_CONTROL          #x0002)
(define-public GLFW_MOD_ALT              #x0004)
(define-public GLFW_MOD_SUPER            #x0008)
(define-public GLFW_MOD_CAPS_LOCK        #x0010)
(define-public GLFW_MOD_NUM_LOCK         #x0020)
(define-public GLFW_MOUSE_BUTTON_1          0)
(define-public GLFW_MOUSE_BUTTON_2          1)
(define-public GLFW_MOUSE_BUTTON_3          2)
(define-public GLFW_MOUSE_BUTTON_4          3)
(define-public GLFW_MOUSE_BUTTON_5          4)
(define-public GLFW_MOUSE_BUTTON_6          5)
(define-public GLFW_MOUSE_BUTTON_7          6)
(define-public GLFW_MOUSE_BUTTON_8          7)
(define-public GLFW_MOUSE_BUTTON_LAST       GLFW_MOUSE_BUTTON_8)
(define-public GLFW_MOUSE_BUTTON_LEFT       GLFW_MOUSE_BUTTON_1)
(define-public GLFW_MOUSE_BUTTON_RIGHT      GLFW_MOUSE_BUTTON_2)
(define-public GLFW_MOUSE_BUTTON_MIDDLE     GLFW_MOUSE_BUTTON_3)
(define-public GLFW_JOYSTICK_1              0)
(define-public GLFW_JOYSTICK_2              1)
(define-public GLFW_JOYSTICK_3              2)
(define-public GLFW_JOYSTICK_4              3)
(define-public GLFW_JOYSTICK_5              4)
(define-public GLFW_JOYSTICK_6              5)
(define-public GLFW_JOYSTICK_7              6)
(define-public GLFW_JOYSTICK_8              7)
(define-public GLFW_JOYSTICK_9              8)
(define-public GLFW_JOYSTICK_10             9)
(define-public GLFW_JOYSTICK_11             10)
(define-public GLFW_JOYSTICK_12             11)
(define-public GLFW_JOYSTICK_13             12)
(define-public GLFW_JOYSTICK_14             13)
(define-public GLFW_JOYSTICK_15             14)
(define-public GLFW_JOYSTICK_16             15)
(define-public GLFW_JOYSTICK_LAST           GLFW_JOYSTICK_16)
(define-public GLFW_GAMEPAD_BUTTON_A                0)
(define-public GLFW_GAMEPAD_BUTTON_B                1)
(define-public GLFW_GAMEPAD_BUTTON_X                2)
(define-public GLFW_GAMEPAD_BUTTON_Y                3)
(define-public GLFW_GAMEPAD_BUTTON_LEFT_BUMPER      4)
(define-public GLFW_GAMEPAD_BUTTON_RIGHT_BUMPER     5)
(define-public GLFW_GAMEPAD_BUTTON_BACK             6)
(define-public GLFW_GAMEPAD_BUTTON_START            7)
(define-public GLFW_GAMEPAD_BUTTON_GUIDE            8)
(define-public GLFW_GAMEPAD_BUTTON_LEFT_THUMB       9)
(define-public GLFW_GAMEPAD_BUTTON_RIGHT_THUMB      10)
(define-public GLFW_GAMEPAD_BUTTON_DPAD_UP          11)
(define-public GLFW_GAMEPAD_BUTTON_DPAD_RIGHT       12)
(define-public GLFW_GAMEPAD_BUTTON_DPAD_DOWN        13)
(define-public GLFW_GAMEPAD_BUTTON_DPAD_LEFT        14)
(define-public GLFW_GAMEPAD_BUTTON_LAST             GLFW_GAMEPAD_BUTTON_DPAD_LEFT)
(define-public GLFW_GAMEPAD_BUTTON_CROSS        GLFW_GAMEPAD_BUTTON_A)
(define-public GLFW_GAMEPAD_BUTTON_CIRCLE       GLFW_GAMEPAD_BUTTON_B)
(define-public GLFW_GAMEPAD_BUTTON_SQUARE       GLFW_GAMEPAD_BUTTON_X)
(define-public GLFW_GAMEPAD_BUTTON_TRIANGLE     GLFW_GAMEPAD_BUTTON_Y)
(define-public GLFW_GAMEPAD_AXIS_LEFT_X         0)
(define-public GLFW_GAMEPAD_AXIS_LEFT_Y         1)
(define-public GLFW_GAMEPAD_AXIS_RIGHT_X        2)
(define-public GLFW_GAMEPAD_AXIS_RIGHT_Y        3)
(define-public GLFW_GAMEPAD_AXIS_LEFT_TRIGGER   4)
(define-public GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER  5)
(define-public GLFW_GAMEPAD_AXIS_LAST           GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER)
(define-public GLFW_NO_ERROR                0)
(define-public GLFW_NOT_INITIALIZED         #x00010001)
(define-public GLFW_NO_CURRENT_CONTEXT      #x00010002)
(define-public GLFW_INVALID_ENUM            #x00010003)
(define-public GLFW_INVALID_VALUE           #x00010004)
(define-public GLFW_OUT_OF_MEMORY           #x00010005)
(define-public GLFW_API_UNAVAILABLE         #x00010006)
(define-public GLFW_VERSION_UNAVAILABLE     #x00010007)
(define-public GLFW_PLATFORM_ERROR          #x00010008)
(define-public GLFW_FORMAT_UNAVAILABLE      #x00010009)
(define-public GLFW_NO_WINDOW_CONTEXT       #x0001000A)
(define-public GLFW_FOCUSED                 #x00020001)
(define-public GLFW_ICONIFIED               #x00020002)
(define-public GLFW_RESIZABLE               #x00020003)
(define-public GLFW_VISIBLE                 #x00020004)
(define-public GLFW_DECORATED               #x00020005)
(define-public GLFW_AUTO_ICONIFY            #x00020006)
(define-public GLFW_FLOATING                #x00020007)
(define-public GLFW_MAXIMIZED               #x00020008)
(define-public GLFW_CENTER_CURSOR           #x00020009)
(define-public GLFW_TRANSPARENT_FRAMEBUFFER  #x0002000A)
(define-public GLFW_HOVERED                 #x0002000B)
(define-public GLFW_FOCUS_ON_SHOW           #x0002000C)
(define-public GLFW_RED_BITS                #x00021001)
(define-public GLFW_GREEN_BITS              #x00021002)
(define-public GLFW_BLUE_BITS               #x00021003)
(define-public GLFW_ALPHA_BITS              #x00021004)
(define-public GLFW_DEPTH_BITS              #x00021005)
(define-public GLFW_STENCIL_BITS            #x00021006)
(define-public GLFW_ACCUM_RED_BITS          #x00021007)
(define-public GLFW_ACCUM_GREEN_BITS        #x00021008)
(define-public GLFW_ACCUM_BLUE_BITS         #x00021009)
(define-public GLFW_ACCUM_ALPHA_BITS        #x0002100A)
(define-public GLFW_AUX_BUFFERS             #x0002100B)
(define-public GLFW_STEREO                  #x0002100C)
(define-public GLFW_SAMPLES                 #x0002100D)
(define-public GLFW_SRGB_CAPABLE            #x0002100E)
(define-public GLFW_REFRESH_RATE            #x0002100F)
(define-public GLFW_DOUBLEBUFFER            #x00021010)
(define-public GLFW_CLIENT_API              #x00022001)
(define-public GLFW_CONTEXT_VERSION_MAJOR   #x00022002)
(define-public GLFW_CONTEXT_VERSION_MINOR   #x00022003)
(define-public GLFW_CONTEXT_REVISION        #x00022004)
(define-public GLFW_CONTEXT_ROBUSTNESS      #x00022005)
(define-public GLFW_OPENGL_FORWARD_COMPAT   #x00022006)
(define-public GLFW_OPENGL_DEBUG_CONTEXT    #x00022007)
(define-public GLFW_OPENGL_PROFILE          #x00022008)
(define-public GLFW_CONTEXT_RELEASE_BEHAVIOR  #x00022009)
(define-public GLFW_CONTEXT_NO_ERROR        #x0002200A)
(define-public GLFW_CONTEXT_CREATION_API    #x0002200B)
(define-public GLFW_SCALE_TO_MONITOR        #x0002200C)
(define-public GLFW_COCOA_RETINA_FRAMEBUFFER  #x00023001)
(define-public GLFW_COCOA_FRAME_NAME          #x00023002)
(define-public GLFW_COCOA_GRAPHICS_SWITCHING  #x00023003)
(define-public GLFW_X11_CLASS_NAME          #x00024001)
(define-public GLFW_X11_INSTANCE_NAME       #x00024002)
(define-public GLFW_NO_API                           0)
(define-public GLFW_OPENGL_API              #x00030001)
(define-public GLFW_OPENGL_ES_API           #x00030002)
(define-public GLFW_NO_ROBUSTNESS                    0)
(define-public GLFW_NO_RESET_NOTIFICATION   #x00031001)
(define-public GLFW_LOSE_CONTEXT_ON_RESET   #x00031002)
(define-public GLFW_OPENGL_ANY_PROFILE               0)
(define-public GLFW_OPENGL_CORE_PROFILE     #x00032001)
(define-public GLFW_OPENGL_COMPAT_PROFILE   #x00032002)
(define-public GLFW_CURSOR                  #x00033001)
(define-public GLFW_STICKY_KEYS             #x00033002)
(define-public GLFW_STICKY_MOUSE_BUTTONS    #x00033003)
(define-public GLFW_LOCK_KEY_MODS           #x00033004)
(define-public GLFW_RAW_MOUSE_MOTION        #x00033005)
(define-public GLFW_CURSOR_NORMAL           #x00034001)
(define-public GLFW_CURSOR_HIDDEN           #x00034002)
(define-public GLFW_CURSOR_DISABLED         #x00034003)
(define-public GLFW_ANY_RELEASE_BEHAVIOR             0)
(define-public GLFW_RELEASE_BEHAVIOR_FLUSH  #x00035001)
(define-public GLFW_RELEASE_BEHAVIOR_NONE   #x00035002)
(define-public GLFW_NATIVE_CONTEXT_API      #x00036001)
(define-public GLFW_EGL_CONTEXT_API         #x00036002)
(define-public GLFW_OSMESA_CONTEXT_API      #x00036003)
(define-public GLFW_ARROW_CURSOR            #x00036001)
(define-public GLFW_IBEAM_CURSOR            #x00036002)
(define-public GLFW_CROSSHAIR_CURSOR        #x00036003)
(define-public GLFW_HAND_CURSOR             #x00036004)
(define-public GLFW_HRESIZE_CURSOR          #x00036005)
(define-public GLFW_VRESIZE_CURSOR          #x00036006)
(define-public GLFW_CONNECTED               #x00040001)
(define-public GLFW_DISCONNECTED            #x00040002)
(define-public GLFW_JOYSTICK_HAT_BUTTONS    #x00050001)
(define-public GLFW_COCOA_CHDIR_RESOURCES   #x00051001)
(define-public GLFW_COCOA_MENUBAR           #x00051002)
(define-public GLFW_DONT_CARE               -1)
(define-public glfwInit (foreign-library-function "libglfw" "glfwInit" #:arg-types '() #:return-type int))
(define-public glfwTerminate (foreign-library-function "libglfw" "glfwTerminate" #:arg-types '() #:return-type void))
(define-public glfwInitHint (foreign-library-function "libglfw" "glfwInitHint" #:arg-types (list int int) #:return-type void))
(define-public glfwGetVersion (foreign-library-function "libglfw" "glfwGetVersion" #:arg-types (list '* '* '*) #:return-type void))
(define-public glfwGetVersionString (foreign-library-function "libglfw" "glfwGetVersionString" #:arg-types '() #:return-type '*))
(define-public glfwGetError (foreign-library-function "libglfw" "glfwGetError" #:arg-types (list '*) #:return-type int))
(define-public glfwSetErrorCallback (foreign-library-function "libglfw" "glfwSetErrorCallback" #:arg-types (list '*) #:return-type '*))
(define-public glfwGetMonitors (foreign-library-function "libglfw" "glfwGetMonitors" #:arg-types (list '*) #:return-type '*))
(define-public glfwGetPrimaryMonitor (foreign-library-function "libglfw" "glfwGetPrimaryMonitor" #:arg-types '() #:return-type '*))
(define-public glfwGetMonitorPos (foreign-library-function "libglfw" "glfwGetMonitorPos" #:arg-types (list '* '* '*) #:return-type void))
(define-public glfwGetMonitorWorkarea (foreign-library-function "libglfw" "glfwGetMonitorWorkarea" #:arg-types (list '* '* '* '* '*) #:return-type void))
(define-public glfwGetMonitorPhysicalSize (foreign-library-function "libglfw" "glfwGetMonitorPhysicalSize" #:arg-types (list '* '* '*) #:return-type void))
(define-public glfwGetMonitorContentScale (foreign-library-function "libglfw" "glfwGetMonitorContentScale" #:arg-types (list '* '* '*) #:return-type void))
(define-public glfwGetMonitorName (foreign-library-function "libglfw" "glfwGetMonitorName" #:arg-types (list '*) #:return-type '*))
(define-public glfwSetMonitorUserPointer (foreign-library-function "libglfw" "glfwSetMonitorUserPointer" #:arg-types (list '* '*) #:return-type void))
(define-public glfwGetMonitorUserPointer (foreign-library-function "libglfw" "glfwGetMonitorUserPointer" #:arg-types (list '*) #:return-type '*))
(define-public glfwSetMonitorCallback (foreign-library-function "libglfw" "glfwSetMonitorCallback" #:arg-types (list '*) #:return-type '*))
(define-public glfwGetVideoModes (foreign-library-function "libglfw" "glfwGetVideoModes" #:arg-types (list '* '*) #:return-type '*))
(define-public glfwGetVideoMode (foreign-library-function "libglfw" "glfwGetVideoMode" #:arg-types (list '*) #:return-type '*))
(define-public glfwSetGamma (foreign-library-function "libglfw" "glfwSetGamma" #:arg-types (list '* float) #:return-type void))
(define-public glfwGetGammaRamp (foreign-library-function "libglfw" "glfwGetGammaRamp" #:arg-types (list '*) #:return-type '*))
(define-public glfwSetGammaRamp (foreign-library-function "libglfw" "glfwSetGammaRamp" #:arg-types (list '* '*) #:return-type void))
(define-public glfwDefaultWindowHints (foreign-library-function "libglfw" "glfwDefaultWindowHints" #:arg-types '() #:return-type void))
(define-public glfwWindowHint (foreign-library-function "libglfw" "glfwWindowHint" #:arg-types (list int int) #:return-type void))
(define-public glfwWindowHintString (foreign-library-function "libglfw" "glfwWindowHintString" #:arg-types (list int '*) #:return-type void))
(define-public glfwCreateWindow (foreign-library-function "libglfw" "glfwCreateWindow" #:arg-types (list int int '* '* '*) #:return-type '*))
(define-public glfwDestroyWindow (foreign-library-function "libglfw" "glfwDestroyWindow" #:arg-types (list '*) #:return-type void))
(define-public glfwWindowShouldClose (foreign-library-function "libglfw" "glfwWindowShouldClose" #:arg-types (list '*) #:return-type int))
(define-public glfwSetWindowShouldClose (foreign-library-function "libglfw" "glfwSetWindowShouldClose" #:arg-types (list '* int) #:return-type void))
(define-public glfwSetWindowTitle (foreign-library-function "libglfw" "glfwSetWindowTitle" #:arg-types (list '* '*) #:return-type void))
(define-public glfwSetWindowIcon (foreign-library-function "libglfw" "glfwSetWindowIcon" #:arg-types (list '* int '*) #:return-type void))
(define-public glfwGetWindowPos (foreign-library-function "libglfw" "glfwGetWindowPos" #:arg-types (list '* '* '*) #:return-type void))
(define-public glfwSetWindowPos (foreign-library-function "libglfw" "glfwSetWindowPos" #:arg-types (list '* int int) #:return-type void))
(define-public glfwGetWindowSize (foreign-library-function "libglfw" "glfwGetWindowSize" #:arg-types (list '* '* '*) #:return-type void))
(define-public glfwSetWindowSizeLimits (foreign-library-function "libglfw" "glfwSetWindowSizeLimits" #:arg-types (list '* int int int int) #:return-type void))
(define-public glfwSetWindowAspectRatio (foreign-library-function "libglfw" "glfwSetWindowAspectRatio" #:arg-types (list '* int int) #:return-type void))
(define-public glfwSetWindowSize (foreign-library-function "libglfw" "glfwSetWindowSize" #:arg-types (list '* int int) #:return-type void))
(define-public glfwGetFramebufferSize (foreign-library-function "libglfw" "glfwGetFramebufferSize" #:arg-types (list '* '* '*) #:return-type void))
(define-public glfwGetWindowFrameSize (foreign-library-function "libglfw" "glfwGetWindowFrameSize" #:arg-types (list '* '* '* '* '*) #:return-type void))
(define-public glfwGetWindowContentScale (foreign-library-function "libglfw" "glfwGetWindowContentScale" #:arg-types (list '* '* '*) #:return-type void))
(define-public glfwGetWindowOpacity (foreign-library-function "libglfw" "glfwGetWindowOpacity" #:arg-types (list '*) #:return-type float))
(define-public glfwSetWindowOpacity (foreign-library-function "libglfw" "glfwSetWindowOpacity" #:arg-types (list '* float) #:return-type void))
(define-public glfwIconifyWindow (foreign-library-function "libglfw" "glfwIconifyWindow" #:arg-types (list '*) #:return-type void))
(define-public glfwRestoreWindow (foreign-library-function "libglfw" "glfwRestoreWindow" #:arg-types (list '*) #:return-type void))
(define-public glfwMaximizeWindow (foreign-library-function "libglfw" "glfwMaximizeWindow" #:arg-types (list '*) #:return-type void))
(define-public glfwShowWindow (foreign-library-function "libglfw" "glfwShowWindow" #:arg-types (list '*) #:return-type void))
(define-public glfwHideWindow (foreign-library-function "libglfw" "glfwHideWindow" #:arg-types (list '*) #:return-type void))
(define-public glfwFocusWindow (foreign-library-function "libglfw" "glfwFocusWindow" #:arg-types (list '*) #:return-type void))
(define-public glfwRequestWindowAttention (foreign-library-function "libglfw" "glfwRequestWindowAttention" #:arg-types (list '*) #:return-type void))
(define-public glfwGetWindowMonitor (foreign-library-function "libglfw" "glfwGetWindowMonitor" #:arg-types (list '*) #:return-type '*))
(define-public glfwSetWindowMonitor (foreign-library-function "libglfw" "glfwSetWindowMonitor" #:arg-types (list '* '* int int int int int) #:return-type void))
(define-public glfwGetWindowAttrib (foreign-library-function "libglfw" "glfwGetWindowAttrib" #:arg-types (list '* int) #:return-type int))
(define-public glfwSetWindowAttrib (foreign-library-function "libglfw" "glfwSetWindowAttrib" #:arg-types (list '* int int) #:return-type void))
(define-public glfwSetWindowUserPointer (foreign-library-function "libglfw" "glfwSetWindowUserPointer" #:arg-types (list '* '*) #:return-type void))
(define-public glfwGetWindowUserPointer (foreign-library-function "libglfw" "glfwGetWindowUserPointer" #:arg-types (list '*) #:return-type '*))
(define-public glfwSetWindowPosCallback (foreign-library-function "libglfw" "glfwSetWindowPosCallback" #:arg-types (list '* '*) #:return-type '*))
(define-public glfwSetWindowSizeCallback (foreign-library-function "libglfw" "glfwSetWindowSizeCallback" #:arg-types (list '* '*) #:return-type '*))
(define-public glfwSetWindowCloseCallback (foreign-library-function "libglfw" "glfwSetWindowCloseCallback" #:arg-types (list '* '*) #:return-type '*))
(define-public glfwSetWindowRefreshCallback (foreign-library-function "libglfw" "glfwSetWindowRefreshCallback" #:arg-types (list '* '*) #:return-type '*))
(define-public glfwSetWindowFocusCallback (foreign-library-function "libglfw" "glfwSetWindowFocusCallback" #:arg-types (list '* '*) #:return-type '*))
(define-public glfwSetWindowIconifyCallback (foreign-library-function "libglfw" "glfwSetWindowIconifyCallback" #:arg-types (list '* '*) #:return-type '*))
(define-public glfwSetWindowMaximizeCallback (foreign-library-function "libglfw" "glfwSetWindowMaximizeCallback" #:arg-types (list '* '*) #:return-type '*))
(define-public glfwSetFramebufferSizeCallback (foreign-library-function "libglfw" "glfwSetFramebufferSizeCallback" #:arg-types (list '* '*) #:return-type '*))
(define-public glfwSetWindowContentScaleCallback (foreign-library-function "libglfw" "glfwSetWindowContentScaleCallback" #:arg-types (list '* '*) #:return-type '*))
(define-public glfwPollEvents (foreign-library-function "libglfw" "glfwPollEvents" #:arg-types '() #:return-type void))
(define-public glfwWaitEvents (foreign-library-function "libglfw" "glfwWaitEvents" #:arg-types '() #:return-type void))
(define-public glfwWaitEventsTimeout (foreign-library-function "libglfw" "glfwWaitEventsTimeout" #:arg-types (list double) #:return-type void))
(define-public glfwPostEmptyEvent (foreign-library-function "libglfw" "glfwPostEmptyEvent" #:arg-types '() #:return-type void))
(define-public glfwGetInputMode (foreign-library-function "libglfw" "glfwGetInputMode" #:arg-types (list '* int) #:return-type int))
(define-public glfwSetInputMode (foreign-library-function "libglfw" "glfwSetInputMode" #:arg-types (list '* int int) #:return-type void))
(define-public glfwRawMouseMotionSupported (foreign-library-function "libglfw" "glfwRawMouseMotionSupported" #:arg-types '() #:return-type int))
(define-public glfwGetKeyName (foreign-library-function "libglfw" "glfwGetKeyName" #:arg-types (list int int) #:return-type '*))
(define-public glfwGetKeyScancode (foreign-library-function "libglfw" "glfwGetKeyScancode" #:arg-types (list int) #:return-type int))
(define-public glfwGetKey (foreign-library-function "libglfw" "glfwGetKey" #:arg-types (list '* int) #:return-type int))
(define-public glfwGetMouseButton (foreign-library-function "libglfw" "glfwGetMouseButton" #:arg-types (list '* int) #:return-type int))
(define-public glfwGetCursorPos (foreign-library-function "libglfw" "glfwGetCursorPos" #:arg-types (list '* '* '*) #:return-type void))
(define-public glfwSetCursorPos (foreign-library-function "libglfw" "glfwSetCursorPos" #:arg-types (list '* double double) #:return-type void))
(define-public glfwCreateCursor (foreign-library-function "libglfw" "glfwCreateCursor" #:arg-types (list '* int int) #:return-type '*))
(define-public glfwCreateStandardCursor (foreign-library-function "libglfw" "glfwCreateStandardCursor" #:arg-types (list int) #:return-type '*))
(define-public glfwDestroyCursor (foreign-library-function "libglfw" "glfwDestroyCursor" #:arg-types (list '*) #:return-type void))
(define-public glfwSetCursor (foreign-library-function "libglfw" "glfwSetCursor" #:arg-types (list '* '*) #:return-type void))
(define-public glfwSetKeyCallback (foreign-library-function "libglfw" "glfwSetKeyCallback" #:arg-types (list '* '*) #:return-type '*))
(define-public glfwSetCharCallback (foreign-library-function "libglfw" "glfwSetCharCallback" #:arg-types (list '* '*) #:return-type '*))
(define-public glfwSetCharModsCallback (foreign-library-function "libglfw" "glfwSetCharModsCallback" #:arg-types (list '* '*) #:return-type '*))
(define-public glfwSetMouseButtonCallback (foreign-library-function "libglfw" "glfwSetMouseButtonCallback" #:arg-types (list '* '*) #:return-type '*))
(define-public glfwSetCursorPosCallback (foreign-library-function "libglfw" "glfwSetCursorPosCallback" #:arg-types (list '* '*) #:return-type '*))
(define-public glfwSetCursorEnterCallback (foreign-library-function "libglfw" "glfwSetCursorEnterCallback" #:arg-types (list '* '*) #:return-type '*))
(define-public glfwSetScrollCallback (foreign-library-function "libglfw" "glfwSetScrollCallback" #:arg-types (list '* '*) #:return-type '*))
(define-public glfwSetDropCallback (foreign-library-function "libglfw" "glfwSetDropCallback" #:arg-types (list '* '*) #:return-type '*))
(define-public glfwJoystickPresent (foreign-library-function "libglfw" "glfwJoystickPresent" #:arg-types (list int) #:return-type int))
(define-public glfwGetJoystickAxes (foreign-library-function "libglfw" "glfwGetJoystickAxes" #:arg-types (list int '*) #:return-type '*))
(define-public glfwGetJoystickButtons (foreign-library-function "libglfw" "glfwGetJoystickButtons" #:arg-types (list int '*) #:return-type '*))
(define-public glfwGetJoystickHats (foreign-library-function "libglfw" "glfwGetJoystickHats" #:arg-types (list int '*) #:return-type '*))
(define-public glfwGetJoystickName (foreign-library-function "libglfw" "glfwGetJoystickName" #:arg-types (list int) #:return-type '*))
(define-public glfwGetJoystickGUID (foreign-library-function "libglfw" "glfwGetJoystickGUID" #:arg-types (list int) #:return-type '*))
(define-public glfwSetJoystickUserPointer (foreign-library-function "libglfw" "glfwSetJoystickUserPointer" #:arg-types (list int '*) #:return-type void))
(define-public glfwGetJoystickUserPointer (foreign-library-function "libglfw" "glfwGetJoystickUserPointer" #:arg-types (list int) #:return-type '*))
(define-public glfwJoystickIsGamepad (foreign-library-function "libglfw" "glfwJoystickIsGamepad" #:arg-types (list int) #:return-type int))
(define-public glfwSetJoystickCallback (foreign-library-function "libglfw" "glfwSetJoystickCallback" #:arg-types (list '*) #:return-type '*))
(define-public glfwUpdateGamepadMappings (foreign-library-function "libglfw" "glfwUpdateGamepadMappings" #:arg-types (list '*) #:return-type int))
(define-public glfwGetGamepadName (foreign-library-function "libglfw" "glfwGetGamepadName" #:arg-types (list int) #:return-type '*))
(define-public glfwGetGamepadState (foreign-library-function "libglfw" "glfwGetGamepadState" #:arg-types (list int '*) #:return-type int))
(define-public glfwSetClipboardString (foreign-library-function "libglfw" "glfwSetClipboardString" #:arg-types (list '* '*) #:return-type void))
(define-public glfwGetClipboardString (foreign-library-function "libglfw" "glfwGetClipboardString" #:arg-types (list '*) #:return-type '*))
(define-public glfwGetTime (foreign-library-function "libglfw" "glfwGetTime" #:arg-types '() #:return-type double))
(define-public glfwSetTime (foreign-library-function "libglfw" "glfwSetTime" #:arg-types (list double) #:return-type void))
(define-public glfwGetTimerValue (foreign-library-function "libglfw" "glfwGetTimerValue" #:arg-types '() #:return-type uint64))
(define-public glfwGetTimerFrequency (foreign-library-function "libglfw" "glfwGetTimerFrequency" #:arg-types '() #:return-type uint64))
(define-public glfwMakeContextCurrent (foreign-library-function "libglfw" "glfwMakeContextCurrent" #:arg-types (list '*) #:return-type void))
(define-public glfwGetCurrentContext (foreign-library-function "libglfw" "glfwGetCurrentContext" #:arg-types '() #:return-type '*))
(define-public glfwSwapBuffers (foreign-library-function "libglfw" "glfwSwapBuffers" #:arg-types (list '*) #:return-type void))
(define-public glfwSwapInterval (foreign-library-function "libglfw" "glfwSwapInterval" #:arg-types (list int) #:return-type void))
(define-public glfwExtensionSupported (foreign-library-function "libglfw" "glfwExtensionSupported" #:arg-types (list '*) #:return-type int))
(define-public glfwGetProcAddress (foreign-library-function "libglfw" "glfwGetProcAddress" #:arg-types (list '*) #:return-type '*))
(define-public glfwVulkanSupported (foreign-library-function "libglfw" "glfwVulkanSupported" #:arg-types '() #:return-type int))
(define-public glfwGetRequiredInstanceExtensions (foreign-library-function "libglfw" "glfwGetRequiredInstanceExtensions" #:arg-types (list uint32) #:return-type '*))
(define-public glfwGetInstanceProcAddress (foreign-library-function "libglfw" "glfwGetInstanceProcAddress" #:arg-types (list '* '*) #:return-type '*))
(define-public glfwGetPhysicalDevicePresentationSupport (foreign-library-function "libglfw" "glfwGetPhysicalDevicePresentationSupport" #:arg-types (list '* '* uint32) #:return-type int))
(define-public glfwCreateWindowSurface (foreign-library-function "libglfw" "glfwCreateWindowSurface" #:arg-types (list '* '* '* '*) #:return-type '*))

module sf.window;
public import sf.system : Vector2i, Vector2u;

pragma(lib, "csfml-window-2");

class Context {
    private sfContext* ptr;
    private alias ptr this;
    bool opEquals(Object a) {
        auto cst = cast(Context)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfContext* ptr) {
        this.ptr = ptr; 
    }

	this() {
		ptr = sfContext_create();
	}
	~this() {
		sfContext_destroy(ptr);
	}
	bool  active(bool active) {
		sfContext_setActive(ptr,active); return active;
	}
}


class Window {
    sfWindow* ptr;
    private alias ptr this;
    bool opEquals(Object a) {
        auto cst = cast(Window)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfWindow* ptr) {
        this.ptr = ptr; 
    }

	this(VideoMode mode,const(char) *title,uint style,ContextSettings *settings) {
		ptr = sfWindow_create(mode,title,style,settings);
	}
	this(sfWindowHandle handle,ContextSettings *settings) {
		ptr = sfWindow_createFromHandle(handle,settings);
	}
	~this() {
		sfWindow_destroy(ptr);
	}
	void close() {
		sfWindow_close(ptr);
	}
	bool isOpen() {
		return sfWindow_isOpen(ptr);
	}
	ContextSettings settings() {
		return sfWindow_getSettings(ptr);
	}
	bool pollEvent(Event *event) {
		return sfWindow_pollEvent(ptr,event);
	}
	bool waitEvent(Event *event) {
		return sfWindow_waitEvent(ptr,event);
	}
	Vector2i position() {
		return sfWindow_getPosition(ptr);
	}
	Vector2i position(Vector2i position) {
		sfWindow_setPosition(ptr,position); return position;
	}
	Vector2u size() {
		return sfWindow_getSize(ptr);
	}
	Vector2u size(Vector2u size) {
		sfWindow_setSize(ptr,size); return size;
	}
	const(char)* title(const(char) *title) {
		sfWindow_setTitle(ptr,title); return title;
	}
	uint icon(uint width,uint height,ubyte *pixels) {
		sfWindow_setIcon(ptr,width,height,pixels); return width;
	}
	bool  visible(bool visible) {
		sfWindow_setVisible(ptr,visible); return visible;
	}
	bool  mouseCursorVisible(bool visible) {
		sfWindow_setMouseCursorVisible(ptr,visible); return visible;
	}
	bool  verticalSyncEnabled(bool enabled) {
		sfWindow_setVerticalSyncEnabled(ptr,enabled); return enabled;
	}
	bool  keyRepeatEnabled(bool enabled) {
		sfWindow_setKeyRepeatEnabled(ptr,enabled); return enabled;
	}
	bool  active(bool active) {
		return sfWindow_setActive(ptr,active); return active;
	}
	void display() {
		sfWindow_display(ptr);
	}
	uint framerateLimit(uint limit) {
		sfWindow_setFramerateLimit(ptr,limit); return limit;
	}
	float joystickThreshold(float threshold) {
		sfWindow_setJoystickThreshold(ptr,threshold); return threshold;
	}
 	sfWindowHandle systemHandle() {
		return sfWindow_getSystemHandle(ptr);
	}
}

enum JoystickType
{
    Count = 8,
    ButtonCount = 32,
    AxisCount = 8,
}
enum JoystickAxis
{
    X,
    Y,
    Z,
    R,
    U,
    V,
    PovX,
    PovY,
}
enum KeyCode
{
    Unknown = -1,
    A,
    B,
    C,
    D,
    E,
    F,
    G,
    H,
    I,
    J,
    K,
    L,
    M,
    N,
    O,
    P,
    Q,
    R,
    S,
    T,
    U,
    V,
    W,
    X,
    Y,
    Z,
    Num0,
    Num1,
    Num2,
    Num3,
    Num4,
    Num5,
    Num6,
    Num7,
    Num8,
    Num9,
    Escape,
    LControl,
    LShift,
    LAlt,
    LSystem,
    RControl,
    RShift,
    RAlt,
    RSystem,
    Menu,
    LBracket,
    RBracket,
    SemiColon,
    Comma,
    Period,
    Quote,
    Slash,
    BackSlash,
    Tilde,
    Equal,
    Dash,
    Space,
    Return,
    Back,
    Tab,
    PageUp,
    PageDown,
    End,
    Home,
    Insert,
    Delete,
    Add,
    Subtract,
    Multiply,
    Divide,
    Left,
    Right,
    Up,
    Down,
    Numpad0,
    Numpad1,
    Numpad2,
    Numpad3,
    Numpad4,
    Numpad5,
    Numpad6,
    Numpad7,
    Numpad8,
    Numpad9,
    F1,
    F2,
    F3,
    F4,
    F5,
    F6,
    F7,
    F8,
    F9,
    F10,
    F11,
    F12,
    F13,
    F14,
    F15,
    Pause,
    Count,
}
enum MouseButton
{
    Left,
    Right,
    Middle,
    XButton1,
    XButton2,
    ButtonCount,
}
enum EventType
{
    Closed,
    Resized,
    LostFocus,
    GainedFocus,
    TextEntered,
    KeyPressed,
    KeyReleased,
    MouseWheelMoved,
    MouseButtonPressed,
    MouseButtonReleased,
    MouseMoved,
    MouseEntered,
    MouseLeft,
    JoystickButtonPressed,
    JoystickButtonReleased,
    JoystickMoved,
    JoystickConnected,
    JoystickDisconnected,
}
enum WindowStyle
{
    None,
    Titlebar,
    Resize,
    Close = 4,
    Fullscreen = 8,
    Default = 7,
}

struct KeyEvent
{
    EventType type;
    KeyCode code;
    bool  alt;
    bool  control;
    bool  shift;
    bool  system;
}
struct TextEvent
{
    EventType type;
    uint unicode;
}
struct MouseMoveEvent
{
    EventType type;
    int x;
    int y;
}
struct MouseButtonEvent
{
    EventType type;
    MouseButton button;
    int x;
    int y;
}
struct MouseWheelEvent
{
    EventType type;
    int delta;
    int x;
    int y;
}
struct JoystickMoveEvent
{
    EventType type;
    uint joystickId;
    JoystickAxis axis;
    float position;
}
struct JoystickButtonEvent
{
    EventType type;
    uint joystickId;
    uint button;
}
struct JoystickConnectEvent
{
    EventType type;
    uint joystickId;
}
struct SizeEvent
{
    EventType type;
    uint width;
    uint height;
}
union Event
{
    EventType type;
    SizeEvent size;
    KeyEvent key;
    TextEvent text;
    MouseMoveEvent mouseMove;
    MouseButtonEvent mouseButton;
    MouseWheelEvent mouseWheel;
    JoystickMoveEvent joystickMove;
    JoystickButtonEvent joystickButton;
    JoystickConnectEvent joystickConnect;
}

struct VideoMode
{
    uint width;
    uint height;
    uint bitsPerPixel;
}
struct ContextSettings
{
    uint depthBits;
    uint stencilBits;
    uint antialiasingLevel;
    uint majorVersion;
    uint minorVersion;
}
alias HWND__ *sfWindowHandle;
private extern(C):
	
	sfContext * sfContext_create();
void  sfContext_destroy(sfContext *context);
void  sfContext_setActive(sfContext *context, bool  active);

bool   sfJoystick_isConnected(uint joystick);
uint  sfJoystick_getButtonCount(uint joystick);
bool   sfJoystick_hasAxis(uint joystick, JoystickAxis axis);
bool   sfJoystick_isButtonPressed(uint joystick, uint button);
float  sfJoystick_getAxisPosition(uint joystick, JoystickAxis axis);
void  sfJoystick_update();

bool   sfKeyboard_isKeyPressed(KeyCode key);

bool   sfMouse_isButtonPressed(MouseButton button);
Vector2i  sfMouse_getPosition(sfWindow *relativeTo);
void  sfMouse_setPosition(Vector2i position, sfWindow *relativeTo);

VideoMode  sfVideoMode_getDesktopMode();
VideoMode * sfVideoMode_getFullscreenModes(int *Count);
bool   sfVideoMode_isValid(VideoMode mode);


sfWindow * sfWindow_create(VideoMode mode, const (char) *title, uint style, ContextSettings *settings);
sfWindow * sfWindow_createFromHandle(sfWindowHandle handle, ContextSettings *settings);
void  sfWindow_destroy(sfWindow *window);
void  sfWindow_close(sfWindow *window);
bool   sfWindow_isOpen(sfWindow *window);
ContextSettings  sfWindow_getSettings(sfWindow *window);
bool   sfWindow_pollEvent(sfWindow *window, Event *event);
bool   sfWindow_waitEvent(sfWindow *window, Event *event);
Vector2i  sfWindow_getPosition(sfWindow *window);
void  sfWindow_setPosition(sfWindow *window, Vector2i position);
Vector2u  sfWindow_getSize(sfWindow *window);
void  sfWindow_setSize(sfWindow *window, Vector2u size);
void  sfWindow_setTitle(sfWindow *window, const (char) *title);
void  sfWindow_setIcon(sfWindow *window, uint width, uint height, ubyte *pixels);
void  sfWindow_setVisible(sfWindow *window, bool  visible);
void  sfWindow_setMouseCursorVisible(sfWindow *window, bool  visible);
void  sfWindow_setVerticalSyncEnabled(sfWindow *window, bool  enabled);
void  sfWindow_setKeyRepeatEnabled(sfWindow *window, bool  enabled);
bool   sfWindow_setActive(sfWindow *window, bool  active);
void  sfWindow_display(sfWindow *window);
void  sfWindow_setFramerateLimit(sfWindow *window, uint limit);
void  sfWindow_setJoystickThreshold(sfWindow *window, float threshold);
sfWindowHandle  sfWindow_getSystemHandle(sfWindow *window);

struct sfContext;
struct sfWindow;
struct HWND__;
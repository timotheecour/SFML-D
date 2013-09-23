module sf.system;
import std.math : sqrt;
pragma(lib, "csfml-system");

class Clock {
    private sfClock* ptr;
    private alias ptr this;
    override bool opEquals(Object a) {
        auto cst = cast(Clock)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfClock* ptr) {
        this.ptr = ptr; 
    }

	this() {
		ptr = sfClock_create();
	}
	this(Clock clock) {
		ptr = sfClock_copy(clock);
	}
	~this() {
		sfClock_destroy(ptr);
	}
	Time elapsedTime() {
		return sfClock_getElapsedTime(ptr);
	}
	Time restart() {
		return sfClock_restart(ptr);
	}
}


class Mutex {
    private sfMutex* ptr;
    private alias ptr this;
    override bool opEquals(Object a) {
        auto cst = cast(Mutex)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfMutex* ptr) {
        this.ptr = ptr; 
    }

	this() {
		ptr = sfMutex_create();
	}
	~this() {
		sfMutex_destroy(ptr);
	}
	void lock() {
		sfMutex_lock(ptr);
	}
	void unlock() {
		sfMutex_unlock(ptr);
	}
}


class Thread {
	alias extern(C) void function(void*) CFunc;
	
    private sfThread* ptr;
    private alias ptr this;
    override bool opEquals(Object a) {
        auto cst = cast(Thread)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfThread* ptr) {
        this.ptr = ptr; 
    }

	this(CFunc _function,void *userData) {
		ptr = sfThread_create(_function,userData);
	}
	~this() {
		sfThread_destroy(ptr);
	}
	void launch() {
		sfThread_launch(ptr);
	}
	void wait() {
		sfThread_wait(ptr);
	}
	void terminate() {
		sfThread_terminate(ptr);
	}
}

struct Time
{
    long microseconds;
}
struct Vector2i
{
    int x;
    int y;
}
struct Vector2u
{
    uint x;
    uint y;
}

struct Vector3f
{
    float x;
    float y;
    float z;
}

struct sfInputStream
{
    sfInputStreamReadFunc read;
    sfInputStreamSeekFunc seek;
    sfInputStreamTellFunc tell;
    sfInputStreamGetSizeFunc getSize;
    void *userData;
}

struct Vector2f
{
    float x;
    float y;
	
	Vector2f opAdd(Vector2f v) const {
		return Vector2f(x+v.x, y+v.y);
	}
	Vector2f opSub(Vector2f v) {
		return Vector2f(x-v.x, y-v.y);
	}
	Vector2f opMul(float f) const {
		return Vector2f(x*f, y*f);
	}
	Vector2f opDiv(float f) const {
		return Vector2f(x/f, y/f);
	}
	float dot(Vector2f v) {
		return x*v.x + y*v.y;
	}
	
	Vector2f projection(Vector2f axis) {	
		return dot(axis) * axis / axis.lengthSquared();	
	}
	
	float lengthSquared() {
		return x*x+y*y;
	}
	float length() {
		
		return sqrt(lengthSquared);
	}
	
	Vector2f unit() {
	
		return this / length();	
	}
	
	static immutable Vector2f Zero = Vector2f(0,0);
}

private extern(C):

Time sfTime_Zero;
float  sfTime_asSeconds(Time time);
int  sfTime_asMilliseconds(Time time);
long  sfTime_asMicroseconds(Time time);
Time  sfSeconds(float amount);
Time  sfMilliseconds(int amount);
Time  sfMicroseconds(long amount);
sfClock * sfClock_create();
sfClock * sfClock_copy(sfClock *clock);
void  sfClock_destroy(sfClock *clock);
Time  sfClock_getElapsedTime(sfClock *clock);
Time  sfClock_restart(sfClock *clock);
alias long  function(void *data, long size, void *userData)sfInputStreamReadFunc;
alias long  function(long position, void *userData)sfInputStreamSeekFunc;
alias long  function(void *userData)sfInputStreamTellFunc;
alias long  function(void *userData)sfInputStreamGetSizeFunc;

sfMutex * sfMutex_create();
void  sfMutex_destroy(sfMutex *mutex);
void  sfMutex_lock(sfMutex *mutex);
void  sfMutex_unlock(sfMutex *mutex);
void  sfSleep(Time duration);
sfThread * sfThread_create(void  function(void *) _function, void *userData);
void  sfThread_destroy(sfThread *thread);
void  sfThread_launch(sfThread *thread);
void  sfThread_wait(sfThread *thread);
void  sfThread_terminate(sfThread *thread);

struct sfClock;
struct sfMutex;
struct sfThread;
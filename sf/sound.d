module sf.sound;
import sf.system : Time, sfInputStream, Vector3f;
pragma(lib, "csfml-audio-2");

class Music {
    private sfMusic* ptr;
    private alias ptr this;
    bool opEquals(Object a) {
        auto cst = cast(Music)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfMusic* ptr) {
        this.ptr = ptr; 
    }

	this(const(char) *filename) {
		ptr = sfMusic_createFromFile(filename);
	}
	this(void *data,int sizeInBytes) {
		ptr = sfMusic_createFromMemory(data,sizeInBytes);
	}
	this(sfInputStream *stream) {
		ptr = sfMusic_createFromStream(stream);
	}
	~this() {
		sfMusic_destroy(ptr);
	}
	bool  loop(bool loop) {
		sfMusic_setLoop(ptr,loop); return loop;
	}
	bool loop() {
		return sfMusic_getLoop(ptr);
	}
	Time duration() {
		return sfMusic_getDuration(ptr);
	}
	void play() {
		sfMusic_play(ptr);
	}
	void pause() {
		sfMusic_pause(ptr);
	}
	void stop() {
		sfMusic_stop(ptr);
	}
	uint channelCount() {
		return sfMusic_getChannelCount(ptr);
	}
	uint sampleRate() {
		return sfMusic_getSampleRate(ptr);
	}
	SoundStatus status() {
		return sfMusic_getStatus(ptr);
	}
	Time playingOffset() {
		return sfMusic_getPlayingOffset(ptr);
	}
	float pitch(float pitch) {
		sfMusic_setPitch(ptr,pitch); return pitch;
	}
	float volume(float volume) {
		sfMusic_setVolume(ptr,volume); return volume;
	}
	Vector3f position(Vector3f position) {
		sfMusic_setPosition(ptr,position); return position;
	}
	bool  relativeToListener(bool relative) {
		sfMusic_setRelativeToListener(ptr,relative); return relative;
	}
	float minDistance(float distance) {
		sfMusic_setMinDistance(ptr,distance); return distance;
	}
	float attenuation(float attenuation) {
		sfMusic_setAttenuation(ptr,attenuation); return attenuation;
	}
	Time TimeplayingOffset(Time timeOffset) {
		sfMusic_setPlayingOffset(ptr,timeOffset); return timeOffset;
	}
	float pitch() {
		return sfMusic_getPitch(ptr);
	}
	float volume() {
		return sfMusic_getVolume(ptr);
	}
	Vector3f position() {
		return sfMusic_getPosition(ptr);
	}
	bool isRelativeToListener() {
		return sfMusic_isRelativeToListener(ptr);
	}
	float minDistance() {
		return sfMusic_getMinDistance(ptr);
	}
	float attenuation() {
		return sfMusic_getAttenuation(ptr);
	}
}


class Sound {
    private sfSound* ptr;
    private alias ptr this;
    bool opEquals(Object a) {
        auto cst = cast(Sound)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfSound* ptr) {
        this.ptr = ptr; 
    }

	this() {
		ptr = sfSound_create();
	}
	this(Sound sound) {
		ptr = sfSound_copy(sound);
	}
	~this() {
		sfSound_destroy(ptr);
	}
	void play() {
		sfSound_play(ptr);
	}
	void pause() {
		sfSound_pause(ptr);
	}
	void stop() {
		sfSound_stop(ptr);
	}
	SoundBuffer buffer(SoundBuffer buffer) {
		sfSound_setBuffer(ptr,buffer); return buffer;
	}
	SoundBuffer buffer() {
		return new SoundBuffer(sfSound_getBuffer(ptr));
	}
	bool  loop(bool loop) {
		sfSound_setLoop(ptr,loop); return loop;
	}
	bool loop() {
		return sfSound_getLoop(ptr);
	}
	SoundStatus status() {
		return sfSound_getStatus(ptr);
	}
	float pitch(float pitch) {
		sfSound_setPitch(ptr,pitch); return pitch;
	}
	float volume(float volume) {
		sfSound_setVolume(ptr,volume); return volume;
	}
	Vector3f position(Vector3f position) {
		sfSound_setPosition(ptr,position); return position;
	}
	bool  relativeToListener(bool relative) {
		sfSound_setRelativeToListener(ptr,relative); return relative;
	}
	float minDistance(float distance) {
		sfSound_setMinDistance(ptr,distance); return distance;
	}
	float attenuation(float attenuation) {
		sfSound_setAttenuation(ptr,attenuation); return attenuation;
	}
	Time TimeplayingOffset(Time timeOffset) {
		sfSound_setPlayingOffset(ptr,timeOffset); return timeOffset;
	}
	float pitch() {
		return sfSound_getPitch(ptr);
	}
	float volume() {
		return sfSound_getVolume(ptr);
	}
	Vector3f position() {
		return sfSound_getPosition(ptr);
	}
	bool isRelativeToListener() {
		return sfSound_isRelativeToListener(ptr);
	}
	float minDistance() {
		return sfSound_getMinDistance(ptr);
	}
	float attenuation() {
		return sfSound_getAttenuation(ptr);
	}
	Time playingOffset() {
		return sfSound_getPlayingOffset(ptr);
	}
}


class SoundBuffer {
    private sfSoundBuffer* ptr;
    private alias ptr this;
    bool opEquals(Object a) {
        auto cst = cast(SoundBuffer)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfSoundBuffer* ptr) {
        this.ptr = ptr; 
    }

	this(const(char) *filename) {
		ptr = sfSoundBuffer_createFromFile(filename);
	}
	this(void *data,int sizeInBytes) {
		ptr = sfSoundBuffer_createFromMemory(data,sizeInBytes);
	}
	this(sfInputStream *stream) {
		ptr = sfSoundBuffer_createFromStream(stream);
	}
	this(short *samples,int sampleCount,uint channelCount,uint sampleRate) {
		ptr = sfSoundBuffer_createFromSamples(samples,sampleCount,channelCount,sampleRate);
	}
	this(SoundBuffer soundBuffer) {
		ptr = sfSoundBuffer_copy(soundBuffer);
	}
	~this() {
		sfSoundBuffer_destroy(ptr);
	}
	bool saveToFile(const(char) *filename) {
		return sfSoundBuffer_saveToFile(ptr,filename);
	}
	short* samples() {
		return sfSoundBuffer_getSamples(ptr);
	}
	int sampleCount() {
		return sfSoundBuffer_getSampleCount(ptr);
	}
	uint sampleRate() {
		return sfSoundBuffer_getSampleRate(ptr);
	}
	uint channelCount() {
		return sfSoundBuffer_getChannelCount(ptr);
	}
	Time duration() {
		return sfSoundBuffer_getDuration(ptr);
	}
}


class SoundBufferRecorder {
    private sfSoundBufferRecorder* ptr;
    private alias ptr this;
    bool opEquals(Object a) {
        auto cst = cast(SoundBufferRecorder)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfSoundBufferRecorder* ptr) {
        this.ptr = ptr; 
    }

	this() {
		ptr = sfSoundBufferRecorder_create();
	}
	~this() {
		sfSoundBufferRecorder_destroy(ptr);
	}
	void start(uint sampleRate) {
		sfSoundBufferRecorder_start(ptr,sampleRate);
	}
	void stop() {
		sfSoundBufferRecorder_stop(ptr);
	}
	uint sampleRate() {
		return sfSoundBufferRecorder_getSampleRate(ptr);
	}
	SoundBuffer buffer() {
		return new SoundBuffer(sfSoundBufferRecorder_getBuffer(ptr));
	}
}


class SoundRecorder {
    private sfSoundRecorder* ptr;
    private alias ptr this;
    bool opEquals(Object a) {
        auto cst = cast(SoundRecorder)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfSoundRecorder* ptr) {
        this.ptr = ptr; 
    }

	this(sfSoundRecorderStartCallback onStart,sfSoundRecorderProcessCallback onProcess,sfSoundRecorderStopCallback onStop,void *userData) {
		ptr = sfSoundRecorder_create(onStart,onProcess,onStop,userData);
	}
	~this() {
		sfSoundRecorder_destroy(ptr);
	}
	void start(uint sampleRate) {
		sfSoundRecorder_start(ptr,sampleRate);
	}
	void stop() {
		sfSoundRecorder_stop(ptr);
	}
	uint sampleRate() {
		return sfSoundRecorder_getSampleRate(ptr);
	}
	static bool isAvailable() {
		return sfSoundRecorder_isAvailable();
	}
}


enum SoundStatus
{
    Stopped,
    Paused,
    Playing,
}

private extern(C):
	
	

sfMusic * sfMusic_createFromFile(const (char) *filename);
sfMusic * sfMusic_createFromMemory(void *data, int sizeInBytes);
sfMusic * sfMusic_createFromStream(sfInputStream *stream);
void  sfMusic_destroy(sfMusic *music);
void  sfMusic_setLoop(sfMusic *music, bool  loop);
bool   sfMusic_getLoop(sfMusic *music);
Time  sfMusic_getDuration(sfMusic *music);
void  sfMusic_play(sfMusic *music);
void  sfMusic_pause(sfMusic *music);
void  sfMusic_stop(sfMusic *music);
uint  sfMusic_getChannelCount(sfMusic *music);
uint  sfMusic_getSampleRate(sfMusic *music);
SoundStatus  sfMusic_getStatus(sfMusic *music);
Time  sfMusic_getPlayingOffset(sfMusic *music);
void  sfMusic_setPitch(sfMusic *music, float pitch);
void  sfMusic_setVolume(sfMusic *music, float volume);
void  sfMusic_setPosition(sfMusic *music, Vector3f position);
void  sfMusic_setRelativeToListener(sfMusic *music, bool  relative);
void  sfMusic_setMinDistance(sfMusic *music, float distance);
void  sfMusic_setAttenuation(sfMusic *music, float attenuation);
void  sfMusic_setPlayingOffset(sfMusic *music, Time timeOffset);
float  sfMusic_getPitch(sfMusic *music);
float  sfMusic_getVolume(sfMusic *music);
Vector3f  sfMusic_getPosition(sfMusic *music);
bool   sfMusic_isRelativeToListener(sfMusic *music);
float  sfMusic_getMinDistance(sfMusic *music);
float  sfMusic_getAttenuation(sfMusic *music);
sfSound * sfSound_create();
sfSound * sfSound_copy(sfSound *sound);
void  sfSound_destroy(sfSound *sound);
void  sfSound_play(sfSound *sound);
void  sfSound_pause(sfSound *sound);
void  sfSound_stop(sfSound *sound);
void  sfSound_setBuffer(sfSound *sound, sfSoundBuffer *buffer);
sfSoundBuffer * sfSound_getBuffer(sfSound *sound);
void  sfSound_setLoop(sfSound *sound, bool  loop);
bool   sfSound_getLoop(sfSound *sound);
SoundStatus  sfSound_getStatus(sfSound *sound);
void  sfSound_setPitch(sfSound *sound, float pitch);
void  sfSound_setVolume(sfSound *sound, float volume);
void  sfSound_setPosition(sfSound *sound, Vector3f position);
void  sfSound_setRelativeToListener(sfSound *sound, bool  relative);
void  sfSound_setMinDistance(sfSound *sound, float distance);
void  sfSound_setAttenuation(sfSound *sound, float attenuation);
void  sfSound_setPlayingOffset(sfSound *sound, Time timeOffset);
float  sfSound_getPitch(sfSound *sound);
float  sfSound_getVolume(sfSound *sound);
Vector3f  sfSound_getPosition(sfSound *sound);
bool   sfSound_isRelativeToListener(sfSound *sound);
float  sfSound_getMinDistance(sfSound *sound);
float  sfSound_getAttenuation(sfSound *sound);
Time  sfSound_getPlayingOffset(sfSound *sound);
sfSoundBuffer * sfSoundBuffer_createFromFile(const (char) *filename);
sfSoundBuffer * sfSoundBuffer_createFromMemory(void *data, int sizeInBytes);
sfSoundBuffer * sfSoundBuffer_createFromStream(sfInputStream *stream);
sfSoundBuffer * sfSoundBuffer_createFromSamples(short *samples, int sampleCount, uint channelCount, uint sampleRate);
sfSoundBuffer * sfSoundBuffer_copy(sfSoundBuffer *soundBuffer);
void  sfSoundBuffer_destroy(sfSoundBuffer *soundBuffer);
bool   sfSoundBuffer_saveToFile(sfSoundBuffer *soundBuffer, const (char) *filename);
short * sfSoundBuffer_getSamples(sfSoundBuffer *soundBuffer);
int  sfSoundBuffer_getSampleCount(sfSoundBuffer *soundBuffer);
uint  sfSoundBuffer_getSampleRate(sfSoundBuffer *soundBuffer);
uint  sfSoundBuffer_getChannelCount(sfSoundBuffer *soundBuffer);
Time  sfSoundBuffer_getDuration(sfSoundBuffer *soundBuffer);
sfSoundBufferRecorder * sfSoundBufferRecorder_create();
void  sfSoundBufferRecorder_destroy(sfSoundBufferRecorder *soundBufferRecorder);
void  sfSoundBufferRecorder_start(sfSoundBufferRecorder *soundBufferRecorder, uint sampleRate);
void  sfSoundBufferRecorder_stop(sfSoundBufferRecorder *soundBufferRecorder);
uint  sfSoundBufferRecorder_getSampleRate(sfSoundBufferRecorder *soundBufferRecorder);
sfSoundBuffer * sfSoundBufferRecorder_getBuffer(sfSoundBufferRecorder *soundBufferRecorder);
alias bool   function(void *)sfSoundRecorderStartCallback;
alias bool   function(short *, int , void *)sfSoundRecorderProcessCallback;
alias void  function(void *)sfSoundRecorderStopCallback;
sfSoundRecorder * sfSoundRecorder_create(sfSoundRecorderStartCallback onStart, sfSoundRecorderProcessCallback onProcess, sfSoundRecorderStopCallback onStop, void *userData);
void  sfSoundRecorder_destroy(sfSoundRecorder *soundRecorder);
void  sfSoundRecorder_start(sfSoundRecorder *soundRecorder, uint sampleRate);
void  sfSoundRecorder_stop(sfSoundRecorder *soundRecorder);
uint  sfSoundRecorder_getSampleRate(sfSoundRecorder *soundRecorder);
bool   sfSoundRecorder_isAvailable();
	
	
struct sfMusic;
struct sfSound;
struct sfSoundBuffer;
struct sfSoundBufferRecorder;
struct sfSoundRecorder;

alias long  function(void *data, long size, void *userData)sfInputStreamReadFunc;
alias long  function(long position, void *userData)sfInputStreamSeekFunc;
alias long  function(void *userData)sfInputStreamTellFunc;
alias long  function(void *userData)sfInputStreamGetSizeFunc;


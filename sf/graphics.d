module sf.graphics;
public import sf.system : Vector2f, Vector3f, sfInputStream;
public import sf.window;

import std.string:toStringz;

pragma(lib, "csfml-graphics");

version=sf_graphics;
version(sf_graphics)
	pragma(lib, "csfml_funs");// deps:sfml.csfml_funs.build

class CircleShape {
    private sfCircleShape* ptr;
    private alias ptr this;
    override bool opEquals(Object a) {
        auto cst = cast(CircleShape)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfCircleShape* ptr) {
        this.ptr = ptr; 
    }

	this() {
		ptr = sfCircleShape_create();
	}
	this(CircleShape shape) {
		ptr = sfCircleShape_copy(shape);
	}
	~this() {
		sfCircleShape_destroy(ptr);
	}
	Vector2f position(Vector2f position) {
		sfCircleShape_setPosition(ptr,position); return position;
	}
	float rotation(float angle) {
		sfCircleShape_setRotation(ptr,angle); return angle;
	}
	Vector2f scale(Vector2f scale) {
		sfCircleShape_setScale(ptr,scale); return scale;
	}
	Vector2f origin(Vector2f origin) {
		sfCircleShape_setOrigin(ptr,origin); return origin;
	}
	Vector2f position() {
		return sfCircleShape_getPosition(ptr);
	}
	float rotation() {
		return sfCircleShape_getRotation(ptr);
	}
	Vector2f scale() {
		return sfCircleShape_getScale(ptr);
	}
	Vector2f origin() {
		return sfCircleShape_getOrigin(ptr);
	}
	void move(Vector2f offset) {
		sfCircleShape_move(ptr,offset);
	}
	void rotate(float angle) {
		sfCircleShape_rotate(ptr,angle);
	}
	void scale(Vector2f factors) {
		sfCircleShape_scale(ptr,factors);
	}
	Transform transform() {
		return sfCircleShape_getTransform(ptr);
	}
	Transform inverseTransform() {
		return sfCircleShape_getInverseTransform(ptr);
	}
	Texture texture(Texture texture,bool resetRect) {
		sfCircleShape_setTexture(ptr,texture,resetRect); return texture;
	}
	IntRect textureRect(IntRect rect) {
		sfCircleShape_setTextureRect(ptr,rect); return rect;
	}
	Color fillColor(Color color) {
		sfCircleShape_setFillColor(ptr,color); return color;
	}
	Color outlineColor(Color color) {
		sfCircleShape_setOutlineColor(ptr,color); return color;
	}
	float outlineThickness(float thickness) {
		sfCircleShape_setOutlineThickness(ptr,thickness); return thickness;
	}
	Texture texture() {
		return new Texture(sfCircleShape_getTexture(ptr));
	}
	IntRect textureRect() {
		return sfCircleShape_getTextureRect(ptr);
	}
	Color fillColor() {
		return sfCircleShape_getFillColor(ptr);
	}
	Color outlineColor() {
		return sfCircleShape_getOutlineColor(ptr);
	}
	float outlineThickness() {
		return sfCircleShape_getOutlineThickness(ptr);
	}
	uint pointCount() {
		return sfCircleShape_getPointCount(ptr);
	}
	Vector2f point(uint index) {
		return sfCircleShape_getPoint(ptr,index);
	}
	float radius(float radius) {
		sfCircleShape_setRadius(ptr,radius); return radius;
	}
	float radius() {
		return sfCircleShape_getRadius(ptr);
	}
	uint pointCount(uint count) {
		sfCircleShape_setPointCount(ptr,count); return count;
	}
	FloatRect localBounds() {
		return sfCircleShape_getLocalBounds(ptr);
	}
	FloatRect globalBounds() {
		return sfCircleShape_getGlobalBounds(ptr);
	}
}


class Texture {
    private sfTexture* ptr;
    private alias ptr this;
    override bool opEquals(Object a) {
        auto cst = cast(Texture)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfTexture* ptr) {
        this.ptr = ptr; 
    }

	this(uint width,uint height) {
		ptr = sfTexture_create(width,height);
	}
	this(string filename,IntRect *area) {
		ptr = sfTexture_createFromFile(filename.toStringz,area);
	}
	this(void *data,int sizeInBytes,IntRect *area) {
		ptr = sfTexture_createFromMemory(data,sizeInBytes,area);
	}
	this(sfInputStream *stream,IntRect *area) {
		ptr = sfTexture_createFromStream(stream,area);
	}
	this(Image image,IntRect *area) {
		ptr = sfTexture_createFromImage(image,area);
	}
	this(Texture texture) {
		ptr = sfTexture_copy(texture);
	}
	~this() {
		sfTexture_destroy(ptr);
	}
	Vector2u size() {
		return sfTexture_getSize(ptr);
	}
	Image copyToImage() {
		return new Image(sfTexture_copyToImage(ptr));
	}
	void updateFromPixels(ubyte *pixels,uint width,uint height,uint x,uint y) {
		sfTexture_updateFromPixels(ptr,pixels,width,height,x,y);
	}
	void updateFromImage(Image image,uint x,uint y) {
		sfTexture_updateFromImage(ptr,image,x,y);
	}
	void updateFromWindow(Window window,uint x,uint y) {
		sfTexture_updateFromWindow(ptr,window,x,y);
	}
	void updateFromRenderWindow(RenderWindow renderWindow,uint x,uint y) {
		sfTexture_updateFromRenderWindow(ptr,renderWindow,x,y);
	}
	void bind() {
		sfTexture_bind(ptr);
	}
	bool  smooth(bool smooth) {
		sfTexture_setSmooth(ptr,smooth); return smooth;
	}
	bool isSmooth() {
		return sfTexture_isSmooth(ptr);
	}
	bool  repeated(bool repeated) {
		sfTexture_setRepeated(ptr,repeated); return repeated;
	}
	bool isRepeated() {
		return sfTexture_isRepeated(ptr);
	}
	static uint maximumSize() {
		return sfTexture_getMaximumSize();
	}
}


class ConvexShape {
    private sfConvexShape* ptr;
    private alias ptr this;
    override bool opEquals(Object a) {
        auto cst = cast(ConvexShape)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfConvexShape* ptr) {
        this.ptr = ptr; 
    }

	this() {
		ptr = sfConvexShape_create();
	}
	this(ConvexShape shape) {
		ptr = sfConvexShape_copy(shape);
	}
	~this() {
		sfConvexShape_destroy(ptr);
	}
	Vector2f position(Vector2f position) {
		sfConvexShape_setPosition(ptr,position); return position;
	}
	float rotation(float angle) {
		sfConvexShape_setRotation(ptr,angle); return angle;
	}
	Vector2f scale(Vector2f scale) {
		sfConvexShape_setScale(ptr,scale); return scale;
	}
	Vector2f origin(Vector2f origin) {
		sfConvexShape_setOrigin(ptr,origin); return origin;
	}
	Vector2f position() {
		return sfConvexShape_getPosition(ptr);
	}
	float rotation() {
		return sfConvexShape_getRotation(ptr);
	}
	Vector2f scale() {
		return sfConvexShape_getScale(ptr);
	}
	Vector2f origin() {
		return sfConvexShape_getOrigin(ptr);
	}
	void move(Vector2f offset) {
		sfConvexShape_move(ptr,offset);
	}
	void rotate(float angle) {
		sfConvexShape_rotate(ptr,angle);
	}
	void scale(Vector2f factors) {
		sfConvexShape_scale(ptr,factors);
	}
	Transform transform() {
		return sfConvexShape_getTransform(ptr);
	}
	Transform inverseTransform() {
		return sfConvexShape_getInverseTransform(ptr);
	}
	Texture texture(Texture texture,bool resetRect) {
		sfConvexShape_setTexture(ptr,texture,resetRect); return texture;
	}
	IntRect textureRect(IntRect rect) {
		sfConvexShape_setTextureRect(ptr,rect); return rect;
	}
	Color fillColor(Color color) {
		sfConvexShape_setFillColor(ptr,color); return color;
	}
	Color outlineColor(Color color) {
		sfConvexShape_setOutlineColor(ptr,color); return color;
	}
	float outlineThickness(float thickness) {
		sfConvexShape_setOutlineThickness(ptr,thickness); return thickness;
	}
	Texture texture() {
		return new Texture(sfConvexShape_getTexture(ptr));
	}
	IntRect textureRect() {
		return sfConvexShape_getTextureRect(ptr);
	}
	Color fillColor() {
		return sfConvexShape_getFillColor(ptr);
	}
	Color outlineColor() {
		return sfConvexShape_getOutlineColor(ptr);
	}
	float outlineThickness() {
		return sfConvexShape_getOutlineThickness(ptr);
	}
	uint pointCount() {
		return sfConvexShape_getPointCount(ptr);
	}
	Vector2f point(uint index) {
		return sfConvexShape_getPoint(ptr,index);
	}
	uint pointCount(uint count) {
		sfConvexShape_setPointCount(ptr,count); return count;
	}
	uint point(uint index,Vector2f point) {
		sfConvexShape_setPoint(ptr,index,point); return index;
	}
	FloatRect localBounds() {
		return sfConvexShape_getLocalBounds(ptr);
	}
	FloatRect globalBounds() {
		return sfConvexShape_getGlobalBounds(ptr);
	}
}


class Font {
    private sfFont* ptr;
    private alias ptr this;
    override bool opEquals(Object a) {
        auto cst = cast(Font)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfFont* ptr) {
        this.ptr = ptr; 
    }

	this(const(char) *filename) {
		ptr = sfFont_createFromFile(filename);
	}
	this(void *data,int sizeInBytes) {
		ptr = sfFont_createFromMemory(data,sizeInBytes);
	}
	this(sfInputStream *stream) {
		ptr = sfFont_createFromStream(stream);
	}
	this(Font font) {
		ptr = sfFont_copy(font);
	}
	~this() {
		sfFont_destroy(ptr);
	}
	Glyph glyph(uint codePoint,uint characterSize,bool bold) {
		return sfFont_getGlyph(ptr,codePoint,characterSize,bold);
	}
	int kerning(uint first,uint second,uint characterSize) {
		return sfFont_getKerning(ptr,first,second,characterSize);
	}
	int lineSpacing(uint characterSize) {
		return sfFont_getLineSpacing(ptr,characterSize);
	}
	Texture texture(uint characterSize) {
		return new Texture(sfFont_getTexture(ptr,characterSize));
	}
}


class Image {
    private sfImage* ptr;
    private alias ptr this;
    override bool opEquals(Object a) {
        auto cst = cast(Image)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfImage* ptr) {
        this.ptr = ptr; 
    }

	this(uint width,uint height) {
		ptr = sfImage_create(width,height);
	}
	this(uint width,uint height,Color color) {
		ptr = sfImage_createFromColor(width,height,color);
	}
	this(uint width,uint height,ubyte *pixels) {
		ptr = sfImage_createFromPixels(width,height,pixels);
	}
	this(const(char) *filename) {
		ptr = sfImage_createFromFile(filename);
	}
	this(void *data,int size) {
		ptr = sfImage_createFromMemory(data,size);
	}
	this(sfInputStream *stream) {
		ptr = sfImage_createFromStream(stream);
	}
	this(Image image) {
		ptr = sfImage_copy(image);
	}
	~this() {
		sfImage_destroy(ptr);
	}
	bool saveToFile(const(char) *filename) {
		return sfImage_saveToFile(ptr,filename);
	}
	Vector2u size() {
		return sfImage_getSize(ptr);
	}
	void createMaskFromColor(Color color,ubyte alpha) {
		sfImage_createMaskFromColor(ptr,color,alpha);
	}
	void copyImage(Image source,uint destX,uint destY,IntRect sourceRect,bool applyAlpha) {
		sfImage_copyImage(ptr,source,destX,destY,sourceRect,applyAlpha);
	}
	uint pixel(uint x,uint y,Color color) {
		sfImage_setPixel(ptr,x,y,color); return x;
	}
	Color pixel(uint x,uint y) {
		return sfImage_getPixel(ptr,x,y);
	}
	ubyte* pixelsPtr() {
		return sfImage_getPixelsPtr(ptr);
	}
	void flipHorizontally() {
		sfImage_flipHorizontally(ptr);
	}
	void flipVertically() {
		sfImage_flipVertically(ptr);
	}
}


class RectangleShape {
    private sfRectangleShape* ptr;
    private alias ptr this;
    override bool opEquals(Object a) {
        auto cst = cast(RectangleShape)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfRectangleShape* ptr) {
        this.ptr = ptr; 
    }

	this() {
		ptr = sfRectangleShape_create();
	}
	this(RectangleShape shape) {
		ptr = sfRectangleShape_copy(shape);
	}
	~this() {
		sfRectangleShape_destroy(ptr);
	}
	Vector2f position(Vector2f position) {
		sfRectangleShape_setPosition(ptr,position); return position;
	}
	float rotation(float angle) {
		sfRectangleShape_setRotation(ptr,angle); return angle;
	}
	Vector2f scale(Vector2f scale) {
		sfRectangleShape_setScale(ptr,scale); return scale;
	}
	Vector2f origin(Vector2f origin) {
		sfRectangleShape_setOrigin(ptr,origin); return origin;
	}
	Vector2f position() {
		return sfRectangleShape_getPosition(ptr);
	}
	float rotation() {
		return sfRectangleShape_getRotation(ptr);
	}
	Vector2f scale() {
		return sfRectangleShape_getScale(ptr);
	}
	Vector2f origin() {
		return sfRectangleShape_getOrigin(ptr);
	}
	void move(Vector2f offset) {
		sfRectangleShape_move(ptr,offset);
	}
	void rotate(float angle) {
		sfRectangleShape_rotate(ptr,angle);
	}
	void scale(Vector2f factors) {
		sfRectangleShape_scale(ptr,factors);
	}
	Transform transform() {
		return sfRectangleShape_getTransform(ptr);
	}
	Transform inverseTransform() {
		return sfRectangleShape_getInverseTransform(ptr);
	}
	Texture texture(Texture texture,bool resetRect) {
		sfRectangleShape_setTexture(ptr,texture,resetRect); return texture;
	}
	IntRect textureRect(IntRect rect) {
		sfRectangleShape_setTextureRect(ptr,rect); return rect;
	}
	Color fillColor(Color color) {
		sfRectangleShape_setFillColor(ptr,color); return color;
	}
	Color outlineColor(Color color) {
		sfRectangleShape_setOutlineColor(ptr,color); return color;
	}
	float outlineThickness(float thickness) {
		sfRectangleShape_setOutlineThickness(ptr,thickness); return thickness;
	}
	Texture texture() {
		return new Texture(sfRectangleShape_getTexture(ptr));
	}
	IntRect textureRect() {
		return sfRectangleShape_getTextureRect(ptr);
	}
	Color fillColor() {
		return sfRectangleShape_getFillColor(ptr);
	}
	Color outlineColor() {
		return sfRectangleShape_getOutlineColor(ptr);
	}
	float outlineThickness() {
		return sfRectangleShape_getOutlineThickness(ptr);
	}
	uint pointCount() {
		return sfRectangleShape_getPointCount(ptr);
	}
	Vector2f point(uint index) {
		return sfRectangleShape_getPoint(ptr,index);
	}
	Vector2f size(Vector2f size) {
		sfRectangleShape_setSize(ptr,size); return size;
	}
	Vector2f size() {
		return sfRectangleShape_getSize(ptr);
	}
	FloatRect localBounds() {
		return sfRectangleShape_getLocalBounds(ptr);
	}
	FloatRect globalBounds() {
		return sfRectangleShape_getGlobalBounds(ptr);
	}
}


class Shader {
    private sfShader* ptr;
    private alias ptr this;
    override bool opEquals(Object a) {
        auto cst = cast(Shader)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfShader* ptr) {
        this.ptr = ptr; 
    }

	this(const(char) *vertexShaderFilename,const(char) *fragmentShaderFilename) {
		ptr = sfShader_createFromFile(vertexShaderFilename,fragmentShaderFilename);
	}
	//this(const(char) *vertexShader,const(char) *fragmentShader) {
	//	ptr = sfShader_createFromMemory(vertexShader,fragmentShader);
	//}
	this(sfInputStream *vertexShaderStream,sfInputStream *fragmentShaderStream) {
		ptr = sfShader_createFromStream(vertexShaderStream,fragmentShaderStream);
	}
	~this() {
		sfShader_destroy(ptr);
	}
	void setfloatParameter(const(char) *name,float x) {
		sfShader_setFloatParameter(ptr,name,x); 
	}
	void setfloat2Parameter(const(char) *name,float x,float y) {
		sfShader_setFloat2Parameter(ptr,name,x,y); 
	}
	void setfloat3Parameter(const(char) *name,float x,float y,float z) {
		sfShader_setFloat3Parameter(ptr,name,x,y,z); 
	}
	void setfloat4Parameter(const(char) *name,float x,float y,float z,float w) {
		sfShader_setFloat4Parameter(ptr,name,x,y,z,w); 
	}
	void setvector2Parameter(const(char) *name,Vector2f vector) {
		sfShader_setVector2Parameter(ptr,name,vector); 
	}
	void setvector3Parameter(const(char) *name,Vector3f vector) {
		sfShader_setVector3Parameter(ptr,name,vector); 
	}
	void setcolorParameter(const(char) *name,Color color) {
		sfShader_setColorParameter(ptr,name,color); 
	}
	void settransformParameter(const(char) *name,Transform transform) {
		sfShader_setTransformParameter(ptr,name,transform); 
	}
	void settextureParameter(const(char) *name,Texture texture) {
		sfShader_setTextureParameter(ptr,name,texture); 
	}
	void setcurrentTextureParameter(const(char) *name) {
		sfShader_setCurrentTextureParameter(ptr,name); 
	}
	void bind() {
		sfShader_bind(ptr);
	}
	version(none)
	void unbind() {
		sfShader_unbind(ptr);
	}
	static bool isAvailable() {
		return sfShader_isAvailable();
	}
}

class RenderWindow {
    private sfRenderWindow* ptr;
    private alias ptr this;
    override bool opEquals(Object a) {
        auto cst = cast(RenderWindow)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfRenderWindow* ptr) {
        this.ptr = ptr; 
    }

	this(VideoMode mode,const(char) *title,uint style,ContextSettings *settings) {
		version(sf_graphics)
			ptr = sfRenderWindow_create_aux(mode.width,mode.height,mode.bitsPerPixel,title,style,settings);
		else
			ptr = sfRenderWindow_create(mode,title,style,settings);
	}
	this(sfWindowHandle handle,ContextSettings *settings) {
		ptr = sfRenderWindow_createFromHandle(handle,settings);
	}
	~this() {
		sfRenderWindow_destroy(ptr);
	}
	void close() {
		sfRenderWindow_close(ptr);
	}
	bool isOpen() {
		return sfRenderWindow_isOpen(ptr);
	}
	ContextSettings settings() {
		return sfRenderWindow_getSettings(ptr);
	}
	bool pollEvent(Event *event) {
		return sfRenderWindow_pollEvent(ptr,event);
	}
	bool waitEvent(Event *event) {
		return sfRenderWindow_waitEvent(ptr,event);
	}
	Vector2i position() {
		return sfRenderWindow_getPosition(ptr);
	}
	Vector2i position(Vector2i position) {
		sfRenderWindow_setPosition(ptr,position); return position;
	}
	Vector2u size() {
		return sfRenderWindow_getSize(ptr);
	}
	Vector2u size(Vector2u size) {
		sfRenderWindow_setSize(ptr,size); return size;
	}
	const(char)* title(const(char) *title) {
		sfRenderWindow_setTitle(ptr,title); return title;
	}
	uint icon(uint width,uint height,ubyte *pixels) {
		sfRenderWindow_setIcon(ptr,width,height,pixels); return width;
	}
	bool  visible(bool visible) {
		sfRenderWindow_setVisible(ptr,visible); return visible;
	}
	bool  mouseCursorVisible(bool show) {
		sfRenderWindow_setMouseCursorVisible(ptr,show); return show;
	}
	bool  verticalSyncEnabled(bool enabled) {
		sfRenderWindow_setVerticalSyncEnabled(ptr,enabled); return enabled;
	}
	bool  keyRepeatEnabled(bool enabled) {
		sfRenderWindow_setKeyRepeatEnabled(ptr,enabled); return enabled;
	}
	bool  active(bool active) {
		return sfRenderWindow_setActive(ptr,active); return active;
	}
	void display() {
		sfRenderWindow_display(ptr);
	}
	uint framerateLimit(uint limit) {
		sfRenderWindow_setFramerateLimit(ptr,limit); return limit;
	}
	float joystickThreshold(float threshold) {
		sfRenderWindow_setJoystickThreshold(ptr,threshold); return threshold;
	}
	sfWindowHandle systemHandle() {
		return sfRenderWindow_getSystemHandle(ptr);
	}
	void clear(Color color) {
		sfRenderWindow_clear(ptr,color);
	}
	View view(View view) {
		sfRenderWindow_setView(ptr,view); return view;
	}
	View view() {
		return new View(sfRenderWindow_getView(ptr));
	}
	View defaultView() {
		return new View(sfRenderWindow_getDefaultView(ptr));
	}
	IntRect viewport(View view) {
		return sfRenderWindow_getViewport(ptr,view);
	}
	version(none)
	Vector2f convertCoords(Vector2i point,View targetView) {
		return sfRenderWindow_convertCoords(ptr,point,targetView);
	}
	void draw(Sprite object,RenderStates *states) {
		sfRenderWindow_drawSprite(ptr,object.ptr,states);
	}
	void draw(Text object,RenderStates *states) {
		sfRenderWindow_drawText(ptr,object.ptr,states);
	}
	void draw(Shape object,RenderStates *states) {
		sfRenderWindow_drawShape(ptr,object.ptr,states);
	}
	void draw(CircleShape object,RenderStates *states) {
		sfRenderWindow_drawCircleShape(ptr,object.ptr,states);
	}
	void drawe(ConvexShape object,RenderStates *states) {
		sfRenderWindow_drawConvexShape(ptr,object.ptr,states);
	}
	void draw(RectangleShape object,RenderStates *states) {
		sfRenderWindow_drawRectangleShape(ptr,object.ptr,states);
	}
	void draw(VertexArray object,RenderStates *states) {
		sfRenderWindow_drawVertexArray(ptr,object.ptr,states);
	}
	void draw(Vertex *vertices,uint vertexCount,PrimitiveType type,RenderStates *states) {
		sfRenderWindow_drawPrimitives(ptr,vertices,vertexCount,type,states);
	}
	void pushGLStates() {
		sfRenderWindow_pushGLStates(ptr);
	}
	void popGLStates() {
		sfRenderWindow_popGLStates(ptr);
	}
	void resetGLStates() {
		sfRenderWindow_resetGLStates(ptr);
	}
	Image capture() {
		return new Image(sfRenderWindow_capture(ptr));
	}
}


class View {
    private sfView* ptr;
    private alias ptr this;
    override bool opEquals(Object a) {
        auto cst = cast(View)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfView* ptr) {
        this.ptr = ptr; 
    }

	this() {
		ptr = sfView_create();
	}
	this(FloatRect rectangle) {
		ptr = sfView_createFromRect(rectangle);
	}
	this(View view) {
		ptr = sfView_copy(view);
	}
	~this() {
		sfView_destroy(ptr);
	}
	Vector2f center(Vector2f center) {
		sfView_setCenter(ptr,center); return center;
	}
	Vector2f size(Vector2f size) {
		sfView_setSize(ptr,size); return size;
	}
	float rotation(float angle) {
		sfView_setRotation(ptr,angle); return angle;
	}
	FloatRect viewport(FloatRect viewport) {
		sfView_setViewport(ptr,viewport); return viewport;
	}
	void reset(FloatRect rectangle) {
		sfView_reset(ptr,rectangle);
	}
	Vector2f center() {
		return sfView_getCenter(ptr);
	}
	Vector2f size() {
		return sfView_getSize(ptr);
	}
	float rotation() {
		return sfView_getRotation(ptr);
	}
	FloatRect viewport() {
		return sfView_getViewport(ptr);
	}
	void move(Vector2f offset) {
		sfView_move(ptr,offset);
	}
	void rotate(float angle) {
		sfView_rotate(ptr,angle);
	}
	void zoom(float factor) {
		sfView_zoom(ptr,factor);
	}
}


class Sprite {
    private sfSprite* ptr;
    //private alias ptr this;
    override bool opEquals(Object a) {
        auto cst = cast(Sprite)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfSprite* ptr) {
        this.ptr = ptr; 
    }

	this() {
		ptr = sfSprite_create();
	}
	this(Sprite sprite) {
		ptr = sfSprite_copy(sprite.ptr);
	}
	~this() {
		sfSprite_destroy(ptr);
	}
	Vector2f position(Vector2f position) {
		sfSprite_setPosition(ptr,position); return position;
	}
	float rotation(float angle) {
		sfSprite_setRotation(ptr,angle); return angle;
	}
	Vector2f scale(Vector2f scale) {
		sfSprite_setScale(ptr,scale); return scale;
	}
	Vector2f origin(Vector2f origin) {
		sfSprite_setOrigin(ptr,origin); return origin;
	}
	Vector2f position() {
		return sfSprite_getPosition(ptr);
	}
	float rotation() {
		return sfSprite_getRotation(ptr);
	}
	Vector2f scale() {
		return sfSprite_getScale(ptr);
	}
	Vector2f origin() {
		return sfSprite_getOrigin(ptr);
	}
	void move(Vector2f offset) {
		sfSprite_move(ptr,offset);
	}
	void rotate(float angle) {
		sfSprite_rotate(ptr,angle);
	}
	void scale(Vector2f factors) {
		sfSprite_scale(ptr,factors);
	}
	Transform transform() {
		return sfSprite_getTransform(ptr);
	}
	Transform inverseTransform() {
		return sfSprite_getInverseTransform(ptr);
	}
	  Texture texture(Texture texture,bool resetRect=false) {
		sfSprite_setTexture(ptr,texture,resetRect); return texture;
	}
	IntRect textureRect(IntRect rectangle) {
		sfSprite_setTextureRect(ptr,rectangle); return rectangle;
	}
	Color color(Color color) {
		sfSprite_setColor(ptr,color); return color;
	}
	Texture texture() {
		return new Texture(sfSprite_getTexture(ptr));
	}
	IntRect textureRect() {
		return sfSprite_getTextureRect(ptr);
	}
	Color color() {
		return sfSprite_getColor(ptr);
	}
	FloatRect localBounds() {
		return sfSprite_getLocalBounds(ptr);
	}
	FloatRect globalBounds() {
		return sfSprite_getGlobalBounds(ptr);
	}
}


class Text {
    private sfText* ptr;
    private alias ptr this;
    override bool opEquals(Object a) {
        auto cst = cast(Text)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfText* ptr) {
        this.ptr = ptr; 
    }

	this() {
		ptr = sfText_create();
	}
	this(Text text) {
		ptr = sfText_copy(text);
	}
	~this() {
		sfText_destroy(ptr);
	}
	Vector2f position(Vector2f position) {
		sfText_setPosition(ptr,position); return position;
	}
	float rotation(float angle) {
		sfText_setRotation(ptr,angle); return angle;
	}
	Vector2f scale(Vector2f scale) {
		sfText_setScale(ptr,scale); return scale;
	}
	Vector2f origin(Vector2f origin) {
		sfText_setOrigin(ptr,origin); return origin;
	}
	Vector2f position() {
		return sfText_getPosition(ptr);
	}
	float rotation() {
		return sfText_getRotation(ptr);
	}
	Vector2f scale() {
		return sfText_getScale(ptr);
	}
	Vector2f origin() {
		return sfText_getOrigin(ptr);
	}
	void move(Vector2f offset) {
		sfText_move(ptr,offset);
	}
	void rotate(float angle) {
		sfText_rotate(ptr,angle);
	}
	void scale(Vector2f factors) {
		sfText_scale(ptr,factors);
	}
	Transform transform() {
		return sfText_getTransform(ptr);
	}
	Transform inverseTransform() {
		return sfText_getInverseTransform(ptr);
	}
	const(char)* string(const(char) *string) {
		sfText_setString(ptr,string); return string;
	}
	uint* unicodeString(uint *string) {
		sfText_setUnicodeString(ptr,string); return string;
	}
	Font font(Font font) {
		sfText_setFont(ptr,font); return font;
	}
	uint characterSize(uint size) {
		sfText_setCharacterSize(ptr,size); return size;
	}
	uint style(uint style) {
		sfText_setStyle(ptr,style); return style;
	}
	Color color(Color color) {
		sfText_setColor(ptr,color); return color;
	}
	const(char)* string() {
		return sfText_getString(ptr);
	}
	uint* unicodeString() {
		return sfText_getUnicodeString(ptr);
	}
	Font font() {
		return new Font(sfText_getFont(ptr));
	}
	uint characterSize() {
		return sfText_getCharacterSize(ptr);
	}
	uint style() {
		return sfText_getStyle(ptr);
	}
	Color color() {
		return sfText_getColor(ptr);
	}
	Vector2f findCharacterPos(int index) {
		return sfText_findCharacterPos(ptr,index);
	}
	FloatRect localBounds() {
		return sfText_getLocalBounds(ptr);
	}
	FloatRect globalBounds() {
		return sfText_getGlobalBounds(ptr);
	}
}


class Shape {
    private sfShape* ptr;
    private alias ptr this;
    override bool opEquals(Object a) {
        auto cst = cast(Shape)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfShape* ptr) {
        this.ptr = ptr; 
    }

	this(sfShapeGetPointCountCallback getPointCount,sfShapeGetPointCallback getPoint,void *userData) {
		ptr = sfShape_create(getPointCount,getPoint,userData);
	}
	~this() {
		sfShape_destroy(ptr);
	}
	Vector2f position(Vector2f position) {
		sfShape_setPosition(ptr,position); return position;
	}
	float rotation(float angle) {
		sfShape_setRotation(ptr,angle); return angle;
	}
	Vector2f scale(Vector2f scale) {
		sfShape_setScale(ptr,scale); return scale;
	}
	Vector2f origin(Vector2f origin) {
		sfShape_setOrigin(ptr,origin); return origin;
	}
	Vector2f position() {
		return sfShape_getPosition(ptr);
	}
	float rotation() {
		return sfShape_getRotation(ptr);
	}
	Vector2f scale() {
		return sfShape_getScale(ptr);
	}
	Vector2f origin() {
		return sfShape_getOrigin(ptr);
	}
	void move(Vector2f offset) {
		sfShape_move(ptr,offset);
	}
	void rotate(float angle) {
		sfShape_rotate(ptr,angle);
	}
	void scale(Vector2f factors) {
		sfShape_scale(ptr,factors);
	}
	Transform transform() {
		return sfShape_getTransform(ptr);
	}
	Transform inverseTransform() {
		return sfShape_getInverseTransform(ptr);
	}
	Texture texture(Texture texture,bool resetRect) {
		sfShape_setTexture(ptr,texture,resetRect); return texture;
	}
	IntRect textureRect(IntRect rect) {
		sfShape_setTextureRect(ptr,rect); return rect;
	}
	Color fillColor(Color color) {
		sfShape_setFillColor(ptr,color); return color;
	}
	Color outlineColor(Color color) {
		sfShape_setOutlineColor(ptr,color); return color;
	}
	float outlineThickness(float thickness) {
		sfShape_setOutlineThickness(ptr,thickness); return thickness;
	}
	Texture texture() {
		return new Texture(sfShape_getTexture(ptr));
	}
	IntRect textureRect() {
		return sfShape_getTextureRect(ptr);
	}
	Color fillColor() {
		return sfShape_getFillColor(ptr);
	}
	Color outlineColor() {
		return sfShape_getOutlineColor(ptr);
	}
	float outlineThickness() {
		return sfShape_getOutlineThickness(ptr);
	}
	uint pointCount() {
		return sfShape_getPointCount(ptr);
	}
	Vector2f point(uint index) {
		return sfShape_getPoint(ptr,index);
	}
	FloatRect localBounds() {
		return sfShape_getLocalBounds(ptr);
	}
	FloatRect globalBounds() {
		return sfShape_getGlobalBounds(ptr);
	}
	void update() {
		sfShape_update(ptr);
	}
}


class VertexArray {
    private sfVertexArray* ptr;
    private alias ptr this;
    override bool opEquals(Object a) {
        auto cst = cast(VertexArray)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfVertexArray* ptr) {
        this.ptr = ptr; 
    }

	this() {
		ptr = sfVertexArray_create();
	}
	this(VertexArray vertexArray) {
		ptr = sfVertexArray_copy(vertexArray);
	}
	~this() {
		sfVertexArray_destroy(ptr);
	}
	uint vertexCount() {
		return sfVertexArray_getVertexCount(ptr);
	}
	Vertex* vertex(uint index) {
		return sfVertexArray_getVertex(ptr,index);
	}
	void clear() {
		sfVertexArray_clear(ptr);
	}
	void resize(uint vertexCount) {
		sfVertexArray_resize(ptr,vertexCount);
	}
	void append(Vertex vertex) {
		sfVertexArray_append(ptr,vertex);
	}
	PrimitiveType primitiveType(PrimitiveType type) {
		sfVertexArray_setPrimitiveType(ptr,type); return type;
	}
	PrimitiveType primitiveType() {
		return sfVertexArray_getPrimitiveType(ptr);
	}
	FloatRect bounds() {
		return sfVertexArray_getBounds(ptr);
	}
}


class RenderTexture {
    private sfRenderTexture* ptr;
    private alias ptr this;
    override bool opEquals(Object a) {
        auto cst = cast(RenderTexture)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfRenderTexture* ptr) {
        this.ptr = ptr; 
    }

	this(uint width,uint height,bool depthBuffer) {
		ptr = sfRenderTexture_create(width,height,depthBuffer);
	}
	~this() {
		sfRenderTexture_destroy(ptr);
	}
	Vector2u size() {
		return sfRenderTexture_getSize(ptr);
	}
	bool  active(bool active) {
		return sfRenderTexture_setActive(ptr,active); return active;
	}
	void display() {
		sfRenderTexture_display(ptr);
	}
	void clear(Color color) {
		sfRenderTexture_clear(ptr,color);
	}
	View view(View view) {
		sfRenderTexture_setView(ptr,view); return view;
	}
	View view() {
		return new View(sfRenderTexture_getView(ptr));
	}
	View defaultView() {
		return new View(sfRenderTexture_getDefaultView(ptr));
	}
	IntRect viewport(View view) {
		return sfRenderTexture_getViewport(ptr,view);
	}
	version(none)
	Vector2f convertCoords(Vector2i point,View targetView) {
		return sfRenderTexture_convertCoords(ptr,point,targetView);
	}
	void drawSprite(Sprite object,RenderStates *states) {
		sfRenderTexture_drawSprite(ptr,object.ptr,states);
	}
	void drawText(Text object,RenderStates *states) {
		sfRenderTexture_drawText(ptr,object,states);
	}
	void drawShape(Shape object,RenderStates *states) {
		sfRenderTexture_drawShape(ptr,object,states);
	}
	void drawCircleShape(CircleShape object,RenderStates *states) {
		sfRenderTexture_drawCircleShape(ptr,object,states);
	}
	void drawConvexShape(ConvexShape object,RenderStates *states) {
		sfRenderTexture_drawConvexShape(ptr,object,states);
	}
	void drawRectangleShape(RectangleShape object,RenderStates *states) {
		sfRenderTexture_drawRectangleShape(ptr,object,states);
	}
	void drawVertexArray(VertexArray object,RenderStates *states) {
		sfRenderTexture_drawVertexArray(ptr,object,states);
	}
	void drawPrimitives(Vertex *vertices,uint vertexCount,PrimitiveType type,RenderStates *states) {
		sfRenderTexture_drawPrimitives(ptr,vertices,vertexCount,type,states);
	}
	void pushGLStates() {
		sfRenderTexture_pushGLStates(ptr);
	}
	void popGLStates() {
		sfRenderTexture_popGLStates(ptr);
	}
	void resetGLStates() {
		sfRenderTexture_resetGLStates(ptr);
	}
	Texture texture() {
		return new Texture(sfRenderTexture_getTexture(ptr));
	}
	bool  smooth(bool smooth) {
		sfRenderTexture_setSmooth(ptr,smooth); return smooth;
	}
	bool isSmooth() {
		return sfRenderTexture_isSmooth(ptr);
	}
}


class Transformable {
    private sfTransformable* ptr;
    private alias ptr this;
    override bool opEquals(Object a) {
        auto cst = cast(Transformable)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfTransformable* ptr) {
        this.ptr = ptr; 
    }

	this() {
		ptr = sfTransformable_create();
	}
	this(Transformable transformable) {
		ptr = sfTransformable_copy(transformable);
	}
	~this() {
		sfTransformable_destroy(ptr);
	}
	Vector2f position(Vector2f position) {
		sfTransformable_setPosition(ptr,position); return position;
	}
	float rotation(float angle) {
		sfTransformable_setRotation(ptr,angle); return angle;
	}
	Vector2f scale(Vector2f scale) {
		sfTransformable_setScale(ptr,scale); return scale;
	}
	Vector2f origin(Vector2f origin) {
		sfTransformable_setOrigin(ptr,origin); return origin;
	}
	Vector2f position() {
		return sfTransformable_getPosition(ptr);
	}
	float rotation() {
		return sfTransformable_getRotation(ptr);
	}
	Vector2f scale() {
		return sfTransformable_getScale(ptr);
	}
	Vector2f origin() {
		return sfTransformable_getOrigin(ptr);
	}
	void move(Vector2f offset) {
		sfTransformable_move(ptr,offset);
	}
	void rotate(float angle) {
		sfTransformable_rotate(ptr,angle);
	}
	void scale(Vector2f factors) {
		sfTransformable_scale(ptr,factors);
	}
	Transform transform() {
		return sfTransformable_getTransform(ptr);
	}
	Transform inverseTransform() {
		return sfTransformable_getInverseTransform(ptr);
	}
}


struct IntRect
{
    int left;
    int top;
    int width;
    int height;
}
struct Transform
{
    float [9]matrix;
}
struct Glyph
{
    int advance;
    IntRect bounds;
    IntRect textureRect;
}
struct RenderStates
{
    BlendMode blendMode;
    Transform transform;
    private sfTexture *_texture;
    private sfShader *_shader;
	
	Texture texture(Texture t)
	{
		_texture = t;
		return t;
	}
	Texture texture()
	{
		return new Texture(_texture);
	}
	Shader shader()
	{
		return new Shader(_shader);
	}
	Shader shader(Shader sh)
	{
		_shader = sh;
		return sh;
	}
	
}
struct Vertex
{
    Vector2f position;
    Color color;
    Vector2f texCoords;
}

enum BlendMode
{
    Alpha,
    Add,
    Multiply,
    None,
}
enum PrimitiveType
{
    Points,
    Lines,
    LinesStrip,
    Triangles,
    TrianglesStrip,
    Trianglean,
    Quads,
}
enum TextStyle
{
    Regular,
    Bold,
    Italic,
    Underlined = 4,
}

struct Color
{
    ubyte r;
    ubyte g;
    ubyte b;
    ubyte a;
	
	immutable static Black = Color(0, 0, 0, 255);
	immutable static White = Color(255, 255, 255, 255);
	immutable static Red = Color(255, 0, 0, 255);
	immutable static Green = Color(0, 255, 0,255);
	immutable static Blue = Color(0, 0, 255,255);
	immutable static Yellow = Color(255, 255, 0, 255);
	immutable static Magenta = Color(255, 0, 255, 255);
	immutable static Cyan = Color(0, 255, 255, 255);
	immutable static Transparent = Color(0, 0, 0, 0);
}
struct FloatRect
{
    float left;
    float top;
    float width;
    float height;
	
	float right() {return left + width; }
	float bottom() {return top + height; }
	
	bool contains(Vector2f v) {
		return v.x >= left && v.x <= (left+width) && v.y >= top && v.y <= (top+height);			
	}
	bool contains(FloatRect r) {
		return r.left >= left && r.right <= right && r.top >= top && r.bottom <= bottom;
	}
	bool intersects(FloatRect b) {
	
		return !(b.left > right || b.right < left || b.top > bottom || b.bottom < top);	
	}	
}

private extern(C):

struct sfCircleShape;
struct sfTexture;
struct sfConvexShape;
struct sfFont;
struct sfImage;
struct sfRectangleShape;
struct sfShader;
struct sfRenderWindow;
struct sfView;
struct sfSprite;
struct sfText;
struct sfShape;
struct sfVertexArray;
struct sfRenderTexture;
struct sfTransformable;




bool   sfFloatRect_contains(FloatRect *rect, float x, float y);
bool   sfIntRect_contains(IntRect *rect, int x, int y);
bool   sfFloatRect_intersects(FloatRect *rect1, FloatRect *rect2, FloatRect *intersection);
bool   sfIntRect_intersects(IntRect *rect1, IntRect *rect2, IntRect *intersection);

const Transform sfTransform_Identity;
Transform  sfTransform_fromMatrix(float a00, float a01, float a02, float a10, float a11, float a12, float a20, float a21, float a22);
void  sfTransform_getMatrix(Transform *transform, float *matrix);
Transform  sfTransform_getInverse(Transform *transform);
Vector2f  sfTransform_transformPoint(Transform *transform, Vector2f point);
FloatRect  sfTransform_transformRect(Transform *transform, FloatRect rectangle);
void  sfTransform_combine(Transform *transform, Transform *other);
void  sfTransform_translate(Transform *transform, float x, float y);
void  sfTransform_rotate(Transform *transform, float angle);
void  sfTransform_rotateWithCenter(Transform *transform, float angle, float centerX, float centerY);
void  sfTransform_scale(Transform *transform, float scaleX, float scaleY);
void  sfTransform_scaleWithCenter(Transform *transform, float scaleX, float scaleY, float centerX, float centerY);
sfCircleShape * sfCircleShape_create();
sfCircleShape * sfCircleShape_copy(sfCircleShape *shape);
void  sfCircleShape_destroy(sfCircleShape *shape);
void  sfCircleShape_setPosition(sfCircleShape *shape, Vector2f position);
void  sfCircleShape_setRotation(sfCircleShape *shape, float angle);
void  sfCircleShape_setScale(sfCircleShape *shape, Vector2f scale);
void  sfCircleShape_setOrigin(sfCircleShape *shape, Vector2f origin);
Vector2f  sfCircleShape_getPosition(sfCircleShape *shape);
float  sfCircleShape_getRotation(sfCircleShape *shape);
Vector2f  sfCircleShape_getScale(sfCircleShape *shape);
Vector2f  sfCircleShape_getOrigin(sfCircleShape *shape);
void  sfCircleShape_move(sfCircleShape *shape, Vector2f offset);
void  sfCircleShape_rotate(sfCircleShape *shape, float angle);
void  sfCircleShape_scale(sfCircleShape *shape, Vector2f factors);
Transform  sfCircleShape_getTransform(sfCircleShape *shape);
Transform  sfCircleShape_getInverseTransform(sfCircleShape *shape);
void  sfCircleShape_setTexture(sfCircleShape *shape, sfTexture *texture, bool  resetRect);
void  sfCircleShape_setTextureRect(sfCircleShape *shape, IntRect rect);
void  sfCircleShape_setFillColor(sfCircleShape *shape, Color color);
void  sfCircleShape_setOutlineColor(sfCircleShape *shape, Color color);
void  sfCircleShape_setOutlineThickness(sfCircleShape *shape, float thickness);
sfTexture * sfCircleShape_getTexture(sfCircleShape *shape);
IntRect  sfCircleShape_getTextureRect(sfCircleShape *shape);
Color  sfCircleShape_getFillColor(sfCircleShape *shape);
Color  sfCircleShape_getOutlineColor(sfCircleShape *shape);
float  sfCircleShape_getOutlineThickness(sfCircleShape *shape);
uint  sfCircleShape_getPointCount(sfCircleShape *shape);
Vector2f  sfCircleShape_getPoint(sfCircleShape *shape, uint index);
void  sfCircleShape_setRadius(sfCircleShape *shape, float radius);
float  sfCircleShape_getRadius(sfCircleShape *shape);
void  sfCircleShape_setPointCount(sfCircleShape *shape, uint count);
FloatRect  sfCircleShape_getLocalBounds(sfCircleShape *shape);
FloatRect  sfCircleShape_getGlobalBounds(sfCircleShape *shape);
sfConvexShape * sfConvexShape_create();
sfConvexShape * sfConvexShape_copy(sfConvexShape *shape);
void  sfConvexShape_destroy(sfConvexShape *shape);
void  sfConvexShape_setPosition(sfConvexShape *shape, Vector2f position);
void  sfConvexShape_setRotation(sfConvexShape *shape, float angle);
void  sfConvexShape_setScale(sfConvexShape *shape, Vector2f scale);
void  sfConvexShape_setOrigin(sfConvexShape *shape, Vector2f origin);
Vector2f  sfConvexShape_getPosition(sfConvexShape *shape);
float  sfConvexShape_getRotation(sfConvexShape *shape);
Vector2f  sfConvexShape_getScale(sfConvexShape *shape);
Vector2f  sfConvexShape_getOrigin(sfConvexShape *shape);
void  sfConvexShape_move(sfConvexShape *shape, Vector2f offset);
void  sfConvexShape_rotate(sfConvexShape *shape, float angle);
void  sfConvexShape_scale(sfConvexShape *shape, Vector2f factors);
Transform  sfConvexShape_getTransform(sfConvexShape *shape);
Transform  sfConvexShape_getInverseTransform(sfConvexShape *shape);
void  sfConvexShape_setTexture(sfConvexShape *shape, sfTexture *texture, bool  resetRect);
void  sfConvexShape_setTextureRect(sfConvexShape *shape, IntRect rect);
void  sfConvexShape_setFillColor(sfConvexShape *shape, Color color);
void  sfConvexShape_setOutlineColor(sfConvexShape *shape, Color color);
void  sfConvexShape_setOutlineThickness(sfConvexShape *shape, float thickness);
sfTexture * sfConvexShape_getTexture(sfConvexShape *shape);
IntRect  sfConvexShape_getTextureRect(sfConvexShape *shape);
Color  sfConvexShape_getFillColor(sfConvexShape *shape);
Color  sfConvexShape_getOutlineColor(sfConvexShape *shape);
float  sfConvexShape_getOutlineThickness(sfConvexShape *shape);
uint  sfConvexShape_getPointCount(sfConvexShape *shape);
Vector2f  sfConvexShape_getPoint(sfConvexShape *shape, uint index);
void  sfConvexShape_setPointCount(sfConvexShape *shape, uint count);
void  sfConvexShape_setPoint(sfConvexShape *shape, uint index, Vector2f point);
FloatRect  sfConvexShape_getLocalBounds(sfConvexShape *shape);
FloatRect  sfConvexShape_getGlobalBounds(sfConvexShape *shape);

sfFont * sfFont_createFromFile(const (char) *filename);
sfFont * sfFont_createFromMemory(void *data, int sizeInBytes);
sfFont * sfFont_createFromStream(sfInputStream *stream);
sfFont * sfFont_copy(sfFont *font);
void  sfFont_destroy(sfFont *font);
Glyph  sfFont_getGlyph(sfFont *font, uint codePoint, uint characterSize, bool  bold);
int  sfFont_getKerning(sfFont *font, uint first, uint second, uint characterSize);
int  sfFont_getLineSpacing(sfFont *font, uint characterSize);
sfTexture * sfFont_getTexture(sfFont *font, uint characterSize);
sfImage * sfImage_create(uint width, uint height);
sfImage * sfImage_createFromColor(uint width, uint height, Color color);
sfImage * sfImage_createFromPixels(uint width, uint height, ubyte *pixels);
sfImage * sfImage_createFromFile(const (char) *filename);
sfImage * sfImage_createFromMemory(void *data, int size);
sfImage * sfImage_createFromStream(sfInputStream *stream);
sfImage * sfImage_copy(sfImage *image);
void  sfImage_destroy(sfImage *image);
bool   sfImage_saveToFile(sfImage *image, const (char) *filename);
Vector2u  sfImage_getSize(sfImage *image);
void  sfImage_createMaskFromColor(sfImage *image, Color color, ubyte alpha);
void  sfImage_copyImage(sfImage *image, sfImage *source, uint destX, uint destY, IntRect sourceRect, bool  applyAlpha);
void  sfImage_setPixel(sfImage *image, uint x, uint y, Color color);
Color  sfImage_getPixel(sfImage *image, uint x, uint y);
ubyte * sfImage_getPixelsPtr(sfImage *image);
void  sfImage_flipHorizontally(sfImage *image);
void  sfImage_flipVertically(sfImage *image);

sfRectangleShape * sfRectangleShape_create();
sfRectangleShape * sfRectangleShape_copy(sfRectangleShape *shape);
void  sfRectangleShape_destroy(sfRectangleShape *shape);
void  sfRectangleShape_setPosition(sfRectangleShape *shape, Vector2f position);
void  sfRectangleShape_setRotation(sfRectangleShape *shape, float angle);
void  sfRectangleShape_setScale(sfRectangleShape *shape, Vector2f scale);
void  sfRectangleShape_setOrigin(sfRectangleShape *shape, Vector2f origin);
Vector2f  sfRectangleShape_getPosition(sfRectangleShape *shape);
float  sfRectangleShape_getRotation(sfRectangleShape *shape);
Vector2f  sfRectangleShape_getScale(sfRectangleShape *shape);
Vector2f  sfRectangleShape_getOrigin(sfRectangleShape *shape);
void  sfRectangleShape_move(sfRectangleShape *shape, Vector2f offset);
void  sfRectangleShape_rotate(sfRectangleShape *shape, float angle);
void  sfRectangleShape_scale(sfRectangleShape *shape, Vector2f factors);
Transform  sfRectangleShape_getTransform(sfRectangleShape *shape);
Transform  sfRectangleShape_getInverseTransform(sfRectangleShape *shape);
void  sfRectangleShape_setTexture(sfRectangleShape *shape, sfTexture *texture, bool  resetRect);
void  sfRectangleShape_setTextureRect(sfRectangleShape *shape, IntRect rect);
void  sfRectangleShape_setFillColor(sfRectangleShape *shape, Color color);
void  sfRectangleShape_setOutlineColor(sfRectangleShape *shape, Color color);
void  sfRectangleShape_setOutlineThickness(sfRectangleShape *shape, float thickness);
sfTexture * sfRectangleShape_getTexture(sfRectangleShape *shape);
IntRect  sfRectangleShape_getTextureRect(sfRectangleShape *shape);
Color  sfRectangleShape_getFillColor(sfRectangleShape *shape);
Color  sfRectangleShape_getOutlineColor(sfRectangleShape *shape);
float  sfRectangleShape_getOutlineThickness(sfRectangleShape *shape);
uint  sfRectangleShape_getPointCount(sfRectangleShape *shape);
Vector2f  sfRectangleShape_getPoint(sfRectangleShape *shape, uint index);
void  sfRectangleShape_setSize(sfRectangleShape *shape, Vector2f size);
Vector2f  sfRectangleShape_getSize(sfRectangleShape *shape);
FloatRect  sfRectangleShape_getLocalBounds(sfRectangleShape *shape);
FloatRect  sfRectangleShape_getGlobalBounds(sfRectangleShape *shape);


sfRenderWindow * sfRenderWindow_create(VideoMode mode, const (char) *title, uint style, ContextSettings *settings);
sfRenderWindow * sfRenderWindow_createFromHandle(sfWindowHandle handle, ContextSettings *settings);
void  sfRenderWindow_destroy(sfRenderWindow *renderWindow);
void  sfRenderWindow_close(sfRenderWindow *renderWindow);
bool   sfRenderWindow_isOpen(sfRenderWindow *renderWindow);
ContextSettings  sfRenderWindow_getSettings(sfRenderWindow *renderWindow);
bool   sfRenderWindow_pollEvent(sfRenderWindow *renderWindow, Event *event);
bool   sfRenderWindow_waitEvent(sfRenderWindow *renderWindow, Event *event);
Vector2i  sfRenderWindow_getPosition(sfRenderWindow *renderWindow);
void  sfRenderWindow_setPosition(sfRenderWindow *renderWindow, Vector2i position);
Vector2u  sfRenderWindow_getSize(sfRenderWindow *renderWindow);
void  sfRenderWindow_setSize(sfRenderWindow *renderWindow, Vector2u size);
void  sfRenderWindow_setTitle(sfRenderWindow *renderWindow, const (char) *title);
void  sfRenderWindow_setIcon(sfRenderWindow *renderWindow, uint width, uint height, ubyte *pixels);
void  sfRenderWindow_setVisible(sfRenderWindow *renderWindow, bool  visible);
void  sfRenderWindow_setMouseCursorVisible(sfRenderWindow *renderWindow, bool  show);
void  sfRenderWindow_setVerticalSyncEnabled(sfRenderWindow *renderWindow, bool  enabled);
void  sfRenderWindow_setKeyRepeatEnabled(sfRenderWindow *renderWindow, bool  enabled);
bool   sfRenderWindow_setActive(sfRenderWindow *renderWindow, bool  active);
void  sfRenderWindow_display(sfRenderWindow *renderWindow);
void  sfRenderWindow_setFramerateLimit(sfRenderWindow *renderWindow, uint limit);
void  sfRenderWindow_setJoystickThreshold(sfRenderWindow *renderWindow, float threshold);
sfWindowHandle  sfRenderWindow_getSystemHandle(sfRenderWindow *renderWindow);
void  sfRenderWindow_clear(sfRenderWindow *renderWindow, Color color);
void  sfRenderWindow_setView(sfRenderWindow *renderWindow, sfView *view);
sfView * sfRenderWindow_getView(sfRenderWindow *renderWindow);
sfView * sfRenderWindow_getDefaultView(sfRenderWindow *renderWindow);
IntRect  sfRenderWindow_getViewport(sfRenderWindow *renderWindow, sfView *view);
Vector2f  sfRenderWindow_convertCoords(sfRenderWindow *renderWindow, Vector2i point, sfView *targetView);
void  sfRenderWindow_drawSprite(sfRenderWindow *renderWindow, sfSprite *object, RenderStates *states);
void  sfRenderWindow_drawText(sfRenderWindow *renderWindow, sfText *object, RenderStates *states);
void  sfRenderWindow_drawShape(sfRenderWindow *renderWindow, sfShape *object, RenderStates *states);
void  sfRenderWindow_drawCircleShape(sfRenderWindow *renderWindow, sfCircleShape *object, RenderStates *states);
void  sfRenderWindow_drawConvexShape(sfRenderWindow *renderWindow, sfConvexShape *object, RenderStates *states);
void  sfRenderWindow_drawRectangleShape(sfRenderWindow *renderWindow, sfRectangleShape *object, RenderStates *states);
void  sfRenderWindow_drawVertexArray(sfRenderWindow *renderWindow, sfVertexArray *object, RenderStates *states);
void  sfRenderWindow_drawPrimitives(sfRenderWindow *renderWindow, Vertex *vertices, uint vertexCount, PrimitiveType type, RenderStates *states);
void  sfRenderWindow_pushGLStates(sfRenderWindow *renderWindow);
void  sfRenderWindow_popGLStates(sfRenderWindow *renderWindow);
void  sfRenderWindow_resetGLStates(sfRenderWindow *renderWindow);
sfImage * sfRenderWindow_capture(sfRenderWindow *renderWindow);
Vector2i  sfMouse_getPositionRenderWindow(sfRenderWindow *relativeTo);
void  sfMouse_setPositionRenderWindow(Vector2i position, sfRenderWindow *relativeTo);
sfRenderTexture * sfRenderTexture_create(uint width, uint height, bool  depthBuffer);
void  sfRenderTexture_destroy(sfRenderTexture *renderTexture);
Vector2u  sfRenderTexture_getSize(sfRenderTexture *renderTexture);
bool   sfRenderTexture_setActive(sfRenderTexture *renderTexture, bool  active);
void  sfRenderTexture_display(sfRenderTexture *renderTexture);
void  sfRenderTexture_clear(sfRenderTexture *renderTexture, Color color);
void  sfRenderTexture_setView(sfRenderTexture *renderTexture, sfView *view);
sfView * sfRenderTexture_getView(sfRenderTexture *renderTexture);
sfView * sfRenderTexture_getDefaultView(sfRenderTexture *renderTexture);
IntRect  sfRenderTexture_getViewport(sfRenderTexture *renderTexture, sfView *view);
Vector2f  sfRenderTexture_convertCoords(sfRenderTexture *renderTexture, Vector2i point, sfView *targetView);
void  sfRenderTexture_drawSprite(sfRenderTexture *renderTexture, sfSprite *object, RenderStates *states);
void  sfRenderTexture_drawText(sfRenderTexture *renderTexture, sfText *object, RenderStates *states);
void  sfRenderTexture_drawShape(sfRenderTexture *renderTexture, sfShape *object, RenderStates *states);
void  sfRenderTexture_drawCircleShape(sfRenderTexture *renderTexture, sfCircleShape *object, RenderStates *states);
void  sfRenderTexture_drawConvexShape(sfRenderTexture *renderTexture, sfConvexShape *object, RenderStates *states);
void  sfRenderTexture_drawRectangleShape(sfRenderTexture *renderTexture, sfRectangleShape *object, RenderStates *states);
void  sfRenderTexture_drawVertexArray(sfRenderTexture *renderTexture, sfVertexArray *object, RenderStates *states);
void  sfRenderTexture_drawPrimitives(sfRenderTexture *renderTexture, Vertex *vertices, uint vertexCount, PrimitiveType type, RenderStates *states);
void  sfRenderTexture_pushGLStates(sfRenderTexture *renderTexture);
void  sfRenderTexture_popGLStates(sfRenderTexture *renderTexture);
void  sfRenderTexture_resetGLStates(sfRenderTexture *renderTexture);
sfTexture * sfRenderTexture_getTexture(sfRenderTexture *renderTexture);
void  sfRenderTexture_setSmooth(sfRenderTexture *renderTexture, bool  smooth);
bool   sfRenderTexture_isSmooth(sfRenderTexture *renderTexture);
sfShader * sfShader_createFromFile(const (char) *vertexShaderFilename, const (char) *fragmentShaderFilename);
sfShader * sfShader_createFromMemory(const (char) *vertexShader, const (char) *fragmentShader);
sfShader * sfShader_createFromStream(sfInputStream *vertexShaderStream, sfInputStream *fragmentShaderStream);
void  sfShader_destroy(sfShader *shader);
void  sfShader_setFloatParameter(sfShader *shader, const (char) *name, float x);
void  sfShader_setFloat2Parameter(sfShader *shader, const (char) *name, float x, float y);
void  sfShader_setFloat3Parameter(sfShader *shader, const (char) *name, float x, float y, float z);
void  sfShader_setFloat4Parameter(sfShader *shader, const (char) *name, float x, float y, float z, float w);
void  sfShader_setVector2Parameter(sfShader *shader, const (char) *name, Vector2f vector);
void  sfShader_setVector3Parameter(sfShader *shader, const (char) *name, Vector3f vector);
void  sfShader_setColorParameter(sfShader *shader, const (char) *name, Color color);
void  sfShader_setTransformParameter(sfShader *shader, const (char) *name, Transform transform);
void  sfShader_setTextureParameter(sfShader *shader, const (char) *name, sfTexture *texture);
void  sfShader_setCurrentTextureParameter(sfShader *shader, const (char) *name);
void  sfShader_bind(sfShader *shader);
void  sfShader_unbind(sfShader *shader);
bool   sfShader_isAvailable();
alias uint  function(void *)sfShapeGetPointCountCallback;
alias Vector2f  function(uint , void *)sfShapeGetPointCallback;
sfShape * sfShape_create(sfShapeGetPointCountCallback getPointCount, sfShapeGetPointCallback getPoint, void *userData);
void  sfShape_destroy(sfShape *shape);
void  sfShape_setPosition(sfShape *shape, Vector2f position);
void  sfShape_setRotation(sfShape *shape, float angle);
void  sfShape_setScale(sfShape *shape, Vector2f scale);
void  sfShape_setOrigin(sfShape *shape, Vector2f origin);
Vector2f  sfShape_getPosition(sfShape *shape);
float  sfShape_getRotation(sfShape *shape);
Vector2f  sfShape_getScale(sfShape *shape);
Vector2f  sfShape_getOrigin(sfShape *shape);
void  sfShape_move(sfShape *shape, Vector2f offset);
void  sfShape_rotate(sfShape *shape, float angle);
void  sfShape_scale(sfShape *shape, Vector2f factors);
Transform  sfShape_getTransform(sfShape *shape);
Transform  sfShape_getInverseTransform(sfShape *shape);
void  sfShape_setTexture(sfShape *shape, sfTexture *texture, bool  resetRect);
void  sfShape_setTextureRect(sfShape *shape, IntRect rect);
void  sfShape_setFillColor(sfShape *shape, Color color);
void  sfShape_setOutlineColor(sfShape *shape, Color color);
void  sfShape_setOutlineThickness(sfShape *shape, float thickness);
sfTexture * sfShape_getTexture(sfShape *shape);
IntRect  sfShape_getTextureRect(sfShape *shape);
Color  sfShape_getFillColor(sfShape *shape);
Color  sfShape_getOutlineColor(sfShape *shape);
float  sfShape_getOutlineThickness(sfShape *shape);
uint  sfShape_getPointCount(sfShape *shape);
Vector2f  sfShape_getPoint(sfShape *shape, uint index);
FloatRect  sfShape_getLocalBounds(sfShape *shape);
FloatRect  sfShape_getGlobalBounds(sfShape *shape);
void  sfShape_update(sfShape *shape);
sfSprite * sfSprite_create();
sfSprite * sfSprite_copy(sfSprite *sprite);
void  sfSprite_destroy(sfSprite *sprite);
void  sfSprite_setPosition(sfSprite *sprite, Vector2f position);
void  sfSprite_setRotation(sfSprite *sprite, float angle);
void  sfSprite_setScale(sfSprite *sprite, Vector2f scale);
void  sfSprite_setOrigin(sfSprite *sprite, Vector2f origin);
Vector2f  sfSprite_getPosition(sfSprite *sprite);
float  sfSprite_getRotation(sfSprite *sprite);
Vector2f  sfSprite_getScale(sfSprite *sprite);
Vector2f  sfSprite_getOrigin(sfSprite *sprite);
void  sfSprite_move(sfSprite *sprite, Vector2f offset);
void  sfSprite_rotate(sfSprite *sprite, float angle);
void  sfSprite_scale(sfSprite *sprite, Vector2f factors);
Transform  sfSprite_getTransform(sfSprite *sprite);
Transform  sfSprite_getInverseTransform(sfSprite *sprite);
void  sfSprite_setTexture(sfSprite *sprite, sfTexture *texture, bool  resetRect);
void  sfSprite_setTextureRect(sfSprite *sprite, IntRect rectangle);
void  sfSprite_setColor(sfSprite *sprite, Color color);
sfTexture * sfSprite_getTexture(sfSprite *sprite);
IntRect  sfSprite_getTextureRect(sfSprite *sprite);
Color  sfSprite_getColor(sfSprite *sprite);
FloatRect  sfSprite_getLocalBounds(sfSprite *sprite);
FloatRect  sfSprite_getGlobalBounds(sfSprite *sprite);

sfText * sfText_create();
sfText * sfText_copy(sfText *text);
void  sfText_destroy(sfText *text);
void  sfText_setPosition(sfText *text, Vector2f position);
void  sfText_setRotation(sfText *text, float angle);
void  sfText_setScale(sfText *text, Vector2f scale);
void  sfText_setOrigin(sfText *text, Vector2f origin);
Vector2f  sfText_getPosition(sfText *text);
float  sfText_getRotation(sfText *text);
Vector2f  sfText_getScale(sfText *text);
Vector2f  sfText_getOrigin(sfText *text);
void  sfText_move(sfText *text, Vector2f offset);
void  sfText_rotate(sfText *text, float angle);
void  sfText_scale(sfText *text, Vector2f factors);
Transform  sfText_getTransform(sfText *text);
Transform  sfText_getInverseTransform(sfText *text);
void  sfText_setString(sfText *text, const (char) *string);
void  sfText_setUnicodeString(sfText *text, uint *string);
void  sfText_setFont(sfText *text, sfFont *font);
void  sfText_setCharacterSize(sfText *text, uint size);
void  sfText_setStyle(sfText *text, uint style);
void  sfText_setColor(sfText *text, Color color);
const (char) * sfText_getString(sfText *text);
uint * sfText_getUnicodeString(sfText *text);
sfFont * sfText_getFont(sfText *text);
uint  sfText_getCharacterSize(sfText *text);
uint  sfText_getStyle(sfText *text);
Color  sfText_getColor(sfText *text);
Vector2f  sfText_findCharacterPos(sfText *text, int index);
FloatRect  sfText_getLocalBounds(sfText *text);
FloatRect  sfText_getGlobalBounds(sfText *text);
sfTexture * sfTexture_create(uint width, uint height);
sfTexture * sfTexture_createFromFile(const (char) *filename, IntRect *area);
sfTexture * sfTexture_createFromMemory(void *data, int sizeInBytes, IntRect *area);
sfTexture * sfTexture_createFromStream(sfInputStream *stream, IntRect *area);
sfTexture * sfTexture_createFromImage(sfImage *image, IntRect *area);
sfTexture * sfTexture_copy(sfTexture *texture);
void  sfTexture_destroy(sfTexture *texture);
Vector2u  sfTexture_getSize(sfTexture *texture);
sfImage * sfTexture_copyToImage(sfTexture *texture);
void  sfTexture_updateFromPixels(sfTexture *texture, ubyte *pixels, uint width, uint height, uint x, uint y);
void  sfTexture_updateFromImage(sfTexture *texture, sfImage *image, uint x, uint y);
void  sfTexture_updateFromWindow(sfTexture *texture, sfWindow *window, uint x, uint y);
void  sfTexture_updateFromRenderWindow(sfTexture *texture, sfRenderWindow *renderWindow, uint x, uint y);
void  sfTexture_bind(sfTexture *texture);
void  sfTexture_setSmooth(sfTexture *texture, bool  smooth);
bool   sfTexture_isSmooth(sfTexture *texture);
void  sfTexture_setRepeated(sfTexture *texture, bool  repeated);
bool   sfTexture_isRepeated(sfTexture *texture);
uint  sfTexture_getMaximumSize();
sfTransformable * sfTransformable_create();
sfTransformable * sfTransformable_copy(sfTransformable *transformable);
void  sfTransformable_destroy(sfTransformable *transformable);
void  sfTransformable_setPosition(sfTransformable *transformable, Vector2f position);
void  sfTransformable_setRotation(sfTransformable *transformable, float angle);
void  sfTransformable_setScale(sfTransformable *transformable, Vector2f scale);
void  sfTransformable_setOrigin(sfTransformable *transformable, Vector2f origin);
Vector2f  sfTransformable_getPosition(sfTransformable *transformable);
float  sfTransformable_getRotation(sfTransformable *transformable);
Vector2f  sfTransformable_getScale(sfTransformable *transformable);
Vector2f  sfTransformable_getOrigin(sfTransformable *transformable);
void  sfTransformable_move(sfTransformable *transformable, Vector2f offset);
void  sfTransformable_rotate(sfTransformable *transformable, float angle);
void  sfTransformable_scale(sfTransformable *transformable, Vector2f factors);
Transform  sfTransformable_getTransform(sfTransformable *transformable);
Transform  sfTransformable_getInverseTransform(sfTransformable *transformable);
sfVertexArray * sfVertexArray_create();
sfVertexArray * sfVertexArray_copy(sfVertexArray *vertexArray);
void  sfVertexArray_destroy(sfVertexArray *vertexArray);
uint  sfVertexArray_getVertexCount(sfVertexArray *vertexArray);
Vertex * sfVertexArray_getVertex(sfVertexArray *vertexArray, uint index);
void  sfVertexArray_clear(sfVertexArray *vertexArray);
void  sfVertexArray_resize(sfVertexArray *vertexArray, uint vertexCount);
void  sfVertexArray_append(sfVertexArray *vertexArray, Vertex vertex);
void  sfVertexArray_setPrimitiveType(sfVertexArray *vertexArray, PrimitiveType type);
PrimitiveType  sfVertexArray_getPrimitiveType(sfVertexArray *vertexArray);
FloatRect  sfVertexArray_getBounds(sfVertexArray *vertexArray);
sfView * sfView_create();
sfView * sfView_createFromRect(FloatRect rectangle);
sfView * sfView_copy(sfView *view);
void  sfView_destroy(sfView *view);
void  sfView_setCenter(sfView *view, Vector2f center);
void  sfView_setSize(sfView *view, Vector2f size);
void  sfView_setRotation(sfView *view, float angle);
void  sfView_setViewport(sfView *view, FloatRect viewport);
void  sfView_reset(sfView *view, FloatRect rectangle);
Vector2f  sfView_getCenter(sfView *view);
Vector2f  sfView_getSize(sfView *view);
float  sfView_getRotation(sfView *view);
FloatRect  sfView_getViewport(sfView *view);
void  sfView_move(sfView *view, Vector2f offset);
void  sfView_rotate(sfView *view, float angle);
void  sfView_zoom(sfView *view, float factor);

version(sf_graphics)
sfRenderWindow* sfRenderWindow_create_aux(uint x,uint y, uint bitsPerPixel, const (char)* title, uint style, const(ContextSettings)* settings);

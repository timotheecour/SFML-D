module main;
import sf.graphics;


void main()
{	
	auto screen = new RenderWindow(VideoMode(800, 600), "Game", WindowStyle.Default, null);
	
	auto texture = new Texture("circle.png", null);

	Sprite spr;
	spr = new Sprite();
	spr.texture = texture;
	spr.position = Vector2f(100, 100);

	auto font = new Font("arial.ttf");
	auto text = new Text();
	text.font = font;
	text.string = "Hello world";
	text.color = Color.Blue;
	text.position = Vector2f(10,10);
	
	Event ev;
	
	while(screen.isOpen)
	{	
		while(screen.pollEvent(&ev))
		{
			if(ev.type == EventType.Closed)
				screen.close();
		}
							
		screen.clear(Color.Black);
		screen.draw(spr, null);
		screen.draw(text, null);			
		screen.display();
				
	}

}

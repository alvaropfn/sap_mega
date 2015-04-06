import controlP5.*;
ControlP5 cp5;

Writer writer;
ArduinoCOM arduino;
Displayer displayer;

void setup()
{
	size(800, 600);
	
	cp5 = new ControlP5(this);
	writer = new Writer(this);
	arduino = new ArduinoCOM(this);
	displayer = new Displayer(this, cp5, arduino);
	//arduino.tentarInstancia("avrdude: ser_open(): can't open device "/dev/ttyACM0": Permission denied");

}

void draw()
{
	background(234);
	pos();
}

void pos()
{
	fill(0);
	text("X: " + mouseX+", Y: "+ mouseY, mouseX, mouseY);
}


//os metodos acessados pelo listner devem ficar fora da classe
public void controlEvent(ControlEvent theEvent)
{
	//escolher qual metodo chamar baseado no nome do controlador que gerou o evento
	println(theEvent.getController().getName());
}

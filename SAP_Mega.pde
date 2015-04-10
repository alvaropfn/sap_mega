import controlP5.*;
ControlP5 cp5;

Writer writer;
ArduinoCOM arduinoCom;
Displayer displayer;

boolean b = false;

void setup()
{
	size(800, 600);
	
	cp5 = new ControlP5(this);


	writer = new Writer(this);
	arduinoCom = new ArduinoCOM(this);
	displayer = new Displayer(cp5, arduinoCom);
	displayer.encherDDL(arduinoCom.getListaPortas());
	//arduino.tentarInstancia("avrdude: ser_open(): can't open device "/dev/ttyACM0": Permission denied");

}

void draw()
{
	background(234);
	//pos();
}

void pos()
{
	fill(0);
	text("X: " + mouseX+", Y: "+ mouseY, mouseX, mouseY);
}


//os metodos acessados pelo listner devem ficar fora da classe
public void controlEvent(ControlEvent evento)
{
	//escolher qual metodo chamar baseado no nome do controlador que gerou o evento
	//println(theEvent.getController().getName());
	//if(!evento.isTab()) return;
	String s = evento.getController().getName();
	s += " id: " + evento.getController().getId();
	println(s);
	if(evento.isTab() && evento.getTab().getId() == 1)
	{
		Tab temp = evento.getTab();
		//println("tab: " + temp.getName() + " id: " + temp.getId());
		displayer.encherDDL(arduinoCom.getListaPortas());
	}
}

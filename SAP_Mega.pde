import controlP5.*;
ControlP5 cp5;

Writer escritor;
ArduinoCOM arduinoCom;
Displayer displayer;
ClockMaster relogio;
Configurator configurador;
int seg, nxt;
void setup()
{
	size(800, 600);
	
	cp5 = new ControlP5(this);


	escritor = new Writer(this);
	configurador = new Configurator(escritor);
	arduinoCom = new ArduinoCOM(this);
	displayer = new Displayer(cp5, arduinoCom);
	displayer.encherDDL(arduinoCom.getListaPortas());
	relogio = new ClockMaster();


	//arduino.tentarInstancia("avrdude: ser_open(): can't open device "/dev/ttyACM0": Permission denied");

}

void draw()
{
	background(234);

	if(arduinoCom.isConectado())
	{
		
		relogio.cicle();

	}
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
	/*
	if(evento.isTab() && evento.getTab().getId() == 1)
	{
		Tab temp = evento.getTab();
		//println("tab: " + temp.getName() + " id: " + temp.getId());
		displayer.encherDDL(arduinoCom.getListaPortas());
	}
	*/
	//hapens with tabs
	if(evento.isTab())
	{
		println("tab: " + evento.getName());
		int id = evento.getTab().getId();
		
		if(id == 0)
		{
			println("id: "+id);
		}

		if(id == 1)
		{
			println("id: "+id);
		}
	}

	//hapens with dropdownlist
	if(evento.isGroup())
	{
		println("grupo: " + evento.getName());

		if(evento.getId() == 30)
		{
			DropdownList temp = (DropdownList) evento.getGroup(); 
			int index = (int) evento.getGroup().getValue();
			String porta = temp.getItem(index).getText();
			arduinoCom.tentarInstancia(porta);
		}
	}

	//hapens with textfields, buttons and numberboxs
	if(evento.isController())
	{
		println("controlador: " + evento.getName());
	}

}

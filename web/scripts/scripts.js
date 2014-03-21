function eliminar(ele){
	var objeto=document.getElementById(ele);
	objeto.parentNode.removeChild(objeto);
}

function eliminarTo(ele){
	var objeto=document.getElementById(ele);
	objeto.innerHTML="GAME OVER";

}


function crearVentana(padre,nomVentana){
	var cadena;
	
	if(!document.getElementById(nomVentana)){
		cadena='<center><div id="'+nomVentana+'" onclick="eliminarTo(\'cen\')"></div></center>';//cen es el div del k kiero elimar todo
		document.getElementById(padre).innerHTML += cadena;
	}
} 
/*
function generaCPU(){
	var cadena;
	//document.write("tu puta madre");
	if(!document.getElementById("ddCpu")){
		cadena='<div id="ddCpu" onmouseout="eliminar(\'ddCpu\')"> aqui se abla de la cpu</div>';//cen es el div del k kiero elimar todo
		document.getElementById('dCpu').innerHTML += cadena;
	}
	if(document.getElementById("ddMem")){
		eliminar("ddMem");
	}
}

function generaMem(){
	var cadena;
	//document.write("tu puta madre");
	if(!document.getElementById("ddMem")){
		cadena='<div id="ddMem" onmouseout="eliminar(\'ddMem\')">';//cen es el div del k kiero elimar todo
		cadena+='<div id="dddRam" class="opcion">Ram</div>';
		cadena+='<div id="dddHD"class="opcion">Disco duro</div></div>';
		document.getElementById('dMem').innerHTML += cadena;
	}
	if(document.getElementById("ddCpu")){
		eliminar("ddCpu");
	}
}
*/

function eliminar(elemento){
	var obj;
	obj=document.getElementById(elemento);
	obj.parentNode.removeChild(obj);
}

function creaVentana(opcion){
	var cadena;
	
	switch(opcion){
		case 1: if(!document.getElementById("ventana1") && !document.getElementById("ventana2")){
					cadena='<div id="ventana1">';
					cadena+='<div id="x" onclick="eliminar(\'ventana1\')"></div>';
					cadena+='</div>';			
					document.getElementById("derecha").innerHTML += cadena;	
				}
				
				break;
		
		case 2: if(!document.getElementById("ventana2") && !document.getElementById("ventana1")){
					cadena='<div id="ventana2">';
					cadena+='<div id="x" onclick="eliminar(\'ventana2\')"></div>';
					cadena+='</div>';	
					document.getElementById("derecha").innerHTML += cadena;	
				}
				break;
	
	
	}
	
}

function irMenuIndex(n){
	
	switch(n){
		case 1: location.href='pages/cpu.html';
				break;
		case 2: location.href='pages/ram.html';
				break;	
		case 3: location.href='pages/graf.html';
				break;
		case 4: location.href='pages/pers.html';
				break;
	}
	
	

}

function irMenu(n){
	
	switch(n){
		case 0:  window.location='../coffeetronic.html';
				break;
		case 1: location.href='cpu.html';
				break;
		case 2: location.href='ram.html';
				break;	
		case 3: location.href='graf.html';
				break;
		case 4: location.href='pers.html';
				break;
	}

}


	var MAX_PARTICLES = 1200;
	var MAX_VELOCITY = 500;
	var PARTICLE_RADIUS = 6;
	var STAGE_WIDTH = 1024;
	var STAGE_HEIGHT = 768;
	var COLORS = ["#cc0000", "#ffcc00", "#aaff00", "#0099cc", "#194c99", "#661999"];
	var FRAME_TIMES = [];
	var MAX_FPS=100000000000000;
	var intervalo;
	var particles = [];



//variables de inicio:
var marcha=0; //control del temporizador
var cro=0; //estado inicial del cronómetro.
//cronometro en marcha. Empezar en 0:
	function init()
	{
		visor=document.getElementById("reloj"); //localizar pantalla del reloj
		if(!document.getElementById("dTestG")){
			 document.getElementById("dGrafico").innerHTML+='<div id="dTestG"></div>';
		}
		
	//Cronometro
	  if (marcha==0) { //solo si el cronómetro esta parado
            emp=new Date() //fecha actual
            elcrono=setInterval(tiempo,10); //función del temporizador.
            marcha=1 //indicamos que se ha puesto en marcha.
            }
	//Cronometro
		var location = window.location.href;
		
		// If shadows are turned on
		if (location.match(/shadows=true/))
		{
			document.body.className = "shadows";
		}
		
		// If max_particles is specified
		if (location.match(/particles=/))
		{
			var maxParticles = location.match(/particles=([^&]+)/)[1];
			maxParticles = parseInt(maxParticles);
			
			if (!isNaN(maxParticles))
			{
				MAX_PARTICLES = maxParticles;
			}
		}
		
		STAGE_WIDTH = document.body.offsetWidth;
		STAGE_HEIGHT = document.body.offsetHeight;
		
		// Create the particles
		for (var i = 0; i < MAX_PARTICLES; i++)
		{
			particles.push(new Particle());
		}
		
		
		// Start the animation
		intervalo=setInterval(animate, 1);
	
	}
	
	function animate()
	{
		// Limit the frame time array to the last 30 frames
		if (FRAME_TIMES.length > 30)
		{
			FRAME_TIMES.splice(0, 1);
		}
		
		var currTime = new Date().getTime();
		
		FRAME_TIMES.push(currTime);
		
		// Calculate the framerate based upon the difference between the absolute times of the oldest and newest frames, subdivided by how many frames were drawn inbetween
		var frameRate = document.getElementById("frameRate");
		var frameRateText = 1000 / ((currTime - FRAME_TIMES[0]) / (FRAME_TIMES.length - 1)) + "";
		frameRateText = frameRateText.replace(/(^[^.]+\...).*/, "$1");
		
		if(parseInt(frameRateText)<parseInt(MAX_FPS)){
			 MAX_FPS=frameRateText;
			MAX_FPS += " FPS";
			document.getElementById('dResul').innerHTML = MAX_FPS;//Los frames que se muestran
		}
		var timeDelta = currTime - FRAME_TIMES[FRAME_TIMES.length - 2];
		
		if (isNaN(timeDelta))
		{
			timeDelta = 0;
		}
		
		// Draw each particle
		for (var particle in particles)
		{
			particles[particle].draw(timeDelta);
		}
	}
	
	function Particle()
	{
		var angle = Math.PI * 2 * Math.random();
		var velocity = MAX_VELOCITY / 8 * 7 * Math.random() + MAX_VELOCITY / 8;
		var x = STAGE_WIDTH / 2 - PARTICLE_RADIUS;
		var y = STAGE_HEIGHT / 2 - PARTICLE_RADIUS;
		
		// Create visual element for the particle
		var domNode = document.createElement('span');
		domNode.id="dnodo";
		document.getElementById('dTestG').appendChild(domNode);
		//document.body.appendChild(domNode);
		
		// Set initial position to middle of screen
		domNode.style.left = x + "px";
		domNode.style.top = y + "px";
		
		// Set colour of element
		domNode.style.backgroundColor = COLORS[Math.floor(Math.random() * COLORS.length)];
		
		function draw(timeDelta)
		{
			// Calculate next position of particle
			var nextX = x + Math.cos(angle) * velocity * (timeDelta / 1000);
			var nextY = y + Math.sin(angle) * velocity * (timeDelta / 1000);
			
			// If particle is going to move off right side of screen
			if (nextX + PARTICLE_RADIUS * 2 > STAGE_WIDTH)
			{
				// If angle is between 3 o'clock and 6 o'clock
				if ((angle >= 0 && angle < Math.PI / 2))
				{
					angle = Math.PI - angle;
				}
				// If angle is between 12 o'clock and 3 o'clock
				else if (angle > Math.PI / 2 * 3)
				{
					angle = angle - (angle - Math.PI / 2 * 3) * 2
				}
			}
			
			// If particle is going to move off left side of screen
			if (nextX < 0)
			{
				// If angle is between 6 o'clock and 9 o'clock
				if ((angle > Math.PI / 2 && angle < Math.PI))
				{
					angle = Math.PI - angle;
				}
				// If angle is between 9 o'clock and 12 o'clock
				else if (angle > Math.PI && angle < Math.PI / 2 * 3)
				{
					angle = angle + (Math.PI / 2 * 3 - angle) * 2
				}
			}
			
			// If particle is going to move off bottom side of screen
			if (nextY + PARTICLE_RADIUS * 2 > STAGE_HEIGHT)
			{
				// If angle is between 3 o'clock and 9 o'clock
				if ((angle > 0 && angle < Math.PI))
				{
					angle = Math.PI * 2 - angle;
				}
			}
			
			// If particle is going to move off top side of screen
			if (nextY < 0)
			{
				// If angle is between 9 o'clock and 3 o'clock
				if ((angle > Math.PI && angle < Math.PI * 2))
				{
					angle = angle - (angle - Math.PI) * 2;
				}
			}
			
			domNode.style.left = nextX + "px";
			domNode.style.top = nextY + "px";
			
			x = nextX;
			y = nextY;
		}
		return {
			draw: draw
		}
	}
		 

window.onload = function() {
visor=document.getElementById("reloj"); //localizar pantalla del reloj

}
//variables de inicio:
var marcha=0; //control del temporizador
var cro=0; //estado inicial del cronómetro.
//cronometro en marcha. Empezar en 0:

function tiempo() { //función del temporizador
         actual=new Date() //fecha en el instante
         cro=actual-emp //tiempo transcurrido en milisegundos
         cr=new Date() //fecha donde guardamos el tiempo transcurrido
         cr.setTime(cro) 
         cs=cr.getMilliseconds() //milisegundos del cronómetro
         cs=cs/10; //paso a centésimas de segundo.
         cs=Math.round(cs)
         sg=cr.getSeconds(); //segundos del cronómetro
         mn=cr.getMinutes(); //minutos del cronómetro
         if (cs<10) {cs="0"+cs;}  //poner siempre 2 cifras en los números
         if (sg<10) {sg="0"+sg;} 
         if (mn<10) {mn="0"+mn;} 
         visor.innerHTML=mn+" : "+sg+" : "+cs; //pasar a pantalla.
		 
			if(sg==5)
			{
				 if (marcha==1) 
				 { //sólo si está en funcionamiento
					clearInterval(elcrono); //parar el crono
					marcha=0; //indicar que está parado.
					/*for(int i =0;i<MAX_PARTICLES;i++)
					{
						
						var objeto=document.getElementById("dnodo");
						objeto.parentNode.removeChild(objeto);
					}*/
					
				//document.getElementById('dGrafico').appendChild(domNode);
				
					//function eliminar(frameRate){
					var objeto=document.getElementById("dTestG");
					objeto.parentNode.removeChild(objeto);
				
					clearInterval(intervalo);
				}		
			}
         }
	 



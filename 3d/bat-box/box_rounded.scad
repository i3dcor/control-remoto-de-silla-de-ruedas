tolerancia=2;
grosor=2;
tapa_bote_altura=2;
// base_radio=28.5/2;
// boca_radio=37/2;
// vaso_altura=42-tapa_bote_altura;

//medidas vaso
base_radio=2.7/2; 
boca_radio=3.5/2;
vaso_altura=45-tapa_bote_altura;

cubo_ancho_x=95;
cubo_ancho_y=68+12+6;
altura_letras=1;
ancho_hueco_largo=0;//sobres
ancho_hueco_corto=0;//otras_pastillas
altura_bisagra=20;
ancho_bisagra=7/2;
hueco_bisagra=3;
veces_dia=1;
dia_semana=1;
semana=["Lunes","Martes","Miercoles","Jueves","Viernes","Sabado","Domingo"];
ancho_caja=ancho_hueco_largo+cubo_ancho_x*veces_dia+grosor*2+altura_letras;
largo_caja=ancho_hueco_corto+cubo_ancho_y*dia_semana+grosor*2+altura_letras;
echo("ancho:",ancho_caja);
echo("largo: ",largo_caja);
//TODO hueco para folio con instrucciones
//TODO letras de veces_dia

// aumentar resolucion de circulos
$fn=72;

//TODO biselado de esquinas
//TODO ajustar espacio para tapas de botes

//TODO areglar medidas bisagra si no son proporcionales alto y ancho
//TODO opcion de cierre grueso o fino
sobre_prescripcion_altura=2;
tapa_altura=grosor+sobre_prescripcion_altura+tapa_bote_altura;

//TODO manilla
manilla_grosor=10;
manilla_ancho=100;
manilla_alto=30;

//TODO cierre
cierre_ancho=3;
cierre_alto=5;
cierre_largo=20;

// translate([ancho_bisagra,0,-vaso_altura-grosor+altura_bisagra/2]) 
	// base();
// rotate([0,180,0])
	// tapa();

module tapa(){
union(){
	translate([altura_bisagra/2,0,ancho_bisagra])
	{
		difference(){
			cube([ancho_caja,largo_caja, tapa_altura]);
			translate([grosor,grosor,0])
				cube([ancho_caja-grosor*2,largo_caja-grosor*2, tapa_altura-grosor]);  				
		}
		//cierre tapa grueso
		translate([ancho_caja+grosor+tolerancia,largo_caja/2-cierre_largo/2, -cierre_alto])
			rotate([0,0,90])
			difference()
			{
				translate([-cierre_alto/2,-cierre_ancho,-cierre_alto])
					prism(cierre_largo+cierre_alto,cierre_ancho*2,tapa_altura+cierre_alto*2);
					//cube([cierre_largo+cierre_alto,cierre_ancho,tapa_altura+cierre_alto*2]);
				translate([0,-cierre_ancho,0])
					cube([cierre_largo,cierre_ancho*2,cierre_alto]);
				translate([-cierre_alto/2,0,-cierre_alto])
					prism(cierre_largo+cierre_alto,cierre_ancho,cierre_alto);
			}
		//cierre tapa fino
		// translate([ancho_caja+grosor+tolerancia,largo_caja/2-cierre_largo/2, -cierre_alto])
			// rotate([0,0,90])
			// difference()
			// {
				// translate([-cierre_alto/2,0,-cierre_alto])
					// prism(cierre_largo+cierre_alto,cierre_ancho,tapa_altura+cierre_alto*2);
					// //cube([cierre_largo+cierre_alto,cierre_ancho,tapa_altura+cierre_alto*2]);
				// //translate([0,-cierre_ancho,0])
					// cube([cierre_largo,cierre_ancho,cierre_alto]);
				// translate([-cierre_alto/2,0,-cierre_alto])
					// prism(cierre_largo+cierre_alto,cierre_ancho,cierre_alto);
			// }
	}
	translate([altura_bisagra/2,0,0])
		rotate([0,270,0]){
			translate([0,ancho_bisagra+tolerancia/2,0])
			{ 	
				translate([ancho_bisagra+tapa_altura,0,0])
					rotate([0,0,90])
						prism(ancho_bisagra,tapa_altura,altura_bisagra);
				bisagra(hueco_bisagra,ancho_bisagra,ancho_bisagra,altura_bisagra);
			}
			translate([0,largo_caja-2*ancho_bisagra-tolerancia/2,0]) 
			{ 	
				translate([ancho_bisagra+tapa_altura,0,0])
					rotate([0,0,90])
						prism(ancho_bisagra,tapa_altura,altura_bisagra);
				bisagra(hueco_bisagra,ancho_bisagra,ancho_bisagra,altura_bisagra);
			}
		}
}
}
module base(){
//Base menos manilla
//difference()
{
union(){
//cierre
// translate([ancho_caja+grosor+tolerancia,largo_caja/2-cierre_largo/2, vaso_altura+grosor-cierre_alto])
	// rotate([0,0,90])
		// prism(cierre_largo,cierre_ancho,cierre_alto);

		
//letras dia de semana
// for(v=[0:dia_semana-1])
// translate([altura_letras-grosor,altura_letras+cubo_ancho_y/2+cubo_ancho_y*v,vaso_altura]) 
// rotate([0,0,90])
		// linear_extrude(height=3) 
			// text(semana[v],size=5,halign ="center");

// bisagra 
// translate([-ancho_bisagra,0,vaso_altura+grosor-altura_bisagra]) 
	// bisagra(hueco_bisagra,ancho_bisagra,ancho_bisagra,altura_bisagra);
// translate([-ancho_bisagra,2*ancho_bisagra+tolerancia,vaso_altura+grosor-altura_bisagra]) 
	// bisagra(hueco_bisagra,ancho_bisagra,ancho_bisagra,altura_bisagra);
// translate([-ancho_bisagra,largo_caja-ancho_bisagra,vaso_altura+grosor-altura_bisagra]) 
	// bisagra(hueco_bisagra,ancho_bisagra,ancho_bisagra,altura_bisagra);
// translate([-ancho_bisagra,largo_caja-3*ancho_bisagra-tolerancia,vaso_altura+grosor-altura_bisagra]) 
	// bisagra(hueco_bisagra,ancho_bisagra,ancho_bisagra,altura_bisagra);

//espacio para sobres
translate([cubo_ancho_x*veces_dia+altura_letras,0,0]) 
	difference(){
		cube([ancho_hueco_largo+grosor*2,altura_letras+cubo_ancho_y*dia_semana+grosor+ancho_hueco_corto+grosor, vaso_altura+grosor], center = false);  
		translate([grosor,altura_letras,grosor]) 
			cube([ancho_hueco_largo-grosor*2,cubo_ancho_y*dia_semana+grosor+ancho_hueco_corto, vaso_altura], center = false);  
	}
// espacio para otras pastillas
translate([0,cubo_ancho_y*dia_semana+altura_letras,0]) 
	difference(){
		cube([cubo_ancho_x*veces_dia+altura_letras+grosor, ancho_hueco_corto+grosor*2, vaso_altura+grosor]);  
		translate([altura_letras,grosor,grosor]) 
			cube([cubo_ancho_x*veces_dia, ancho_hueco_corto, vaso_altura]);  
	}

//espacio para nombres de veces_dia de semana
//translate([-cubo_ancho_x/2-altura_letras,-cubo_ancho_y/2-altura_letras,0]) 
    cube([cubo_ancho_x*veces_dia+altura_letras, altura_letras, vaso_altura+grosor]);  
//espacio para nº de veces al día
//translate([-cubo_ancho_x/2-altura_letras,-cubo_ancho_y/2,0]) 
    cube([altura_letras, cubo_ancho_y*dia_semana+altura_letras, vaso_altura+grosor]);  

translate([cubo_ancho_x/2+altura_letras,cubo_ancho_y/2+altura_letras,0]) 
for(d=[0:veces_dia-1])
    for(v=[0:dia_semana-1])
        translate([cubo_ancho_x*d,cubo_ancho_y*v,0]) 
union(){
//plano base
    translate([0,0,grosor/2]) 
        cube([cubo_ancho_x, cubo_ancho_y, grosor], center = true);  
// difference(){
    // translate([0,0,vaso_altura-grosor/2]) 
        // cube([cubo_ancho_x, cubo_ancho_y, grosor], center = true);  
    // cylinder(r1=base_radio, r2=boca_radio, h=vaso_altura);
// }
// difference(){
    // cylinder(r1=base_radio+grosor/2, r2=boca_radio+grosor/2, h=vaso_altura);
    // cylinder(r1=base_radio, r2=boca_radio, h=vaso_altura);
// }
}
}
// //manilla
// translate([ancho_caja,largo_caja/2-manilla_ancho/2, vaso_altura/2])
	// union(){
		// cube([manilla_alto,manilla_grosor,manilla_grosor]);
		// translate([0,manilla_ancho-manilla_grosor,0])
			// cube([manilla_alto,manilla_grosor,manilla_grosor]);
		// translate([manilla_alto,0,manilla_grosor/2])
			// rotate([-90,0,0])
				// cylinder(r=manilla_grosor/2, h=manilla_ancho);
	// }
}
}
module bisagra(radius=1,hookwidth=10,hooklong=20,hookheight=30){
    
	difference(){
		union(){
			cube([hookwidth, hooklong,hookheight]);  
			translate([0,0,hookheight/2])
				rotate([-90,0,0]) 
					cylinder(r=hookheight/2, h=hooklong);
		}
			translate([0,0,hookheight/2])
				rotate([-90,0,0]) 
					cylinder(r=radius, h=hooklong);
		
	}
}
 module prism(l, w, h){
       polyhedron(
               points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
               faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
               );
}




$fn = 100;
wallThickness = 1.6;
width = ancho_caja+wallThickness*2;
depth = largo_caja+wallThickness*2;
// height = 15;
height = 55/2+wallThickness;
hingeOuter = 7;
hingeInner = 3;
hingeInnerSlop = 0.6; //aumentar si se pegan entre si las bisagras
hingeFingerSlop = 0.5;//aumentar si se pegan entre si las bisagras
fingerLength = hingeOuter/1.65;
fingerSize = 6.8;
topFingerSize = fingerSize;
latchWidth = 15;
//JFK minkowski
minkowski_height=wallThickness;
minkowski_width=wallThickness*2;

difference(){
	union(){
		translate([-fingerLength+ancho_bisagra,depth/2,-4.5]){
			bottom();
			top();
			// translate([0,-depth/2+latchWidth,0])
			{
				topLatch();
				latch();
				bottomLatch();
			}
			// translate([0,depth/2-latchWidth,0]){
				// topLatch();
				// latch();
				// bottomLatch();
			// }
		}
		// translate([ancho_bisagra,0,-vaso_altura-grosor+altura_bisagra/2]) 
			// base();
	}
	//hueco conector bateria
	conector_bateria=[wallThickness+minkowski_width,12,20];
	translate([ancho_caja+ancho_bisagra-0.1,wallThickness, -4.5+wallThickness*2])
		cube(conector_bateria);
	//hueco tornillo conector
	tornillo_radio=3/2;
	translate([ancho_caja+ancho_bisagra-4.1,-wallThickness, -4.5+wallThickness*2+22.5])
		rotate([-90,0,0])
			cylinder(r=tornillo_radio, h=wallThickness+minkowski_width);
	//hueco interruptor
	interruptor_radio=5/2;
	translate([ancho_caja+ancho_bisagra-0.1,largo_caja+wallThickness-5, -4.5+height/2])
		rotate([0,90,0])
			cylinder(r=interruptor_radio, h=wallThickness+minkowski_width);
	//manilla
	// translate([ancho_bisagra-4,0,-vaso_altura-grosor+altura_bisagra/2]) 
	// translate([ancho_caja,largo_caja/2-manilla_ancho/2, vaso_altura/2])
		// union(){
			// cube([manilla_alto,manilla_grosor,manilla_grosor]);
			// translate([0,manilla_ancho-manilla_grosor,0])
				// cube([manilla_alto,manilla_grosor,manilla_grosor]);
			// translate([manilla_alto,0,manilla_grosor/2])
				// rotate([-90,0,0])
					// cylinder(r=manilla_grosor/2, h=manilla_ancho);
		// }
}

// //manilla
// translate([ancho_bisagra*2,0,-vaso_altura-grosor+altura_bisagra/2]) 
// translate([ancho_caja,largo_caja/2-manilla_ancho/2, vaso_altura/2])
	// union(){
		// cube([manilla_alto,manilla_grosor-tolerancia/2,manilla_grosor-tolerancia/2]);
		// translate([0,manilla_ancho-manilla_grosor+tolerancia/4,0])
			// cube([manilla_alto,manilla_grosor-tolerancia/2,manilla_grosor-tolerancia/2]);
		// translate([manilla_alto,0,manilla_grosor/2])
			// rotate([-90,0,0])
				// cylinder(r=manilla_grosor/2, h=manilla_ancho-tolerancia/2);
	// }


module bottom() {
	union() {
		// main box and cutout
		difference() {
			translate([minkowski_width/2-width - fingerLength, -depth/2, 0]) {
				minkowski(){
					// cylinder(d=2,h=0.1);
					cylinder(h=minkowski_height,d2=minkowski_width,d1=0);
					cube([width-minkowski_width,depth,height-minkowski_height]);
				}
			}
			translate([(-width - fingerLength) + wallThickness*2/2, -depth/2 + wallThickness*2/2-minkowski_width/2, height-wallThickness-minkowski_height]) 
			// translate([wallThickness*3/2, wallThickness*3/2-minkowski_width/2, height-wallThickness*8]) 
				cube([width- (wallThickness * 2) , depth - (wallThickness * 2)+minkowski_width, height+wallThickness]);
			translate([(-width - fingerLength) + wallThickness*2, -depth/2 + wallThickness*2-minkowski_width/2, wallThickness+minkowski_height]) {
				cube([width - (wallThickness * 4), depth - (wallThickness * 4)+minkowski_width, height]);
			}			
		}

		//latch();

		difference() {
			hull() {
				translate([0,-depth/2,height]) {
					rotate([-90,0,0]) {
						cylinder(r = hingeOuter/2, h = depth);
					}
				}
				translate([-fingerLength - .1, -depth/2,height - hingeOuter]){
					cube([.1,depth,hingeOuter]);
				}
				translate([-fingerLength, -depth/2,height-.1]){
					cube([fingerLength,depth,.1]);
				}
				translate([0, -depth/2,height]){
					rotate([0,45,0]) {
						cube([hingeOuter/2,depth,.01]);
					}
				}
			}
			// finger cutouts

			for  (i = [-depth/2 + fingerSize:fingerSize*2:depth/2]) {
				translate([-fingerLength,i - (fingerSize/2) - (hingeFingerSlop/2),0]) {
					cube([fingerLength*2,fingerSize + hingeFingerSlop,height*2]);
				}
			}
		//}

		// // center rod
		// translate([0, -depth/2, height]) {
			// rotate([-90,0,0]) {
				// cylinder(r = hingeInner /2, h = depth);
			// }
		// }
		}
	}
		// center rod
		translate([0, -depth/2, height]) {
		// translate([0, -depth/2, 0]) {
			rotate([-90,0,0]) {
				cylinder(r = hingeInner /2, h = depth);
			}
		}
}
module latch(){
		// new latch
		difference() {
			hull() {
					translate([-(fingerLength*2) - width,-latchWidth,height-2.25]) {
						rotate([-90,0,0]) {
							cylinder(r = hingeOuter/2, h = latchWidth*2);
						}
					}
					translate([-width - fingerLength, -latchWidth, height-hingeOuter-2.25]) {
						cube([.1, latchWidth * 2, hingeOuter]);
					}
					translate([-(fingerLength*2) -width, -latchWidth,height-2.25]){
							cube([fingerLength,latchWidth * 2,.1]);
						}
						translate([-(fingerLength*2) -width, -latchWidth,height-2.25]){
							rotate([0,-20,0]) {
								cube([hingeOuter-wallThickness,latchWidth*2,.01]);
							}
						}
				}
			translate([-(fingerLength*3) - width, -(latchWidth/2) - hingeFingerSlop,0]) {
					cube([fingerLength*3, latchWidth + hingeFingerSlop * 2,height*2]);
			}
		}
		// latch rod
		translate([-(fingerLength*2) -width, -latchWidth/2 - hingeFingerSlop, height-2.25]) {
			rotate([-90,0,0]) {
				cylinder(r = hingeInner /2, h = latchWidth + (hingeFingerSlop*2));
			}
		}
}
module top() {
	union() {
		difference() {
			translate([fingerLength, -depth/2, 0]) {
				translate([minkowski_width/2,0, 0]) 
					minkowski(){
						cylinder(h=0.00001,d2=minkowski_width,d1=0);
						cube([width-minkowski_width,depth,height - .5]);
					}
				translate([wallThickness*3/2, wallThickness*3/2-minkowski_width/2, 0]) 
					cube([width - (wallThickness * 3), depth - (wallThickness * 3)+minkowski_width, height+wallThickness]);
				// translate([wallThickness*2/2, wallThickness*2/2-minkowski_width/2, 0]) 
					// cube([width - (wallThickness * 2), depth - (wallThickness * 2)+minkowski_width, height+wallThickness]);
			}
	
			translate([fingerLength + wallThickness*2, -depth/2 + wallThickness*2-minkowski_width/2, wallThickness+minkowski_height]) {
				cube([width - (wallThickness * 4), depth - (wallThickness * 4)+minkowski_width, height+wallThickness]);
			}
			// translate([fingerLength + wallThickness*3/2, -depth/2 + wallThickness*3/2-minkowski_width/2, wallThickness+minkowski_height]) {
				// cube([width - (wallThickness * 3), depth - (wallThickness * 3)+minkowski_width, height+wallThickness]);
			// }
			//conector hueco
			translate([fingerLength + wallThickness*2, -depth/2 + wallThickness*2-minkowski_width/2, wallThickness+minkowski_height]) {
				cube([width - (wallThickness * 4), depth - (wallThickness * 4)+minkowski_width, height+wallThickness]);
			}
			
		}

		//topLatch();
		difference() {
			hull() {
				translate([0,-depth/2,height]) {
					rotate([-90,0,0]) {
						cylinder(r = hingeOuter/2, h = depth);
					}
				}
				translate([fingerLength, -depth/2,height - hingeOuter - .5]){
					cube([.1,depth,hingeOuter - .5]);
				}
				translate([-fingerLength/2, -depth/2,height-.1]){
					cube([fingerLength,depth,.1]);
				}
				translate([0, -depth/2,height]){
					rotate([0,45,0]) {
						cube([hingeOuter/2,depth,.01]);
					}
				}
			}
			// finger cutouts
			for  (i = [-depth/2:fingerSize*2:depth/2 + fingerSize]) {
				translate([-fingerLength,i - (fingerSize/2) - (hingeFingerSlop/2),0]) {
					cube([fingerLength*2,fingerSize + hingeFingerSlop,height*2]);
				}
				if (depth/2 - i < (fingerSize * 1.5)) {
					translate([-fingerLength,i - (fingerSize/2) - (hingeFingerSlop/2),0]) {
						cube([fingerLength*2,depth,height*2]);
					}
				}
			}

			// center cutout
			translate([0, -depth/2, height]) {
				rotate([-90,0,0]) {
					cylinder(r = hingeInner /2 + hingeInnerSlop, h = depth);
				}
			}
		}
	}
}
module topLatch(height=15){
		// new latch
		difference() {
			hull() {
					translate([(fingerLength*2) + width,-latchWidth,height/2]) {
						rotate([-90,0,0]) {
							cylinder(r = hingeOuter/2, h = latchWidth*2);
						}
					}
					translate([width + fingerLength, -latchWidth, 0]) {
						cube([.1, latchWidth * 2, hingeOuter]);
					}
					translate([fingerLength + width, -latchWidth,height/2]){
						cube([fingerLength,latchWidth * 2,.1]);
					}
					translate([fingerLength + width, -latchWidth,(height/2) + (hingeOuter/1.5)]){
						rotate([0,45,0]) {
							cube([hingeOuter,latchWidth*2,.01]);
						}
					}
			}
			translate([fingerLength + width, -(latchWidth/2) - hingeFingerSlop,0]) {
					cube([fingerLength*2, latchWidth + (hingeFingerSlop * 2),height*2]);
			}
		}
		// latch rod
		translate([(fingerLength*2) + width, -latchWidth/2 - hingeFingerSlop, height/2]) {
			rotate([-90,0,0]) {
				cylinder(r = hingeInner /2, h = latchWidth + (hingeFingerSlop*2));
			}
		}

}
module bottomLatch() {
	difference() {
		union() {
			hull() {
				translate([-(fingerLength *2) - width,-latchWidth/2,height-2.25]) {
					rotate([-90,0,0]) {
						cylinder( r = hingeOuter /2, h = latchWidth);
					}
				}
				translate([-fingerLength*2 - width,-latchWidth/2,height-hingeOuter-2.25]) {
					rotate([0,20,0]) {
						cube([.1,latchWidth,hingeOuter]);
					}
				}
				
			}
			translate([-fingerLength*2 - width -2.6 + hingeOuter/2 - wallThickness,-latchWidth/2,0]) {
				cube([2.5,latchWidth,height-4.5]);
			}
			// latch foot
			translate([-fingerLength*3 - width - 2.6,-latchWidth/2,0]) {
				cube([hingeOuter/2 + fingerLength,latchWidth,wallThickness]);
			}
			// latch cylinder catch
			translate([-fingerLength*3 - width + 1 - 2.6,-latchWidth/2,wallThickness]) {
				rotate([-90,0,0]) {
					cylinder(r = 1, h = latchWidth);
				}
			}
		}
		translate([-(fingerLength *2) - width,-latchWidth/2 - .1,height-2.25]) {
			rotate([-90,0,0]) {
				cylinder( r = hingeInner /2 + hingeInnerSlop, h = latchWidth + .2);
			}
		}
	}
}
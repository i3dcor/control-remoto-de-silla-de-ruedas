$fn=40;
pared=1.6;
radio_tornillo=3.7/2;
ancho=17.5;
largo=143+pared*2;
alto=14/2;
ancho_movil=70.5+pared*4+2.5;
ancho_borde=15/2;
ancho_base_movil_izquierda=12;
ancho_base_movil_derecha=12;
grosor_movil=8;
ancho_brida=5.2;
// grosor_brida=ancho_brida/2;
grosor_brida=1.6;
base_grosor=pared+grosor_brida+pared;

module base_movil(ancho_base_movil=12, radio_base=12,offset=0){
	difference(){
		cube([ancho_base_movil,pared*2,base_grosor+grosor_movil], center=true);
		translate([offset,radio_base+pared/2,(base_grosor)/2])
			rotate([0,90,0])
				cylinder(h=ancho_base_movil,r=radio_base, center=true);
	}
}
rotate([0,90,0])
{
	difference(){
		cube([ancho_movil,largo,base_grosor],center=true);
		translate([0,largo/2-ancho_borde,-pared/2])
				cube([ancho_movil,ancho_brida,grosor_brida], center=true);
		translate([0,-largo/2+ancho_borde,-pared/2])
				cube([ancho_movil,ancho_brida,grosor_brida], center=true);
	}
	translate([-ancho_movil/2+ancho_base_movil_izquierda/2,-largo/2+pared,grosor_movil/2])
			// cube([ancho_base_movil_izquierda,pared*2,base_grosor+grosor_movil], center=true);
			base_movil(ancho_base_movil_izquierda,4,1.8);
	translate([ancho_movil/2-ancho_base_movil_derecha/2,-largo/2+pared,grosor_movil/2])
			// cube([ancho_base_movil_derecha,pared*2,base_grosor+grosor_movil], center=true);
			base_movil(ancho_base_movil_derecha,4,-1.8);
	// translate([0,-largo/2+pared,grosor_movil/2])
		// difference(){
			// cube([ancho_movil,pared,base_grosor+grosor_movil], center=true);
			// translate([0,ancho_movil/2+pared/2,(base_grosor)/2])
				// rotate([0,0,0])
					// cylinder(h=ancho_movil,r=11, center=true);
		// }
	translate([0,-largo/2+pared,grosor_movil/2])
		rotate([90,0,90])
			difference(){
				cube([pared,base_grosor+grosor_movil,ancho_movil], center=true);
				translate([0,36,0])
					rotate([0,90,0])
						cylinder(h=pared*2,r=39, center=true);
			}
			// base_movil(pared*2,4);
	translate([0,largo/2+pared,grosor_movil/2])
			// cube([ancho_movil,pared*2,base_grosor+grosor_movil], center=true);
		rotate([180,180,0])
			base_movil(ancho_movil,4,1.8);
	translate([ancho_movil/2-pared,pared,grosor_movil/2])
		rotate([180,180,-90])
			base_movil(ancho_base_movil_derecha,4);
	translate([-ancho_movil/2+pared,pared,grosor_movil/2])
		rotate([180,180,90])
			base_movil(ancho_base_movil_derecha,4);
	translate([0,0,-alto-(base_grosor)/2])
		difference(){
			union()
			{
				translate([0,0,alto/2])
					cube([ancho,(radio_tornillo+pared)*2,alto],center=true);
				rotate([0,90,0])
					cylinder(h=ancho,r=radio_tornillo+pared, center=true);
			}
			rotate([0,90,0])
				cylinder(h=ancho,r=radio_tornillo, center=true);
		}
}
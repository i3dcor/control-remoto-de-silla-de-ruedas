$fn=40;
pared=2;
radio_tornillo=3.7/2;
ancho=17.5;
largo=144;
alto=12;
ancho_borde=15/2;
grosor_movil=10.5;
ancho_brida=5;
grosor_brida=ancho_brida/2;
rotate([0,90,0])
{
	difference(){
		cube([ancho,largo,alto],center=true);
		translate([0,0,-1])
			rotate([0,90,0])
				cylinder(h=ancho,r=radio_tornillo, center=true);
		translate([0,largo/2-ancho_borde,0])
				// rotate([0,90,0])
					// cylinder(h=ancho,r=radio_tornillo, center=true);
					cube([ancho,ancho_brida,grosor_brida], center=true);
		translate([0,-largo/2+ancho_borde,0])
				// rotate([0,90,0])
					// cylinder(h=ancho,r=radio_tornillo, center=true);
					cube([ancho,ancho_brida,grosor_brida], center=true);
	}
	translate([0,-largo/2-pared,grosor_movil/2])
		// rotate([0,90,0])
			// cylinder(h=ancho,r=radio_tornillo, center=true);
			cube([ancho,pared*2,alto+grosor_movil], center=true);
	translate([0,largo/2+pared,grosor_movil/2])
		// rotate([0,90,0])
			// cylinder(h=ancho,r=radio_tornillo, center=true);
			cube([ancho,pared*2,alto+grosor_movil], center=true);
}
$fn=30;
//!OpenSCAD


module abrazadera(pared, radio1, extension, diametro_tornillo, diametro_tuerca, largo) {
  radio_tornillo = diametro_tornillo / 2;
  solapa_tuerca = diametro_tuerca * 2 + pared * 2;
  difference() {
    union(){
      cylinder(r1=(radio1 + pared), r2=(radio1 + pared), h=largo, center=false);
      translate([((radio1 + pared) * -1), 0, 0]){
        cube([((radio1 + pared) * 2), radio1, largo], center=false);
      }
      translate([(solapa_tuerca * -1 - radio1), (extension - pared * 2), 0]){
		solapa();
	  }
      translate([radio1, (extension - pared * 2), 0]){
		solapa();
      }
    }

    cylinder(r1=radio1, r2=radio1, h=largo, center=false);
    translate([(radio1 * -1), 0, 0]){
      cube([(radio1 * 2), (radio1 + pared), largo], center=false);
    }
  }

	translate([0, (extension )+pared*6, 0])
		rotate([0,0,180])
		{
			translate([(solapa_tuerca * -1 - radio1), 0, 0]){
				solapa();
			}
			translate([radio1, 0, 0]){
				solapa();
			}
			translate([-radio1, 0, 0]){
				// //opcion 1 sin hueco tornillo central
				cube([radio1  * 2, pared*2, largo], center=false);
				// //opcion 2a con hueco tuerca central
				// solapa2(radio1*2,0, 11.1/2);
				// //opcion 2b con hueco tuerca girado y tornillo central
				// rotate([0,0,180])
					// solapa2(radio1*2,4.8/2, 11.1/2);
				// //opcion 2c con tornillo central y sin hueco tuerca
				// rotate([0,0,180])
					// solapa2(radio1*2,4.8/2, 0);
			}
		}
	// //opcion 2a con hueco tuerca central
	translate([0, (extension )+pared*12, 0])
		rotate([0,0,180])
		{
			translate([(solapa_tuerca * -1 - radio1), 0, 0]){
				solapa();
			}
			translate([radio1, 0, 0]){
				solapa();
			}
			translate([-radio1, 0, 0])
				solapa2(radio1*2,0, 11.1/2);
		}
	//opcion 2b con hueco tuerca girado y tornillo central
	translate([0, (extension )+pared*18, 0])
		rotate([0,0,180])
		{
			translate([(solapa_tuerca * -1 - radio1), 0, 0]){
				solapa();
			}
			translate([radio1, 0, 0]){
				solapa();
			}
			translate([radio1, pared*2, 0])
				rotate([0,0,180])
					solapa2(radio1*2,4.8/2, 11.1/2);
		}
	//opcion 2c con tornillo central y sin hueco tuerca
	translate([0, (extension )+pared*24, 0])
		rotate([0,0,180])
		{
			translate([(solapa_tuerca * -1 - radio1), 0, 0])
				solapa();
			translate([radio1, 0, 0])
				solapa();
			translate([radio1, pared*2, 0])
				rotate([0,0,180])
					solapa2(radio1*2,4.8/2, 0);
		}
	module solapa() {
		solapa2(solapa_tuerca,diametro_tornillo / 2,diametro_tuerca/2);
	}
	module solapa2(ancho,radio_tornillo,radio_tuerca) {
        difference() {
          cube([ancho, (pared * 2), largo], center=false);

          translate([(ancho / 2), 0, (largo / 2)]){
            rotate([270, 0, 0]){
              cylinder(r1=radio_tornillo, r2=radio_tornillo, h=(pared * 2), center=false);
            }
          }
          translate([(ancho / 2), 0, (largo / 2)]){
            rotate([270, 90, 0]){
              // $fn=6
              cylinder(r1=radio_tuerca, r2=radio_tuerca, h=pared, center=false,$fn=6);
            }
          }
        }

	}
}

// eje corto
// abrazadera(2, 12.5/2, 12.5/2, 2.2, 6.1, 25);

// eje largo
abrazadera(2, 20/2, 20/2, 2.2, 6.1, 25);
// abrazadera(2, 20/2, 20/2, 4.8, 11.1, 25);

//1 + pared;

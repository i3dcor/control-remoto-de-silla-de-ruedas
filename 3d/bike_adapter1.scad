//!OpenSCAD
$fn=60;
module tornillo() {
  union(){
    rotate([0, 90, 0]){
      cylinder(r1=radio_hueco_tornillo2, r2=radio_hueco_tornillo2, h=radio1, center=false);
    }
    translate([radio1, 0, 0]){
      rotate([0, 270, 0]){
        // $fn=6;
        cylinder(r1=radio_tuerca, r2=radio_tuerca, h=grosor_tuerca, center=false);
      }
    }
    translate([radio_eje2, 0, 0]){
      rotate([0, 90, 0]){
        // $fn=6;
        cylinder(r1=radio_tuerca, r2=radio_tuerca, h=grosor_tuerca, center=false,$fn=6);
      }
    }
  }
}

module cilindro_aplanado() {
  difference() {
    cylinder(r1=radio_eje1, r2=radio_eje1, h=largo_eje, center=false);

    translate([(radio_eje2 * 1), (radio_eje1 * -1), 0]){
      cube([radio_eje2, (radio_eje1 * 2), largo_eje], center=false);
    }
    translate([(radio_eje2 * -2), (radio_eje1 * -1), 0]){
      cube([radio_eje2, (radio_eje1 * 2), largo_eje], center=false);
    }
  }
}

distancia_tornillos = 40;
radio1 = 25.2;
radio2 = 15.4;
radio_hueco_tornillo = 2.5;
radio_hueco_tornillo2 = 2.5;
radio_tuerca = 4.6;
grosor_tuerca = 4.4;
grosor1 = 8;
grosor2 = 12;
largo_eje = 26;
radio_eje1 = 8.6;
radio_eje2 = 6.1;
difference() {
  union(){
    cylinder(r1=radio1, r2=radio1, h=grosor2, center=false);
    translate([0, 0, grosor2]){
      cylinder(r1=radio2, r2=radio2, h=grosor1, center=false);
    }
  }

  union(){
    cilindro_aplanado();
    translate([0, (distancia_tornillos / 2), 0]){
      cylinder(r1=radio_hueco_tornillo, r2=radio_hueco_tornillo, h=grosor2, center=false);
    }
    translate([0, (distancia_tornillos / -2), 0]){
      cylinder(r1=radio_hueco_tornillo, r2=radio_hueco_tornillo, h=grosor2, center=false);
    }
    translate([0, 0, (grosor2 / 2)]){
      tornillo();
    }
    translate([0, 0, (grosor2 + grosor1 / 2)]){
      tornillo();
    }
  }
}
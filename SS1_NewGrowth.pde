// New Growth by Paola Ayala
float grow = 1.0;


background(0, 181, 226);
size(1080, 720);


//Mountainside background
fill(100, 205, 50);
triangle(1075, 718, 1075, 200, 0, 718);

//Snow top of the mountain
strokeWeight(3);
fill(255);
triangle(1073, 203, 1075, 390, 900, 285);


//Creating a tree trunk
fill(150, 75, 0);
strokeWeight(2);
rect(100, 400, 10, 315);

//Making a bunny
fill(255, 255, 255);
strokeWeight(1);
ellipse(350, 650, 80, 100);
fill(255, 192, 203);
strokeWeight(2);
ellipse(370, 700, 20, 30);
ellipse(330, 700, 20, 30);

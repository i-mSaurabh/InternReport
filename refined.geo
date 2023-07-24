//+
d = DefineNumber[1, Name "Parameters/d" ];
cos = DefineNumber[ 0.70710678, Name "Parameters/cos" ];
//+
Point(1) = {0, 0, 0, 1.0};

Point(2) = {d/2*cos, d/2*cos, 0, 1.0};
Point(3) = {-d/2*cos, d/2*cos, 0, 1.0};
Point(4) = {-d/2*cos, -d/2*cos, 0, 1.0};
Point(5) = {d/2*cos, -d/2*cos, 0, 1.0};

Point(6) = {2*d*cos, 2*d*cos, 0, 1.0};
Point(7) = {-2*d*cos, 2*d*cos, 0, 1.0};
Point(8) = {-2*d*cos, -2*d*cos, 0, 1.0};
Point(9) = {2*d*cos, -2*d*cos, 0, 1.0};

Point(10) = {-10*d, -10*d, 0, 1.0};
Point(11) = {-10*d, 10*d, 0, 1.0};
Point(12) = {15*d, 10*d, 0, 1.0};
Point(13) = {15*d, -10*d, 0, 1.0};

Point(14) = {2*d*cos, 10*d, 0, 1.0};
Point(15) = {-2*d*cos, -10*d, 0, 1.0};
Point(16) = {-2*d*cos, 10*d, 0, 1.0};
Point(17) = {2*d*cos, -10*d, 0, 1.0};


Point(18) = {-10*d, -2*d*cos, 0, 1.0};
Point(19) = {-10*d, 2*d*cos, 0, 1.0};
Point(20) = {15*d, 2*d*cos, 0, 1.0};
Point(21) = {15*d, -2*d*cos, 0, 1.0};




//+
Circle(1) = {4, 1, 3};
//+
Circle(2) = {3, 1, 2};
//+
Circle(3) = {2, 1, 5};
//+
Circle(4) = {5, 1, 4};
//+
Circle(5) = {8, 1, 7};
//+
Circle(6) = {7, 1, 6};
//+
Circle(7) = {6, 1, 9};
//+
Circle(8) = {9, 1, 8};
//+
Line(9) = {7, 16};
//+
Line(10) = {14, 6};
//+
Line(11) = {20, 12};
//+
Line(12) = {21, 20};
//+
Line(13) = {13, 21};
//+
Line(14) = {17, 9};
//+
Line(15) = {15, 8};
//+
Line(16) = {10, 18};
//+
Line(17) = {18, 19};
//+
Line(18) = {19, 11};
//+
Line(19) = {10, 15};
//+
Line(20) = {15, 17};
//+
Line(21) = {17, 13};
//+
Line(22) = {18, 18};
//+

//+
Line(23) = {18, 8};
//+
Line(24) = {9, 21};
//+
Line(25) = {19, 7};
//+
Line(26) = {6, 20};
//+
Line(27) = {11, 16};
//+
Line(28) = {16, 14};
//+
Line(29) = {14, 12};
//+
Line(30) = {8, 4};
//+
Line(31) = {7, 3};
//+
Line(32) = {6, 2};
//+
Line(33) = {9, 5};
//+
Curve Loop(1) = {18, 27, -9, -25};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {9, 28, 10, -6};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {10, 26, 11, -29};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {26, -12, -24, -7};
//+
Plane Surface(4) = {4};

//+
Curve Loop(5) = {24, -13, -21, 14};
//+
Plane Surface(5) = {5};
//+
Curve Loop(6) = {14, 8, -15, 20};
//+
Plane Surface(6) = {6};
//+
Curve Loop(7) = {15, -23, -16, 19};
//+
Plane Surface(7) = {7};
//+
Curve Loop(8) = {23, 5, -25, -17};
//+
Plane Surface(8) = {8};
//+
Curve Loop(9) = {31, 2, -32, -6};
//+
Plane Surface(9) = {9};
//+
Curve Loop(10) = {32, 3, -33, -7};
//+
Plane Surface(10) = {10};
//+
Curve Loop(11) = {33, 4, -30, -8};
//+
Plane Surface(11) = {11};
//+
Curve Loop(12) = {30, 1, -31, -5};
//+
Plane Surface(12) = {12};
//+
Recombine Surface {1, 2, 3, 4, 5, 6, 7, 8, 12, 9, 10, 11};
//+
Transfinite Curve {-18, -9, 10, -11, 16, 15, 14, 13} = 31 Using Progression 0.94;
//+
Transfinite Curve {27, 25, 23, 19} = 31 Using Progression 0.94;
//+
Transfinite Curve {-29, -26, -24, -21} = 51 Using Progression 0.94;
//+
Transfinite Curve {1,2,3,4} = 31 Using Progression 0.94;
//+
Transfinite Curve {17, 5} = 31 Using Progression 1;
//+
Transfinite Curve {3} = 31 Using Progression 0.96;
//+
Transfinite Curve {12, 7} = 31 Using Progression 1;
//+
Transfinite Curve {31, 32, 33, 30} = 41 Using Progression 0.95;
//+
Transfinite Curve {28,20,6,8} = 31 Using Progression 1;
//+
Transfinite Curve {30,31,32,33} = 41 Using Progression 0.95;
//+
Transfinite Surface {1};
//+
Transfinite Surface {2};
//+
Transfinite Surface {3};
//+
Transfinite Surface {4};
//+
Transfinite Surface {5};
//+
Transfinite Surface {6};
//+
Transfinite Surface {7};
//+
Transfinite Surface {8};
//+
Transfinite Surface {12};
//+
Transfinite Surface {9};
//+
Transfinite Surface {10};
//+
Transfinite Surface {11};
//+
Extrude {0, 0, 1} {
  Surface{1}; Surface{2}; Surface{3}; Surface{4}; Surface{5}; Surface{6}; Surface{7}; Surface{8}; Surface{12}; Surface{9}; Surface{10}; Surface{11}; Layers {1}; Recombine;
}
//+
Physical Surface("inlet", 298) = {42, 208, 182};
//+
Physical Surface("outlet", 299) = {94, 112, 134};
//+
Physical Surface("symmetry", 300) = {46, 68, 98, 186, 164, 138};
//+
Physical Surface("front", 301) = {55, 77, 99, 121, 143, 165, 187, 209, 231, 253, 275, 297};
//+
Physical Surface("back", 302) = {1, 2, 3, 4, 5, 6, 7, 8, 12, 9, 10, 11};
//+
Physical Surface("cylinder", 305) = {244, 266, 288, 222};
//+
Physical Volume(304) = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};




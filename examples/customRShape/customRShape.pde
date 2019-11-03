import geomerative.*;
import gcode.generative.*;

Gcoder g;
RShape rfinal;
PGraphics canvas;
GcodeRectMesh m;


void setup() {
    size(800, 800, P2D);
	g = new Gcoder(this, "output", 300, 300, 2.5, 110, 35, 180, 255); // valeur ok pour pas taper les pince

    RG.init(this);
    RG.setPolygonizer(RG.ADAPTATIVE);
    canvas = createGraphics((int) g.canvasWidth, (int)g.canvasHeight, P3D);

    rfinal = new RShape();

    // creation of a custom RShape from 4 points.
    RPoint[] points;
    points = new RPoint[4];
    points[0] = new RPoint(50,50);
    points[1] = new RPoint(120,50);
    points[2] = new RPoint(150,180);
    points[3] = new RPoint(50,150);
    RPath p = new RPath(points);
    RShape s = new RShape(p);
    s.addClose();


    rfinal = g.addFilledShape(rfinal, s);

    g.drawRShape(rfinal); // Convert and draw lines to gcode instructions
    g.writeToFile(); // write GCode


}


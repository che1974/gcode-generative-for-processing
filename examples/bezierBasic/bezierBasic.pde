import gcode.generative.*;
Gcoder g;
BezierQuad be;
BezierQuad be2;

void setup() {
    println("test");
    size(800, 800);
    g = new Gcoder(this, "gg", 300, 300, 2.5, 110, 35, 180, 255);


    be = new BezierQuad(g,new PVector(20,20), new PVector(80, 30), new PVector(120, 80), new PVector(150,120), .1);
    be.showControlPoints= true;
    be.addPoint(new PVector(be.lastPoint.x - 40, be.lastPoint.y + 30), new PVector(0,200));

    be.draw();
    
    
    //second method
    
    float[] pA = {20,20};
    float[] pB = {100,100};
    be2 = new BezierQuad(g, pA, 20,20, pB , 30,-30, .1);

    float[] pC = {40,40};
    be2.addPoint(pC, 10,10);
    be2.draw();
    

    g.writeToFile();
}
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer player;
AudioBuffer buffer;
AudioInput ai;

float lerpedAverage = 0;

float[] lerpedBuffer;

float x = 0;
float y = 0;
float z = 0;

void setup()
{
  size(500, 500, P3D);
  colorMode(HSB);
  minim = new Minim(this);
  player = minim.loadFile("music.mp3", width);
  buffer = player.mix;
  
  lerpedBuffer = new float[buffer.size()];
}

int which = 0;
float theta = 0;
float speed = -0.01f;
float moveSpeed = 1;

void draw()
{
  background(0);
  float halfHeight = height / 2;
  
  if (which == 0)
  {
    strokeWeight(1);
    for (int i = 0; i < buffer.size(); i ++)
    {
      float sample = buffer.get(i) * halfHeight;
      sample = lerpedBuffer[i] * width * 2;
      stroke(map(i, 0, buffer.size(), 0, 255), 0, 0);
      textSize(34);
      textAlign(CENTER, CENTER);
      text("Welcome to MN Cool's music", width/2 + sample, height/4 + sample);
      textSize(22);
      textAlign(CENTER);
      text("Press SPACE to play music", width/2, halfHeight);
      text("Press 1, 2, 3, 4, 5, 6, 7, 8 and 9", width/2, height * 0.75);
      text("for some musical art!", width/2, height * 0.80);
      
      lerpedBuffer[i] = lerp(lerpedBuffer[i], buffer.get(i), 0.1f);
    }
  }
  
  if (which == 1)
  {
    strokeWeight(1);
    for (int i = 0; i < buffer.size(); i ++)
    {
      float sample = buffer.get(i) * halfHeight;
      sample = lerpedBuffer[i] * width * 2;
      stroke(map(i, 0, buffer.size(), 0, 255), 255, 255);
      line(i, i, halfHeight - sample, i);
      line(i, halfHeight + sample, i, i);
      
      lerpedBuffer[i] = lerp(lerpedBuffer[i], buffer.get(i), 0.1f);
    }
  }
  
  if (which == 2)
  {
    for (int i = 0; i < buffer.size(); i ++)
    {
      float c = map(i, 0, buffer.size(), 0, 255);
      stroke(c, 255, 255);
      float sample = buffer.get(i) * halfHeight;
      ellipse(i, halfHeight + sample, i, y);
    }
  }

  float sum = 0;
  for (int i = 0; i < buffer.size(); i ++)
  {
    sum += abs(buffer.get(i));
  }

  noStroke();
  fill(map(lerpedAverage, 0, 1, 0, 255), 255, 255);
  float average = sum / buffer.size();
  lerpedAverage = lerp(lerpedAverage, average, 0.1f);
  
  if (which == 3)
  {
    strokeWeight(2);
    stroke(map(lerpedAverage, 0, 1, 0, 255), 255, 255);
    ellipse(width/2, halfHeight, lerpedAverage * width * 2, lerpedAverage * width * 2);
    noFill();
    stroke(map(lerpedAverage, 0, 1, 0, 255), 0, 255);
    rectMode(CENTER);
    rect(width/2, halfHeight, lerpedAverage * width * 2, lerpedAverage * width * 2);
  }
  
  if (which == 4)
  {
    sum = 0;
    for (int i = 0; i < buffer.size(); i ++)
    {
      sum += abs(buffer.get(i));
    }
    average = sum / (float) buffer.size();
    lerpedAverage = lerp(lerpedAverage, average, 0.1f);
    stroke(255, 0, 255);
    strokeWeight(3);
    noFill();
    lights();
    pushMatrix();
    translate(width/4, halfHeight, 0);
    rotateX(theta);
    rotateY(theta);
    rotateZ(theta);
    box(100 + (lerpedAverage * 500));
    popMatrix();
    pushMatrix();
    translate(width/2, height * 0.75, 0);
    rotateX(-theta);
    rotateY(-theta);
    rotateZ(-theta);
    box(100 + (lerpedAverage * 500));
    popMatrix();
    pushMatrix();
    translate(width * 0.75, halfHeight, 0);
    rotateX(theta);
    rotateY(theta);
    rotateZ(theta);
    box(100 + (lerpedAverage * 500));
    popMatrix();
    pushMatrix();
    translate(width/2, height/4, 0);
    rotateX(-theta);
    rotateY(-theta);
    rotateZ(-theta);
    box(100 + (lerpedAverage * 500));
    popMatrix();
    theta += speed;
  }
  
  if (which == 5)
  {
    sum = 0;
    for (int i = 0; i < buffer.size(); i ++)
    {
      sum += abs(buffer.get(i));
    }
    average = sum / (float) buffer.size();
    lerpedAverage = lerp(lerpedAverage, average, 0.1f);
    pushMatrix();
    stroke(0, 255, 255);
    strokeWeight(3);
    camera(0, 0, 250, 0, 0, 0, 0, 1, 0);
    noFill();
    translate(0, 0, z);
    rotateX(theta);
    rotateY(theta);
    rotateZ(theta);
    sphere(100 + (lerpedAverage * 500));
    popMatrix();
    z += moveSpeed;
    if(z > 100)
    {
      z = -200;
    }
  }
  
  if (which == 6)
  {
    for (int i = 0; i < buffer.size(); i ++)
    {
      float c = map(i, 0, buffer.size(), 0, 255);
      stroke(c, 155, 155);
      pushMatrix();
      noFill();
      translate(width/2, halfHeight, z);
      box(100 + (lerpedAverage * 500));
      popMatrix();
      z += moveSpeed;
      if(z > 100)
      {
        z = -200;
      }
    }
  }
  
  if (which == 7)
  {
    for (int i = 0; i < buffer.size(); i ++)
    {
      float sample = buffer.get(i) * halfHeight;
      sample = lerpedBuffer[i] * width * 2; 
      lerpedBuffer[i] = lerp(lerpedBuffer[i], buffer.get(i), 0.1f);
 
      stroke(map(i, 0, buffer.size(), 0, 255), 255, 255);
      line(width/2, i, width/2 - sample, i); 
      line(i, halfHeight, i, halfHeight - sample);
    }
  }
  
  if (which == 8)
  {
    for (int i = 0; i < buffer.size(); i ++)
    {
      float sample = buffer.get(i) * halfHeight;
      sample = lerpedBuffer[i] * width * 2; 
      lerpedBuffer[i] = lerp(lerpedBuffer[i], buffer.get(i), 0.1f);
 
      stroke(map(i, 0, buffer.size(), 0, 255), 255, 255);
      line(width * 0.75, i, width * 0.75 + sample, i);
      line(width/2, i, width/2 + sample, i);
      line(width/4, i, width/4 + sample, i);
      line(i, halfHeight, i, halfHeight - sample);
      line(i, height/4, i, height/4 - sample);
      line(i, height * 0.75, i, (height * 0.75) - sample);
    }
  }
  
  if (which == 9)
  {
    strokeWeight(1);
    for (int i = 0; i < buffer.size(); i ++)
    {
      float sample = buffer.get(i) * halfHeight;
      sample = lerpedBuffer[i] * width * 2;
      stroke(map(i, 0, buffer.size(), 0, 255), 255, 255);
      line(i, halfHeight + sample, i, halfHeight - sample);
      
      lerpedBuffer[i] = lerp(lerpedBuffer[i], buffer.get(i), 0.1f);
    }
  }
}

void keyPressed()
{
  if (keyCode >= '0' && keyCode <= '9')
  {
    which = keyCode - '0';
  }
  if (keyCode == ' ')
  {
    if ( player.isPlaying() )
    {
      player.pause();
    }
    else
    {
      player.rewind();
      player.play();
    }
  }
}

void mouseClicked()
{
  
}

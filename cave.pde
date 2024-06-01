void cave()
{
  caveBarX = 50;
  caveBarY = (90+100+50);
  caveBarW = width-2*50;
  caveBarH = 70;
  caveCircleRadius = 400;
  caveCircleFill = 0;
  
  fill(180);
  rect(50, (90+100+50), width-2*50, 70);
  
  fill(255);
  circle(width/2, caveBarY+400, caveCircleRadius);
  fill(#6699FF);
  circle(width/2, caveBarY+400, caveCircleFill);
  
  
  
}

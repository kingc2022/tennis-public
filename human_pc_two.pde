void human_vs_pc_2() {
  /*
  此自定义函数功能
   ·实现人与电脑对战 （有限模式）
   */
  surface.setTitle(name_2 + " v" + version + " - 有限模式");
  noCursor();
  background(0);
  board();
  pcBoard();
  divider();
  ball();
  score_2();
  /*
  pcBoardY = ballY-30; (v1.0)
   
   if (pcBoardY >= 0 && pcBoardY < height-pcBoardH) {
   pcBoardY = pcBoardY + pcBoardMoveSpeed;
   } else {
   pcBoardY = 0;
   }  (v2.0)
   */
  if (pcBoardY+pcBoardH/2 < ballY) {
    up = 0;
    down = 1;
  } else if (pcBoardY+pcBoardH/2 > ballY) {
    up = 1;
    down = 0;
  }
  if (pcBoardY < 0) {
    up = 0;
    down = 1;
  }
  if (pcBoardY+pcBoardH > height) {
    up = 1;
    down = 0;
  }
  if (up == 1 && (pcBoardY > 0)) {
    pcBoardY = pcBoardY - pcBoardMoveSpeed;
  }
  if (down == 1 && (pcBoardY+pcBoardH < height)) {
    pcBoardY = pcBoardY + pcBoardMoveSpeed;
  }
}
void score_2() {
  fill(255);
  textFont(font, 50);
  text(playerScore + "           " + pcScore, width/2, 60);
  if (ballX <= boardX) {
    pcScore = pcScore + 1;
    if (isMute == false) {
      p_fault.play(0);
    }
    ballReset();
  }
  if (ballX >= pcBoardX) {
    playerScore = playerScore + 1;
    if (!(isPCMute == true || isMute == true)) {
      p_fault.play(0);
    }
    ballReset();
  }
  if (playerScore >= 10) {
    noLoop();
    cursor();
    background(0);
    fill(255);
    textFont(font_2, 40);
    text("你赢得了10分,恭喜你赢了", width/2, height/2-100);
    textFont(font_2, 30);
    text("请按[q]或[Q]键退出", width/2, height/2+100);
    text("或按[r]或[R]键再来一局", width/2, height/2+200);
  } else if (pcScore >= 10) {
    noLoop();
    cursor();
    background(0);
    fill(255);
    textFont(font_2, 40);
    text("电脑赢得了10分,抱歉,你输了", width/2, height/2-100);
    textFont(font_2, 30);
    text("请按[q]或[Q]键退出", width/2, height/2+100);
    text("或按[r]或[R]键再来一局", width/2, height/2+200);
  }
}

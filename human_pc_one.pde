void human_vs_pc_1() {
  /*
  此自定义函数功能
   ·实现人与电脑对战 （无限模式）
   */
  surface.setTitle(name_2 + " v" + version + " - 上海民办彭浦实验小学 | 五（6）中队 | 蔡宇清制作 - 无限模式");
  noCursor();
  background(0);
  board();
  pcBoard();
  divider();
  ball();
  score();
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

void pc_vs_pc() {
  /*
   此自定义函数功能:
   · 实现电脑对战电脑的功能
   */
  surface.setTitle(name_2 + " v" + version + " - 上海民办彭浦实验小学 | 五（6）中队 | 蔡宇清制作 - 电脑对战");
  noCursor();
  background(0);
  pvp_board();
  pcBoard();
  divider();
  pvp_ball();
  pvp_score();
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
  //
  if (pvp_boardY+pvp_boardH/2 < ballY) {
    pvp_up = 0;
    pvp_down = 1;
  } else if (pvp_boardY+pvp_boardH/2 > ballY) {
    pvp_up = 1;
    pvp_down = 0;
  }
  if (pvp_boardY < 0) {
    pvp_up = 0;
    pvp_down = 1;
  }
  if (pvp_boardY+pvp_boardH > height) {
    pvp_up = 1;
    pvp_down = 0;
  }
  if (pvp_up == 1 && (pvp_boardY > 0)) {
    pvp_boardY = pvp_boardY - pvp_board_move_speed;
  }
  if (pvp_down == 1 && (pvp_boardY+pvp_boardH < height)) {
    pvp_boardY = pvp_boardY + pvp_board_move_speed;
  }
}

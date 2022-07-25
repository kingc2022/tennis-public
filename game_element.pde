void board() {
  fill(boardColor);
  noStroke();
  rect(boardX, boardY, boardW, boardH);
}
void pvp_board() {
  fill(boardColor);
  noStroke();
  rect(pvp_boardX, pvp_boardY, pvp_boardW, pvp_boardH);
}
void pcBoard() {
  fill(boardColor);
  noStroke();
  rect(pcBoardX, pcBoardY, pcBoardW, pcBoardH);
}
void divider() {
  for (int y = 0; y < 500; y = y + 10) {
    fill(scoreColor);
    noStroke();
    rect(dividerX, y, dividerW, dividerH);
  }
}
void ball() {
  fill(boardColor);
  noStroke();
  ellipse(ballX, ballY, ballW, ballH);
  ballX = ballX + ballMoveSpeed * xDirection;
  ballY = ballY + ballMoveSpeed * yDirection;
  if (ballY-ballH/2 <= 0) {
    if (xDirection == -1) {
      xDirection = -1;
      yDirection = 1;
    } else if (xDirection == 1) {
      xDirection = 1;
      yDirection = 1;
    }
  } else if (ballY+ballH/2 >= height) {
    if (xDirection == -1) {
      xDirection = -1;
      yDirection = -1;
    } else if (xDirection == 1) {
      xDirection = 1;
      yDirection = -1;
    }
  }
  if ((ballX-ballW/2 <= boardX+boardW) && (ballY >= boardY) && (ballY <= boardY+boardH)) {
    /*
    xDirection = -1;
     yDirection = -1; (v1.0)
     */
    /*
    if (xDirection == -1) {
     xDirection = 1;
     yDirection = 1;
     } else if (xDirection == 1) {
     xDirection = -1;
     yDirection = -1;
     } (v2.0)
     */
    int uod = int(random(1, 3));
    if (uod == 1) {
      xDirection = 1;
      yDirection = -1;
    } else {
      xDirection = 1;
      yDirection = 1;
    }
    if (isMute == false) {
      p_catch.play(0);
    }
  } else if ((ballX+ballW/2 >= pcBoardX) && (ballY >= pcBoardY) && (ballY <= pcBoardY+pcBoardH)) {
    // xDirection = 1
    // yDirection = 1
    /*
    if (xDirection == -1) {
     xDirection = 1;
     yDirection = -1;
     } else if (xDirection == 1) {
     xDirection = -1;
     yDirection = 1;
     }
     */
    int uod = int(random(1, 3));
    if (uod == 1) {
      xDirection = -1;
      yDirection = -1;
    } else {
      xDirection = -1;
      yDirection = 1;
    }
    if (!(isMute == true || isPCMute == true)) {
      p_catch.play(0);
    }
  }
}
void pvp_ball() {
  fill(boardColor);
  noStroke();
  ellipse(ballX, ballY, ballW, ballH);
  ballX = ballX + ballMoveSpeed * xDirection;
  ballY = ballY + ballMoveSpeed * yDirection;
  if (ballY-ballH/2 <= 0) {
    if (xDirection == -1) {
      xDirection = -1;
      yDirection = 1;
    } else if (xDirection == 1) {
      xDirection = 1;
      yDirection = 1;
    }
  } else if (ballY+ballH/2 >= height) {
    if (xDirection == -1) {
      xDirection = -1;
      yDirection = -1;
    } else if (xDirection == 1) {
      xDirection = 1;
      yDirection = -1;
    }
  }
  if ((ballX-ballW/2 <= pvp_boardX+pvp_boardW) && (ballY >= pvp_boardY) && (ballY <= pvp_boardY+pvp_boardH)) {
    /*
    xDirection = -1;
     yDirection = -1; (v1.0)
     */
    /*
    if (xDirection == -1) {
     xDirection = 1;
     yDirection = 1;
     } else if (xDirection == 1) {
     xDirection = -1;
     yDirection = -1;
     } (v2.0)
     */
    int uod = int(random(1, 3));
    if (uod == 1) {
      xDirection = 1;
      yDirection = -1;
    } else {
      xDirection = 1;
      yDirection = 1;
    }
    if (isMute == false) {
      p_catch.play(0);
    }
  } else if ((ballX+ballW/2 >= pcBoardX) && (ballY >= pcBoardY) && (ballY <= pcBoardY+pcBoardH)) {
    int uod = int(random(1, 3));
    if (uod == 1) {
      xDirection = -1;
      yDirection = -1;
    } else {
      xDirection = -1;
      yDirection = 1;
    }
    if (!(isMute == true || isPCMute == true)) {
      p_catch.play(0);
    }
  }
}
void score() {
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
}
void pvp_score() {
  fill(255);
  textFont(font, 50);
  text(playerScore + "           " + pcScore, width/2, 60);
  if (ballX <= pvp_boardX) {
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
}
void ballReset() {
  ballX = initBallX;
  ballY = initBallY;
  return;
}

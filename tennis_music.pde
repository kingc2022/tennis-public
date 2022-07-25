/*
 Copyright (c) 2022 蔡宇清, All rights reserved.
 +-----------------------------------+
 |           Tennis                  |
 |         Verison 2.1               |
 |       Programmer: 蔡宇清          |
 +-----------------------------------+
 */

// ===================================
// Import Library

import ddf.minim.*;

// ===================================
// Sound

Minim m_bgm = new Minim(this);
AudioPlayer p_bgm;

Minim m_catch = new Minim(this);
AudioPlayer p_catch;

Minim m_fault = new Minim(this);
AudioPlayer p_fault;
// ===================================
// Game Settings

boolean isPause = false;
boolean isMute = false;
boolean isPCMute = false;
// ===================================
// Board Variables

final int boardW = 20; // Set board's width
final int boardH = 80; // Set board's height
final int boardX = 10; // Set board's x position
int boardY = 500/2-boardH/2; // Set board's y position
final int boardMoveSpeed = 5; // Set board's move speed
final color boardColor = color(255); // Set board's color
// ===================================
// Ball Variables

final int ballW = 30; // Set ball's width
final int ballH = 30; // Set ball's height
int ballX = 800/2; // Set ball's x position
int ballY = 500/2; // Set ball's y position
final int initBallX = ballX; // Set ball's init x position (respawn use)
final int initBallY = ballY; // Set ball's init y position (respawn use)
final int ballMoveSpeed = 3; // Set ball's move speed
// ==============================
// Ball Direction

int xDirection = -1; // Set x direction
int yDirection = 1; // Set y direction
// ===================================
// Divider Variables

final int dividerW = 6; // Set divider's width
final int dividerH = 5; // Set divider's height
final int dividerX = 800/2-dividerW/2; // Set divider's x position
// ==============================
// Score Variables

int playerScore = 0; // Set Player's score
int pcScore = 0; // Set PC's score
final color scoreColor = color(170); // Set show score and divider color
// ==============================
// PC Variables

final int pcBoardW = 20; // Set PC's board width
final int pcBoardH = 80; // Set PC's board height
final int pcBoardX = 770; // Set PC's board x position
float pcBoardY = 500/2-pcBoardH/2; // Set PC's board y position
final float pcBoardMoveSpeed = 1.77; // Set PC's board move speed
int up = 0; // Set PC's board up
int down = 0; // Set PC's board down
// ==============================
// Fonts

PFont font; // Show score font
PFont font_2;
// ==============================
// Debug

boolean debug = false; // Set debug value
// ==============================
// Program Settings

final String name_1 = "Tennis"; // Program name
String name_2 = ""; // Titled program name
final float version = 2.1; // Program version
int ctrl = 0;
// ==============================
// UI

Button [] select_buttons = new Button[3]; // Select button
// ==============================
// PC Vs PC Variables

// pvp = pc_vs_pc
final int pvp_boardW = 20; // PVP board width
final int pvp_boardH = 80; // PVP board height
final float pvp_board_move_speed = 2; // PVP board move speed
float pvp_boardY = 500/2-pvp_boardH/2; // PVP board y position
final int pvp_boardX = 10; // PVP board x position
int pvp_up = 0; // PVP board up
int pvp_down = 0; // PVP board down
// =======================================================
// =======================================================
// =======================================================
void setup() {
  size(800, 500);
  name_2 = name_1.substring(0, 1).toUpperCase() + name_1.substring(1, name_1.length()).toLowerCase(); // Format title name
  surface.setTitle(name_2 + " v" + version + " - 上海民办彭浦实验小学 | 五（6）中队 | 蔡宇清制作");
  textAlign(CENTER);
  font = createFont("Comic Sans MS", 30, true);
  font_2 = createFont("LiSu", 30, true);
  p_bgm = m_bgm.loadFile("bgm.mp3");
  p_catch = m_catch.loadFile("catch.mp3");
  p_fault = m_fault.loadFile("fault.mp3");
  textFont(font, 50);
  select_buttons[0] = new Button(100, 100, width-200, 78, "无限模式");
  select_buttons[1] = new Button(100, 225, width-200, 78, "有限模式");
  select_buttons[2] = new Button(100, 350, width-200, 78, "电脑对战");
  if (debug) {
    surface.setAlwaysOnTop(true);
    // frameRate(10); // animation debug
  }
  p_bgm.loop();
}
void draw() {
  if (ctrl == 0) {
    background(0);
    fill(255);
    textFont(font_2, 50);
    text("弹球游戏", width/2, 66);
    select_buttons[0].show();
    select_buttons[1].show();
    select_buttons[2].show();
    if (select_buttons[0].isClick() == true) {
      ctrl = 1;
    } else if (select_buttons[1].isClick() == true) {
      ctrl = 2;
    } else if (select_buttons[2].isClick() == true) {
      ctrl = 3;
    }
  } else if (ctrl == 1) {
    human_vs_pc_1();
  } else if (ctrl == 2) {
    human_vs_pc_2();
  } else if (ctrl == 3) {
    pc_vs_pc();
  }
  if (focused == false && (ctrl == 1 || ctrl == 2 || ctrl == 3)) {
    p_bgm.pause();
    noLoop();
    cursor();
    isPause = true;
  }
}
void keyPressed() {
  if (ctrl == 1 || ctrl == 2) {
    if (isPause == false) {
      if (keyCode == UP && boardY-boardMoveSpeed >= 0) {
        boardY = boardY - boardMoveSpeed;
      }
      if (keyCode == DOWN && boardY+boardH+boardMoveSpeed <= height) {
        boardY = boardY + boardMoveSpeed;
      }
    }
  }
  if (ctrl == 1 || ctrl == 3) {
    if (key == ' ' && isPause == false) {
      p_bgm.pause();
      cursor();
      noLoop();
      isPause = true;
    } else if (key == ' ' && isPause == true) {
      p_bgm.loop();
      noCursor();
      loop();
      isPause = false;
    }
  }
  if ((key == 'm' || key == 'M') && isMute == false) {
    p_bgm.pause();
    isMute = true;
  } else if ((key == 'm' || key == 'M') && isMute == true) {
    p_bgm.loop();
    isMute = false;
  }
  if ((key == 'p' || key == 'P') && isPCMute == false) {
    isPCMute = true;
  } else if ((key == 'p' || key == 'P') && isPCMute == true) {
    isPCMute = false;
  }
  if (key == 'r' || key == 'R') {
    loop();
    isPause = false;
    isMute = false;
    isPCMute = false;
    boardY = 500/2-boardH/2;
    ballX = 800/2;
    ballY = 500/2;
    xDirection = -1;
    yDirection = 1;
    playerScore = 0;
    pcScore = 0;
    pcBoardY = 500/2-pcBoardH/2;
    up = 0;
    down = 0;
  }
  if (key == 'q' || key == 'Q') {
    exit();
  }
}

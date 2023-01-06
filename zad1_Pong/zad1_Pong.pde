int player1Y = 50; // położenie paletki gracza 1
int player2Y = 50; // położenie paletki gracza 2
int ballX = 250; // położenie piłki poziomo
int ballY = 250; // położenie piłki pionowo
int ballVelocityX = 3; // prędkość piłki poziomo
int ballVelocityY = 3; // prędkość piłki pionowo
int player1Score = 0; 
int player2Score = 0; 

void setup() {
  size(500, 500);
}

void draw() {
  background(0); 
  fill(255); 
  rect(10, player1Y, 10, 50); 
  rect(480, player2Y, 10, 50);
  ellipse(ballX, ballY, 20, 20); 
  textSize(32); 
  text(player1Score, 100, 50); 
  text(player2Score, 400, 50); 
  
  // poruszanie się paletek graczy
  if (keyPressed) { 
    if (key == 'w') {
      player1Y -= 5; 
    }
    if (key == 's') { 
      player1Y += 5; 
    }
    if (keyCode == UP) { 
      player2Y -= 5; 
    }
    if (keyCode == DOWN) { 
      player2Y += 5; 
    }
  }
  
  // ograniczenie ruchu paletek graczy do obszaru okna
  player1Y = constrain(player1Y, 0, height - 50);
  player2Y = constrain(player2Y, 0, height - 50);
  
  // poruszanie się piłki
  ballX += ballVelocityX;
  ballY += ballVelocityY;

// odbijanie piłki od górnej i dolnej krawędzi okna
if (ballY < 0 || ballY > height) {
ballVelocityY *= -1; 
}

// sprawdzenie, czy piłka uderzyła w paletkę gracza 1
if (ballX < 20 && ballX > 10 && ballY > player1Y && ballY < player1Y + 50) {
ballVelocityX *= -1; 
}

// sprawdzenie, czy piłka uderzyła w paletkę gracza 2
if (ballX > 480 && ballX < 490 && ballY > player2Y && ballY < player2Y + 50) {
ballVelocityX *= -1; 
}

// sprawdzenie, czy piłka wypadła poza pole gry
if (ballX < 0) {
player2Score++; 
ballX = 250; 
ballY = 250; 
ballVelocityX = 3; 
ballVelocityY = 3; 
}
if (ballX > width) {
player1Score++; 
ballX = 250;
ballY = 250; 
ballVelocityX = -3; 
ballVelocityY = -3;
}
}

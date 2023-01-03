int player1Y = 50; // położenie paletki gracza 1
int player2Y = 50; // położenie paletki gracza 2
int ballX = 250; // położenie piłki poziomo
int ballY = 250; // położenie piłki pionowo
int ballVelocityX = 3; // prędkość piłki poziomo
int ballVelocityY = 3; // prędkość piłki pionowo
int player1Score = 0; // wynik gracza 1
int player2Score = 0; // wynik gracza 2

void setup() {
  size(500, 500); // rozmiar okna
}

void draw() {
  background(0); // kolor tła
  fill(255); // kolor rysowania
  rect(10, player1Y, 10, 50); // rysowanie paletki gracza 1
  rect(480, player2Y, 10, 50); // rysowanie paletki gracza 2
  ellipse(ballX, ballY, 20, 20); // rysowanie piłki
  textSize(32); // rozmiar tekstu
  text(player1Score, 100, 50); // rysowanie wyniku gracza 1
  text(player2Score, 400, 50); // rysowanie wyniku gracza 2
  
  // poruszanie się paletek graczy
  if (keyPressed) { // jeżeli jakiś klawisz jest wciśnięty
    if (key == 'w') { // jeżeli to klawisz "w"
      player1Y -= 5; // przesuń paletkę gracza 1 w górę
    }
    if (key == 's') { // jeżeli to klawisz "s"
      player1Y += 5; // przesuń paletkę gracza 1 w dół
    }
    if (keyCode == UP) { // jeżeli to strzałka w górę
      player2Y -= 5; // przesuń paletkę gracza 2 w górę
    }
    if (keyCode == DOWN) { // jeżeli to strzałka w dół
      player2Y += 5; // przesuń paletkę gracza 2 w dół
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
ballVelocityY *= -1; // zmiana kierunku ruchu piłki
}

// sprawdzenie, czy piłka uderzyła w paletkę gracza 1
if (ballX < 20 && ballX > 10 && ballY > player1Y && ballY < player1Y + 50) {
ballVelocityX *= -1; // zmiana kierunku ruchu piłki
}

// sprawdzenie, czy piłka uderzyła w paletkę gracza 2
if (ballX > 480 && ballX < 490 && ballY > player2Y && ballY < player2Y + 50) {
ballVelocityX *= -1; // zmiana kierunku ruchu piłki
}

// sprawdzenie, czy piłka wypadła poza pole gry
if (ballX < 0) {
player2Score++; // dodaj punkt graczowi 2
ballX = 250; // ustaw piłkę na środku pola gry
ballY = 250; // ustaw piłkę na środku pola gry
ballVelocityX = 3; // ustaw prędkość piłki
ballVelocityY = 3; // ustaw prędkość piłki
}
if (ballX > width) {
player1Score++; // dodaj punkt graczowi 1
ballX = 250; // ustaw piłkę na środku pola gry
ballY = 250; // ustaw piłkę na środku pola gry
ballVelocityX = -3; // ustaw prędkość piłki
ballVelocityY = -3; // ustaw prędkość piłki
}
}

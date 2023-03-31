"use strict";

// BOARD
const blockSize = 15;
const rows = 33;
const cols = 70;
let board, context, userId;
let playerScore = 0;

// SNAKE
let snakeX = blockSize * 5;
let snakeY = blockSize * 5;

let velocitX = 0,
  velocitY = 0;

let snakeBody = [];

// FOOD
let foodX, foodY;

let gameOver = false;

window.onload = () => {
  console.log(document.querySelector(".user_id"));
  userId = document.querySelector(".user_id").value;
  board = document.querySelector(".board");
  board.height = rows * blockSize;
  board.width = cols * blockSize;
  context = board.getContext("2d"); // use for drawing on the board

  placeFood();
  document.addEventListener("keyup", changeDirection);
  setInterval(update, 80);
};

const GameOver = async () => {
  let gameOverP = document.querySelector(".game-over");
  gameOverP.classList.remove("hidden");
  gameOver = true;
  try {
    const res = await fetch("http://localhost:8080/api/users/" + userId);
    const data = await res.json();
    const updateUser = {
	  ...data,
	  tickets: data.tickets + playerScore
	}
	console.log(updateUser);
	const updateData = {
	  method: "PUT",
	  headers:{
		"Content-Type": "application/json",
		"Accept": "application/json"
	  },
	  body:JSON.stringify(updateUser)
	}
	const res2 = await fetch("http://localhost:8080/api/users/" + userId, updateData);
	const data2 = await res2.json();
	console.log(data2);
  } catch (error) {
	console.log(error.message);
  }
  playerScore = 0;
};

const update = async () => {
  if (gameOver) {
    return;
  }
    
  const score = document.querySelector(".score");

  context.fillStyle = "#1b2d4d";
  context.fillRect(0, 0, board.width, board.height);

  context.fillStyle = "#F8F8F8";
  context.fillRect(foodX, foodY, blockSize, blockSize);

  if (snakeX === foodX && snakeY === foodY) {
    snakeBody.push([foodX, foodY]);
    playerScore += 10;
    score.textContent = playerScore;
    placeFood();
  }

  for (let i = snakeBody.length - 1; i > 0; i--) {
    snakeBody[i] = snakeBody[i - 1];
  }
  if (snakeBody.length) snakeBody[0] = [snakeX, snakeY];

  context.fillStyle = "#F037A5";
  snakeX += velocitX * blockSize;
  snakeY += velocitY * blockSize;
  context.fillRect(snakeX, snakeY, blockSize, blockSize);
  for (let i = 0; i < snakeBody.length; i++) {
    context.fillRect(snakeBody[i][0], snakeBody[i][1], blockSize, blockSize);
  }
  

  if (
    snakeX < 0 ||
    snakeX > cols * blockSize ||
    snakeY < 0 ||
    snakeY > rows * blockSize
  ) {
    GameOver();
  }
  snakeBody.forEach((el) => {
    if (snakeX === el[0] && snakeY === el[1]) {
      GameOver();
    }
  });
};

const changeDirection = (e) => {
  if (e.code === "ArrowUp" && velocitY != 1) {
    velocitX = 0;
    velocitY = -1;
  } else if (e.code === "ArrowDown" && velocitY != -1) {
    velocitX = 0;
    velocitY = 1;
  } else if (e.code === "ArrowLeft" && velocitX != 1) {
    velocitX = -1;
    velocitY = 0;
  } else if (e.code === "ArrowRight" && velocitX != -1) {
    velocitX = 1;
    velocitY = 0;
  }
  const resetBtn = document.querySelector(".reset-btn");
  const gameOverP = document.querySelector(".game-over");

  resetBtn.addEventListener("click", () => {
    gameOverP.classList.add("hidden");
    velocitX = 0;
    velocitY = 0;
    snakeX = blockSize * 5;
    snakeY = blockSize * 5;
    snakeBody = [];
    gameOver = false;
    const score = document.querySelector(".score");
    score.textContent = 0;
    placeFood();
  });
};

const placeFood = () => {
  foodX = Math.floor(Math.random() * cols) * blockSize;
  foodY = Math.floor(Math.random() * rows) * blockSize;
};


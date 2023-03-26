let canvas = document.querySelector("#game");
let para = document.querySelector("#para");
console.log(canvas);
console.log(para);
//const ctx = canvas.getContext('2d');
document.body.addEventListener('keydown', keyDown);

let tileCount=20;
let tileSize=18;
let headX=10;
let headY=10;
let xvelocity=0;
let yvelocity=0;
let appleX=5;
let appleY=5;

/*const drawGame = () => {
    clearScreen();
    let speed=7;//The interval will be seven times a second.
    setTimeout(drawGame, 1000/speed);//update screen 7 times a second
    drawSnake();
    changeSnakePosition();
    drawApple();
}

const clearScreen = () => {
	ctx.fillStyle= 'black';
	ctx.fillRect(0,0,canvas.clientWidth,canvas.clientHeight)
}

const drawSnake = () => {
	ctx.fillStyle="orange";
    ctx.fillRect(headX * tileCount, headY * tileCount, tileSize, tileSize)
}

const keyDown = (event) => {
	//up
    if(event.keyCode==38){
		if (yvelocity == 1) {
			return;
		}
        yvelocity=-1; //move one tile up
        xvelocity=0;

    }
    //down
    if(event.keyCode==40){
		if (yvelocity == -1) {
			return;
		}
        yvelocity=1;//move one tile down
        xvelocity=0;
    }

	//left
    if(event.keyCode==37){
		if (xvelocity == 1) {
			return;
		}
        yvelocity=0;
        xvelocity=-1;//move one tile left
    }
    //right
    if(event.keyCode==39){
		if (xvelocity == -1) {
			return;
		}
        yvelocity=0;
        xvelocity=1;//move one tile right
    }
}

const changeSnakePosition = () => {
     headX=headX + xvelocity;
     headY=headY+ yvelocity;

}
 
const drawApple = () => {
     ctx.fillStyle="red";// make apple red
     ctx.fillRect(appleX*tileCount, appleY*tileCount, tileSize, tileSize)//position apple within tile count
 }
 
drawGame();*/



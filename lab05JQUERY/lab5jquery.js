window.onload = function() {
    var score = 0;
    var playing = true;

    var scoreDisplay = document.getElementById("scoreboard");

    var gameoverdisplay = this.document.getElementById("gameover");

    function displayGameover() {
        gameoverdisplay.innerHTML = "GAME OVER!";
    }

    function displayScore() {
        scoreDisplay.innerHTML = "SCORE: " + score;
    }


    function randomPos() {
        return Math.floor(Math.random() * 16);
    }

    function gameOver() {
        if (score == 4) {
            displayScore();
            scoreDisplay.innerHTML = "";
            displayGameover();
            alert("GAME OVER! YOU'VE REACHED THE MAXIMUM POINTS!");

            return true;
        }
        else {
            return false;
        }
    }

    function makeDiv(){
        // vary size for fun
        var divsize = ((Math.random()*100) + 50).toFixed();
        var color = '#'+ Math.round(0xffffff * Math.random()).toString(16);
        $newdiv = $('<div/>').css({
            'width':divsize+'px',
            'height':divsize+'px',
            'background-color': color
        });

        if (gameOver())
            return;

        $newdiv.click(function() {
            score++;
            displayScore();
        })
    
        // make position sensitive to size and document's width
        var posx = (Math.random() * ($(document).width() - divsize)).toFixed();
        var posy = (Math.random() * ($(document).height() - divsize)).toFixed();
    
        $newdiv.css({
            'position':'absolute',
            'left':posx+'px',
            'top':posy+'px',
            'display':'none'
        }).appendTo( 'body' ).fadeIn(100).delay(1000).fadeOut(1000, function(){
          $(this).remove();
          makeDiv(); 
        }); 
    };


    function start() {
            displayScore();
            makeDiv();
    }

    start();
}
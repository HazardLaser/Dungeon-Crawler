playerRangeMin = 50;
playerRangeMax = 60;
movementSpeed = 1;
counter = 0;
ballRate = irandom_range(4,6);

localHealth = 1;

path = path_add();
calcPathDelay = 30;
calcPathTimer = irandom(60);

//for the death sprite
disabled = false;
disabledOnce = false;
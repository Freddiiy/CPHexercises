class GridGame {
  int mapSize = 32;
  int gridSize = mapSize;

  int[][] grid = new int[mapSize][mapSize];
  void render() {
    gridSize = 1024/mapSize;
    clearMap();
    update();
    drawMap();
  }

  void clearMap() {
    for (int x = 0; x < grid.length; x++) {
      for (int y = 0; y < grid[0].length; y++) {
        grid[x][y] = 0;
      }
    }
  }

  void drawMap() {
    rectMode(CORNER);
    for (int x = 0; x < grid.length; x++) {
      for (int y = 0; y < grid[0].length; y++) {
        fill(colorSwitch(grid[x][y]));
        stroke(126);
        rect(x * gridSize, y * gridSize, gridSize, gridSize);
      }
    }
  }

  void update() {
    grid[player.x][player.y] = player.cSwitch;
    grid[enemy.x] [enemy.y] = enemy.cSwitch;
    player.update();
  }

  color colorSwitch(int cSwitch) {
    color c = color(255);

    switch(cSwitch) {
    case 0:
      c = color(0);
      break;
      //player color
    case 1:
      c = color(0, 255, 0);
      break;
      //enemy color
    case 2:
      c = color(255, 0, 0);
      break;
    case 3:
      c = color(0, 0, 255);
      break;
    case 4:
      c = color(0, 255, 255);
      break;
    }
    return c;
  }
}
// Jacob

interface IFunction {
  void run();
}

class EventFunction {

  IFunction startGame() {
    return new IFunction() {
      public void run() {
        sceneManager.loadGame();
      }
    };
  }

  IFunction exitGame() {
    return new IFunction() {
      public void run() {
        exit();
      }
    };
  }
}

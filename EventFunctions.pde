// Interface functionality: Credit Jonatan
// Jacob

interface IFunction {
  void run();
}

class EventFunction {

  IFunction startSinglePlayer() {
    return new IFunction() {
      public void run() {
        sceneManager.loadGame(1);
      }
    };
  }

  IFunction start2Player() {
    return new IFunction() {
      public void run() {
        sceneManager.loadGame(2);
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

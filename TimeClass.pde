//Shooter project 08
//Robin
//Delta time

public static class Time {
	static public float deltaTime;
	static public long time;
	static public long currentTime;
	static public final float MULTI_DELTA = 0.001f;
};

public class Timer {
	private int waitTime;
	private long timerStart;
	private boolean timerActive = false;

	public Timer(int waitTime) {
		this.waitTime = waitTime;
	}

	public void start() {
		if (timerActive)
			return;

		timerActive = true;
		timerStart = millis();
	}

	public void stop() {
		if (!timerActive)
			return;

		timerActive = false;
	}

	public boolean time() {
		if (timerActive && (waitTime <= (Time.currentTime - timerStart))) {
			timerStart = millis();
			return true;
		} else
			return false;
	}

	public long currentTime() {
		return Time.currentTime - timerStart;
	}
}
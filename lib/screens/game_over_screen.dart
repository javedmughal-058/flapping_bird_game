import 'package:flutter/material.dart';
import '../game/assets.dart';
import '../game/flappy_bird_game.dart';

class GameOverScreen extends StatelessWidget {
  final FlappyBirdGame game;

  const GameOverScreen({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
    height: game.size.y,
    width: game.size.x,
    child: Material(
          color: Colors.black38,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              game.bird.lastScore == 0
                  ? const SizedBox()
                  : Text(
                    'Highest Score: ${game.bird.lastScore}',
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.orange,
                      fontFamily: 'Game',
                    ),
                  ),
              const SizedBox(height: 10),
              Text(
                'Score: ${game.bird.score}',
                style: const TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontFamily: 'Game',
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(Assets.gameOver),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: onRestart,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text(
                  'Restart',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
  );

  void onRestart() {
    game.bird.reset();
    game.overlays.remove('gameOver');
    game.resumeEngine();
  }
}

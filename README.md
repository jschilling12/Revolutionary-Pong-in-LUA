# Revolutionary Pong
#### Video Demo: https://youtu.be/e2qpuQaP4zU
#### Description:
Welcome to my Pong Game project, a retro gaming experience reimagined with modern features and functionality! Built using the LOVE 2D game engine and fully programmed in Lua. Below, you’ll find a detailed overview of the game's mechanics, features, and the thought process behind its creation.

### How to Play:
1. Launch the game using the LOVE engine.
2. Select your desired mode (Single Player or Multiplayer).
3. Choose a difficulty level in Single Player mode.
4. Let the matches begin! Use the appropriate keys to control your paddle and score points by outsmarting your opponent.

### Features:
1. **Game Modes**:
   - **Single Player (Local AI)**: Face off against a challenging AI opponent.
   - **Multiplayer**: Compete against friends in a head-to-head local match.
   - **Difficulty Selection**: Choose your preferred difficulty level to customize the ball speed.

2. **Controls**:
   - **Player 1**: Use the **Up** and **Down** arrow keys for movement.
   - **Player 2/AI**: Use the `W` (up) and `S` (down) keys.

3. **Sound Effects (SFX)**:
   - Menu navigation, paddle collisions, and scoring moments.

4. **Visuals**:
   - A minimalist and clean design provides a nostalgic look.

---

### File Structure:
- **Main.lua**: The core script of the game, which initializes the LOVE engine, and handles the game loop..
- **Assets Folder**: This folder contains all required assets, such as audio files for sound effects and any visual elements.
- **Scripts Folder**: Various Lua scripts modularize the game logic, such as paddle movement, collision detection, and scorekeeping.

---

### Design Decisions:
Creating this project involved a series of important design choices:
1. **Game Modes**:
   - Implementing a multiplayer option ensures social engagement, while the AI mode adds variety for solo players.
2. **Controls**:
   - Simplified and intuitive controls enhance accessibility, making it easy for anyone to pick up and play.
3. **Difficulty Levels**:
   - Balancing the AI difficulty required rigorous testing to ensure the game remains fun and challenging across all skill levels.
4. **Audio Design**:
   - Carefully selected sound effects contribute to the game's nostalgic atmosphere without being overwhelming.

---

### Challenges:
Throughout development, some aspects required extra attention:
1. Implementing a specific standard deviation of failure for the AI behavior that could challenge players without feeling impossible.
2. Learning Lua and implementing the functions that come with Love.
3. Structuring code in a modular way for easy maintenance and scalability.

---

This README was crafted with the intention of providing clear, detailed, and helpful documentation for anyone exploring my Pong game project. I hope you enjoy this retro gaming experience as much as I enjoyed building it!
package com.adriana.snakegame.models;

import javax.swing.JFrame;

public class SnakeGame extends JFrame {

    private static final long serialVersionUID = 1L;

	public SnakeGame() {
        setTitle("Snake Game");
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setResizable(false);
        add(new GamePanel());
        pack();
        setLocationRelativeTo(null);
        setVisible(true);
    }

    public static void main(String[] args) {
        new SnakeGame();
    }
}

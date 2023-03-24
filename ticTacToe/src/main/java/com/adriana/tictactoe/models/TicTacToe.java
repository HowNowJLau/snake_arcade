package com.adriana.tictactoe.models;

import java.awt.*;
import java.awt.event.*;
import java.util.*;
import javax.swing.*;

public class TicTacToe implements ActionListener{
	
	Random random = new Random();
	JFrame frame = new JFrame();
	JPanel title_panel = new JPanel();
	JPanel button_panel = new JPanel();
	JLabel textfield = new JLabel();
	JButton[] buttons = new JButton[9];
	boolean player1_turn = true;
	
	TicTacToe() {
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setSize(800,800);
		frame.getContentPane().setBackground(new Color(50,50,50));
		frame.setLayout(new BorderLayout());
		frame.setVisible(true);
		
		textfield.setBackground(new Color(25,25,25));
		textfield.setForeground(new Color(25,255,0));
		textfield.setFont(new Font("Ink Free", Font.BOLD,75));
		textfield.setHorizontalAlignment(JLabel.CENTER);
		textfield.setText("Tic-Tac-Toe");
		textfield.setOpaque(true);
		
		title_panel.setLayout(new BorderLayout());
		title_panel.setBounds(0,0,800,100);
		
		button_panel.setLayout(new GridLayout(3, 3));
		button_panel.setBackground(new Color(150,150,150));
		
		for(int i=0;i<9;i++) {
			buttons[i] = new JButton();
			button_panel.add(buttons[i]);
			buttons[i].setFont(new Font("MV Boli",Font.BOLD,120));
			buttons[i].setFocusable(false);
			buttons[i].addActionListener(this);
		}
		
		title_panel.add(textfield);
		frame.add(title_panel,BorderLayout.NORTH);
		frame.add(button_panel);
		
		firstTurn();
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		for(int i=0;i<9;i++) {
			if(e.getSource()==buttons[i]) {
				if(player1_turn) {
					if(buttons[i].getText()=="") {
						buttons[i].setForeground(new Color(255,0,0));
						buttons[i].setText("X");
						player1_turn=false;
						textfield.setText("O turn");
						check();
					}
				}
				else {
					if(buttons[i].getText()=="") {
						buttons[i].setForeground(new Color(0,0,255));
						buttons[i].setText("O");
						player1_turn=true;
						textfield.setText("X turn");
						check();
					}
				}
			}
		}
	}
	
	public void firstTurn() {
		
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(random.nextInt(2)==0) {
			player1_turn=true;
			textfield.setText("X turn");
		}
		else {
			player1_turn=false;
			textfield.setText("O turn");
		}
		
	}
	
	public void check() {
	    // Check for a win on rows
	    if (buttons[0].getText().equals(buttons[1].getText()) && buttons[1].getText().equals(buttons[2].getText()) && !buttons[0].getText().equals("")) {
	        if (buttons[0].getText().equals("X")) {
	            xWins(0, 1, 2);
	        } else {
	            oWins(0, 1, 2);
	        }
	    }
	    if (buttons[3].getText().equals(buttons[4].getText()) && buttons[4].getText().equals(buttons[5].getText()) && !buttons[3].getText().equals("")) {
	        if (buttons[3].getText().equals("X")) {
	            xWins(3, 4, 5);
	        } else {
	            oWins(3, 4, 5);
	        }
	    }
	    if (buttons[6].getText().equals(buttons[7].getText()) && buttons[7].getText().equals(buttons[8].getText()) && !buttons[6].getText().equals("")) {
	        if (buttons[6].getText().equals("X")) {
	            xWins(6, 7, 8);
	        } else {
	            oWins(6, 7, 8);
	        }
	    }
	    // Check for a win on columns
	    if (buttons[0].getText().equals(buttons[3].getText()) && buttons[3].getText().equals(buttons[6].getText()) && !buttons[0].getText().equals("")) {
	        if (buttons[0].getText().equals("X")) {
	            xWins(0, 3, 6);
	        } else {
	            oWins(0, 3, 6);
	        }
	    }
	    if (buttons[1].getText().equals(buttons[4].getText()) && buttons[4].getText().equals(buttons[7].getText()) && !buttons[1].getText().equals("")) {
	        if (buttons[1].getText().equals("X")) {
	            xWins(1, 4, 7);
	        } else {
	            oWins(1, 4, 7);
	        }
	    }
	    if (buttons[2].getText().equals(buttons[5].getText()) && buttons[5].getText().equals(buttons[8].getText()) && !buttons[2].getText().equals("")) {
	        if (buttons[2].getText().equals("X")) {
	            xWins(2, 5, 8);
	        } else {
	            oWins(2, 5, 8);
	        }
	    }
	    // Check for a win on diagonals
	    if (buttons[0].getText().equals(buttons[4].getText()) && buttons[4].getText().equals(buttons[8].getText()) && !buttons[0].getText().equals("")) {
	        if (buttons[0].getText().equals("X")) {
	            xWins(0, 4, 8);
	        } else {
	            oWins(0, 4, 8);
	        }
	    }
	    if (buttons[2].getText().equals(buttons[4].getText()) && buttons[4].getText().equals(buttons[6].getText()) && !buttons[2].getText().equals("")) {
	        if (buttons[2].getText().equals("X")) {
	            xWins(2, 4, 6);
	        } else {
	        	oWins(2, 4, 6);
	        }
	        }
	        // Check for a tie
	        boolean tie = true;
	        for (JButton button : buttons) {
	        if (button.getText().equals("")) {
	        tie = false;
	        break;
	        }
	        }
	        if (tie) {
	        textfield.setText("It's a tie!");
	        }
	        }
	
	public void xWins(int a, int b, int c) {
		buttons[a].setBackground(Color.GREEN);
		buttons[b].setBackground(Color.GREEN);
		buttons[c].setBackground(Color.GREEN);
		

	    for (int i = 0; i < 9; i++) {
	        if (i != a && i != b && i != c) {
	            buttons[i].setEnabled(false);
	        }
		    textfield.setText("Player X wins!");
	    }
	}

	public void oWins(int a, int b, int c) {
		buttons[a].setBackground(Color.GREEN);
		buttons[b].setBackground(Color.GREEN);
		buttons[c].setBackground(Color.GREEN);
		
		
	    for (int i = 0; i < 9; i++) {
	        if (i != a && i != b && i != c) {
	            buttons[i].setEnabled(false);
	        }
		    textfield.setText("Player O wins!");
	    }
	}

}

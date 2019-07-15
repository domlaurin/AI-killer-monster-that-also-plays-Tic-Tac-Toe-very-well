1. Write a TicTacToeNode class which uses the Board class from TTT solution.
2. Write a SuperComputerPlayer class which builds on top of ComputerPlayer class from TTT solution.

Phase 1.
1. Create TicTacToeNode class
    # a. this will represent a TTT game-state:
    #     i. store current state of the @board 
    #     i. store @next_mover_mark of the player who will move next
    #     i. store @prev_move_pos, if given
    b. write #children
        i. returns nodes representing all potential game states one move after the current node.
            # a. to do that - iterate through all the positions that are @empty? on the board object.
            # b. for each empty position, create a node by duping the board and putting a @next_mover_mark in the position.
            # c. also, set @prev_move_pos to the position you just marked, for reasons that will make sense when we use it later.
    c. write #losing_node?(evaluator)
        # i. Base Case: the board is over AND
            # a. if WINNER is the opponent, this is a losing node.
            # b. if WINNER is nil or us, this is not a losing node.
        ii. Recursive case:
            a. It is the player's' turn, and all the children nodes are losers for the player (anywhere they move they still lose), OR
            b. It is the opponent's' turn, and one of the children nodes is a losing node for the player (assumes your opponent plays perfectly; they'll' force you to lose if they can).
        NB: a draw (Board#tied?) is NOT a loss, if a node is a draw, losing_node? should return false.
    d. write #winning_node?(evaluator)
        i. Base case: the board is over AND
            a. if WINNER is us, this is a winning node.
            b. if WINNER is nil or the opponent, this is not a winning node.
        ii. Recursive case:
            a. it is the player's' turn, and one of the children nodes is a winning node for the player (we'll' be smart and take that move), OR
            b. it is the opponent's' turn, and all of the children nodes are winning nodes for the player

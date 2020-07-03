
$turn = 1
$win = false
$val_arr = Array[[" "," "," "],[" "," "," "],[" "," "," "]]
class Display
    def initialize();end
    def set_display(val_arr)
        ret_str = ""
        val_arr.each_with_index do |row,ir|
            row.each_with_index do |col,ic|
                if ic == 0
                    ret_str.concat("#{row[ic]}")
                elsif ic == 2
                    ret_str.concat("#{row[ic]} \n")
                else
                    ret_str.concat("|#{row[ic]}|")
                end
            end
            
        end
        puts ret_str
    end
end

class Input
    def initialize()
        d = Display.new
        r = Rules.new
    end
    def set_val_arr()
        print("Enter the square you would like to play on\n")
        set = gets.chomp.split(//) 
        #set = gets.chomp
        row = set[0].to_i
        col = set[1].to_i
        if set.length == 2 && $val_arr[row][col] != "X" && $val_arr[row][col] != "O"
            if $turn % 2 == 0
                $val_arr[row][col] = "X"
            else
                $val_arr[row][col] = "O"
            end
        else
            print("Those are not valid coordinates\n")
            set_val_arr()
        end
    end
end

class Rules
    def initialize();end
    def check_win(arr)
        win_arr = arr
        if win_arr[0][0] == win_arr[0][1] && win_arr[0][1] == win_arr[0][2] && win_arr[0][0] != " "
            $win = true
            print("Congratulations, you won #{win_arr[0][0]}\n")
            return
        elsif win_arr[0][0] == win_arr[1][0] && win_arr[1][0] == win_arr[2][0] && win_arr[0][0] != " "
            $win = true
            print("Congratulations, you wo #{win_arr[0][0]}n\n")
            return
        elsif win_arr[0][0] == win_arr[1][1] && win_arr[1][1] == win_arr[2][2] && win_arr[0][0] != " "
            $win = true
            print("Congratulations, you won #{win_arr[0][0]}\n")
        elsif win_arr[0][2] == win_arr[1][1] && win_arr[1][1] == win_arr[2][0] && win_arr[0][2] != " "
            $win = true
            print("Congratulations, you won #{win_arr[0][2]}\n")
        elsif win_arr[0][1] == win_arr[1][1] && win_arr[1][1] == win_arr[2][1] && win_arr[0][1] != " "
            $win = true
            print("Congratulations, you won #{win_arr[0][1]}\n")
        elsif win_arr[0][1] == win_arr[1][2] && win_arr[1][2] == win_arr[2][2] && win_arr[0][1] != " "
            $win = true
            print("Congratulations, you won #{win_arr[0][1]}\n")
        elsif win_arr[1][0] == win_arr[1][1] && win_arr[1][1] == win_arr[1][2] && win_arr[1][0] != " "
            $win = true
            print("Congratulations, you won #{win_arr[2][0]}\n")
        elsif win_arr[2][0] == win_arr[2][1] && win_arr[2][1] == win_arr[2][2] && win_arr[2][0] != " "
        end
            if $val_arr[0].none?(" ") && $val_arr[1].none?(" ") && $val_arr[2].none?(" ")
                print("Cats game =^.^=\n
                    GAME OVER\n")
                    $win = true
            else
                return
            end
    end
end

class Game
    def initialize()
        d = Display.new
        i = Input.new
        r = Rules.new
        d.set_display($val_arr)
        while !$win do
            if $turn % 2 == 0
                print("X:\n") 
                i.set_val_arr
                d.set_display($val_arr)
                $turn += 1
            else
                print("O:\n")
                i.set_val_arr
                d.set_display($val_arr)
                $turn += 1
            end
            r.check_win($val_arr)
        end
        print("GAME OVER!\n
            Play Again?(y/n)")
        input = gets.chomp
        if input == "y" || input == "Y"
            $val_arr = Array[[" "," "," "],[" "," "," "],[" "," "," "]]
            $win = false
            $game = Game.new
        elsif input == "n" || input == "N"
            return
        end
    end

    
end

$game = Game.new
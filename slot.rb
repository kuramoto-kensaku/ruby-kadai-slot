class Slot_machine
  
  def initialize
    @@coin = 100
    @@point = 0
    
    loop do
      puts "-------------------------"
      puts "残りコイン数：#{@@coin}"
      puts "ポイント：#{@@point}"
      puts "何コイン入れますか？"
      puts "0(10コイン) 1(20コイン) 2(50コイン) 3(やめとく...)"
      puts "-------------------------"
      @input_coin = gets.to_i
      
      @select_coins = [10,20,50,"やめとく"]
      
      if @input_coin == 3
        puts "ゲームを終了します。"
        puts "最終ポイント:#{@@point}"
        break
      elsif @input_coin == 0 || @input_coin == 1 || @input_coin == 2
        if @select_coins[@input_coin] > @@coin
          puts "手持ちのコイン内で選んでください。"
          next
        end
        puts "あなたは#{@select_coins[@input_coin]}コイン入れました。"
        puts "エンターを3回押しましょう！"
        slot_plog
          if @@coin == 0
            puts "手持ちが無くなりました。ゲーム終了です。"
            puts "最終ポイント:#{@@point}"
            break
          end
      else
        puts "0~3のどれかを押してください。"
        next
      end
    end
    
  end
  
  
  def slot_plog
    @num1 = rand(1..9)
    @num2 = rand(1..9)
    @num3 = rand(1..9)
    @num4 = rand(1..9)
    @num5 = rand(1..9)
    @num6 = rand(1..9)
    @num7 = rand(1..9)
    @num8 = rand(1..9)
    @num9 = rand(1..9)
    
    puts = gets
    puts "-------------------------"
    puts "|#{@num1}|||"
    puts "|#{@num4}|||"
    puts "|#{@num7}|||"
    puts = gets
    puts "-------------------------"
    puts "|#{@num1}|#{@num2}||"
    puts "|#{@num4}|#{@num5}||"
    puts "|#{@num7}|#{@num8}||"
    puts = gets
    puts "-------------------------"
    puts "|#{@num1}|#{@num2}|#{@num3}|"
    puts "|#{@num4}|#{@num5}|#{@num6}|"
    puts "|#{@num7}|#{@num8}|#{@num9}|"
    puts "-------------------------"
    
    if (@num1 == @num2 && @num1 == @num3) || (@num4 == @num5 && @num4 == @num6) || (@num7 == @num8 && @num7 == @num9)
      puts "横のラインが揃いました！"
      lines_align
    elsif (@num1 == @num5 && @num1 == @num9) || (@num7 == @num5 && @num7 == @num3)
      puts "斜めのラインが揃いました！"
      lines_align
    else
      puts "残念！揃いませんでした。"
      @@coin = @@coin - @select_coins[@input_coin]
    end
  end
  
  
  
  def lines_align
    puts "#{@select_coins[@input_coin]*10}ポイント獲得！！"
    @@point = @@point + @select_coins[@input_coin]*10
    puts "#{@select_coins[@input_coin]*4}コイン獲得！！"
    @@coin = @@coin + @select_coins[@input_coin]*3
  end  
  
end

Slot_machine.new
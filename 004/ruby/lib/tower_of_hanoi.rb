module TowerOfHanoi
  class Tower
  	attr_accessor :rod0, :rod1, :rod2

		# iterative solution
		def init(number_of_pieces)
			@rod0 = []
			@rod1 = []
			@rod2 = []
			this_move = ""
			last_move = ""
			loop_count = 0
			max_loop_count = 100

			solution_array = order_pieces(number_of_pieces)
			@rod0 = solution_array
			show_towers(loop_count)

			# first move
			(number_of_pieces.odd?) ?  move_piece(0, 1, '')	: move_piece(0, 2, '')
			loop_count += 1
			show_towers(loop_count)
			
 			
 			# loop through all moves after first
 			begin
 				begin
 					p0 = @rod0.last
 					p1 = @rod1.last
 					p2 = @rod2.last
 					this_move = ""
 					this_move = "move_0_1" if this_move == "" && valid_even_odd(p0, p1) == true && last_move != "move_1_0"
					this_move = "move_0_2" if this_move == "" && valid_even_odd(p0, p2) == true && last_move != "move_2_0"
					this_move = "move_1_0" if this_move == "" && valid_even_odd(p1, p0) == true && last_move != "move_0_1"
					this_move = "move_1_2" if this_move == "" && valid_even_odd(p1, p2) == true && last_move != "move_2_1"
					this_move = "move_2_0" if this_move == "" && valid_even_odd(p2, p0) == true && last_move != "move_0_2"
					this_move = "move_2_1" if this_move == "" && valid_even_odd(p2, p1) == true && last_move != "move_1_2"
					raise Exception.new("no valid moves") if this_move == ""

	 				last_move = move_piece(0, 1, this_move) if this_move == "move_0_1"
	 				last_move = move_piece(0, 2, this_move) if this_move == "move_0_2"
	 				last_move = move_piece(1, 0, this_move) if this_move == "move_1_0"
	 				last_move = move_piece(1, 2, this_move) if this_move == "move_1_2"
	 				last_move = move_piece(2, 0, this_move) if this_move == "move_2_0"
	 				last_move = move_piece(2, 1, this_move) if this_move == "move_2_1"
	 				loop_count += 1
					show_towers(loop_count)

					raise Exception.new("max loop_count #{max_loop_count} reached") if loop_count >= max_loop_count

 				end while last_move == ""

 			end while @rod2 != solution_array
		end


		def order_pieces(number_of_pieces)
			(1..number_of_pieces).to_a.reverse 
		end

		def valid_even_odd(a,b)
			return false if a == nil
			#return true if b == nil
			return false if a.even? && b.to_i.even?
			return false if a.odd? && b.to_i.odd?
			true
		end

		def move_piece(source, destination, this_move)
			my_piece = eval("rod#{source}").last
			instance_variable_set("@rod#{source}",  eval("@rod#{source}")[0..-2])
			instance_variable_set("@rod#{destination}",  eval("@rod#{destination}") << my_piece)
			this_move
		end

		def show_towers(loop_count)
			puts @rod0.to_s
      puts @rod1.to_s
      puts @rod2.to_s
		  puts "loop #{loop_count}-----------"
		end
  end
end

require 'spec_helper'

module TowerOfHanoi
  describe Tower do

  	it 'builds the first tower' do
  		my_tower = Tower.new
  		rod1 = my_tower.order_pieces(5)
  		expect(rod1).to eq([5,4,3,2,1])
  	end

    it 'is a valid move' do   
      rod0 = [4,2,3]
      rod1 = [5,6,2]
      rod2 = [1]   
      my_tower = Tower.new
      move = my_tower.valid_even_odd(rod0.last, rod1.last)
      expect(move).to be(true)
    end

    it 'is not a valid move' do   
      rod0 = [4,2,3]
      rod1 = [5,6,2]
      rod2 = [1]   
      my_tower = Tower.new
      move = my_tower.valid_even_odd(rod0.last, rod2.last)
      expect(move).to be(false)
    end

    it 'moves piece 0 to 1' do   
      my_tower = Tower.new
      my_tower.rod0 = [4,2,3]
      my_tower.rod1 = [5,6,2]
      my_tower.rod2 = [1]   
      move = my_tower.move_piece(0, 1, "")
      expect(my_tower.rod0).to eq([4,2])
      expect(my_tower.rod1).to eq([5,6,2,3])
    end

    it 'handles nil' do
      rod0 = []
      rod1 = [3, 4, 5]
      rod2 = [1, 2]
      my_tower = Tower.new
      puts my_tower.valid_even_odd(rod0.last, rod1.last)
    end


    it 'shows result' do
      my_tower = Tower.new
      my_tower.init(6)
      puts my_tower.rod0.to_s
      puts my_tower.rod1.to_s
      puts my_tower.rod2.to_s
    end
  end
end

class Guest

  attr_reader :name, :fav_song, :wallet

    def initialize(guest_hash)
      @name = guest_hash[:name]
      @wallet = guest_hash[:wallet]
      @fav_song = guest_hash[:fav_song]
    end

    def check_money(amount)
      return amount <= wallet
    end
    def show_money
      return wallet
    end
    def check_fav_song
      return fav_song
    end
    def take_money(amount)
       @wallet -= amount if check_money(amount)
    end
    def whoop
      "Whoop! Whoop!, Favourite Song!!!"
    end


    # def move_room(room)
    #   if wallet >= room.cost
    #     room.try_room
    #   end
    # end
end

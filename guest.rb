class Guest

  attr_reader :name, :fav_song, :wallet

    def initialize(guest_hash)
      @name = guest_hash[:name]
      @wallet = guest_hash[:wallet]
      @fav_song = guest_hash[:fav_song]
    end

    def check_money(amount)
      # Allows guest to verify they have enough money to buy something without revealing value.
      return amount <= wallet
    end

    def take_money(amount)
       # Deduct amount from wallet for purchase.
       @wallet -= amount if check_money(amount)
    end
    def whoop
      # Allows customer to express glee when favourite song is played 
      "Whoop! Whoop!, Favourite Song!!!"
    end
end
